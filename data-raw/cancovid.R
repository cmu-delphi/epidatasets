## code to prepare `cancovid` dataset goes here

library(dplyr)
library(epiprocess)
library(readr)
library(purrr)


# Steps
# - Run <get_hist.sh> to get the data. Stored in <updates.nosync/> folder
# - <modify_csv.R> request and construct data
# - <proc_dat.R> make data into "reported" and "revised" format
# - reported-revised format data can be found in <intermediate/changes.csv>
#
# Name of each csv file match with the last date of that
# csv file only starts from 11-13-2021. Therefore, csv file names shouldn't be
# used as date index, but rather, the last date of each csv file.


path_to_csvs <- here::here("data-raw/updates.nosync/")
files <- list.files(path_to_csvs)

fc_time_values <- seq(as.Date("2021-02-01"), as.Date("2021-12-01"),
                      by = "1 month")
ca_as_ofs <- as.Date(substr(files, 1, 10)) %>%
  intersect(fc_time_values) %>%
  as.Date(origin = "1970-01-01")

# From https://github.com/mountainMath/BCCovidSnippets/blob/main/data/prov_pop.csv
ca_pop_url <- "https://raw.githubusercontent.com/mountainMath/BCCovidSnippets/main/data/prov_pop.csv"
ca_pop <- read_csv(ca_pop_url) %>% 
  rename(province = Province, abbreviation = shortProvince, population = Population)
abbrev_map <- setNames(ca_pop$province, ca_pop$abbreviation)

can <- purrr::map(ca_as_ofs, function(.x) {
  raw <- readr::read_csv(
    here::here(path_to_csvs, paste0(.x, ".csv")),
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
    select(geo_value, time_value, case_rate) %>%
    as_epi_df(geo_type = "province", as_of = .x)
  
  return(result)
})
names(can) <- ca_as_ofs
cancovid <- can %>% bind_rows(.id = "version") %>%
  mutate(version = lubridate::ymd(version))

usethis::use_data(cancovid, overwrite = TRUE)
