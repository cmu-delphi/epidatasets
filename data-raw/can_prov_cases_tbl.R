## code to prepare `can_prov_cases_tbl` dataset goes here

library(dplyr)
library(readr)
library(purrr)
library(httr)
library(jsonlite)

source(here::here("data-raw/_helper.R"))

# Look for a GitHub API token.
# Returns an empty string "" if env variable not found.
gh_token <- Sys.getenv("GITHUB_PAT")
if (gh_token == "") {
  # Try again with the secondary name.
  gh_token <- Sys.getenv("GITHUB_TOKEN")
}
if (gh_token == "") {
  warning("Token is not set or is not able to be fetched from the environment.",
          " Proceeding without authentication, but the requests may be blocked", 
          " due to GitHub API rate limits.")
}

# Construct a header to send with GET requests
if (gh_token == "") {
  # Empty header
  auth_header <- httr::add_headers()
} else {
  auth_header <- httr::add_headers(Authorization = paste("Bearer", gh_token))
}

## Get list of new and modified files to download
# The `path` field filters commits to only those that modifying the listed dir
# From https://www.github.com/ccodwg/Covid19Canada
BASE_URL <- "https://api.github.com/repos/ccodwg/Covid19Canada/commits?sha=%s&per_page=%s&path=timeseries_prov/cases_timeseries_prov.csv&until=%s&page=%s"
ITEMS_PER_PAGE <- 100
BRANCH <- "master"



# We want to fetch all commits made since Mar 13 2022 (version the original
# dataset was created from).
#
# Timestamp should be in ISO 8601 format. See
# https://docs.github.com/en/rest/reference/commits#list-commits--parameters for
# details.
since_date <- strftime("2022-03-13", "%Y-%m-%dT%H:%M:%SZ", tz = "UTC")

page <- 0
commit_pages <- list()

# Fetch list of commits from API, one page at a time. Each page contains up to
# 100 commits. If a page contains 100 commits, assume that there are more
# results and fetch the next page.
while (page == 0 || nrow(commit_page) == 100) {
  page <- page + 1
  # Construct the URL
  commits_url <- sprintf(BASE_URL, BRANCH, ITEMS_PER_PAGE, since_date, page)
  
  request <- GET(commits_url, auth_header)
  # Convert any HTTP errors to R errors automatically.
  stop_for_status(request)
  
  # Convert results from nested JSON/list to dataframe. If no results returned,
  # `commit_page` will be an empty list.
  commit_page <- content(request, as = "text") %>%
    fromJSON(simplifyDataFrame = TRUE, flatten = TRUE) %>% 
    # Trim message down a bit.
    mutate(message = substr(commit.message, 1, 40)) %>% 
    select(sha, url = commit.url, message)
  
  # No more results are being returned.
  if (identical(commit_page, list())) {
    break
  }
  
  commit_pages[[page]] <- commit_page
}

# Combine all requested pages of commits into one dataframe
commit_pages <- bind_rows(commit_pages)

# Missing value `%s` to be filled in with a commit sha or branch name.
BASE_DATA_URL <- "https://raw.githubusercontent.com/ccodwg/Covid19Canada/%s/timeseries_prov/cases_timeseries_prov.csv"

fc_time_values <- seq(as.Date("2021-02-01"), as.Date("2021-12-01"),
                      by = "1 month")
commit_pages <- mutate(
  commit_pages,
  data_url = sprintf(BASE_DATA_URL, sha),
  date = strsplit(message, " ") %>% map_chr(~ substr(.x[3], start=1, stop=10)) %>% as.Date()
) %>% 
  # select(data_url, date) %>% 
  na.omit() %>% 
  filter(date %in% fc_time_values)

# From https://github.com/mountainMath/BCCovidSnippets/blob/main/data/prov_pop.csv
ca_pop_url <- "https://raw.githubusercontent.com/mountainMath/BCCovidSnippets/main/data/prov_pop.csv"
ca_pop <- read_csv(
  ca_pop_url,
  col_types = cols(
    Province = col_character(),
    shortProvince = col_character(),
    Population = col_integer()
  )
) %>% 
  rename(province = Province, abbreviation = shortProvince, population = Population)
abbrev_map <- setNames(ca_pop$province, ca_pop$abbreviation)

# Read in data
can_prov_cases_tbl <- purrr::map2(commit_pages$data_url, commit_pages$date, function(url, date) {
  raw <- readr::read_csv(
    url,
    col_types = cols(
      province = col_character(),
      date_report = col_character(),
      cases = col_double(),
      cumulative_cases = col_double()
    )
  )
  
  # Raw data uses a mix of full names and abbreviations. Switch to using only full names.
  raw$province <- case_when(
    raw$province == "NWT" ~ abbrev_map["NT"],
    raw$province == "PEI" ~ abbrev_map["PE"],
    raw$province %in% ca_pop$province ~ raw$province,
    raw$province %in% ca_pop$abbreviation ~ abbrev_map[raw$province],
    # Mark everything else as missing. Only applies to "Repatriated" region.
    TRUE ~ NA
  )
  
  result <- raw %>% 
    mutate(time_value = lubridate::dmy(date_report)) %>%
    left_join(ca_pop, by="province") %>%
    filter(!is.na(province), time_value > "2020-04-01") %>%
    mutate(geo_value = province,
           case_rate = cases / population * 1e5) %>%
    select(geo_value, time_value, case_rate)
  
  return(result)
})

names(can_prov_cases_tbl) <- commit_pages$date
can_prov_cases_tbl <- can_prov_cases_tbl %>% bind_rows(.id = "version") %>%
  mutate(version = lubridate::ymd(version)) %>% 
  arrange(version) %>%
  as_tibble()

# We're trying to do:
#   usethis::use_data(can_prov_cases_tbl, internal = TRUE, overwrite = TRUE, compress = "xz")
# but `usethis::use_data` can only store multiple objects if they're added in
# the same call. This workaround is from
# https://github.com/r-lib/usethis/issues/1512
save_to_sysdata(can_prov_cases_tbl, "can_prov_cases_tbl")
