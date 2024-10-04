library(dplyr)
library(epidatr)

source(here::here("data-raw/_helper.R"))

d <- as.Date("2024-03-20")

# Previously, we were using `covidcast::county_census`, but covidcast is large and complicated to install (due to `sf` dependency). Instead, read the file directly from GitHub.
y <- read_csv("https://github.com/cmu-delphi/covidcast/raw/c89e4d295550ba1540d64d2cc991badf63ad04e5/Python-packages/covidcast-py/covidcast/geo_mappings/county_census.csv", # nolint: line_length_linter
  col_types = cols(
    FIPS = col_character(),
    STNAME = col_character(),
    CTYNAME = col_character()
  )
) %>%
  filter(STNAME %in% c("Massachusetts", "Vermont"), STNAME != CTYNAME) %>%
  select(geo_value = FIPS, county_name = CTYNAME, state_name = STNAME)

# Fetch only counties from Massachusetts and Vermont, then append names columns as well
covid_incidence_county_subset_tbl <- pub_covidcast(
  source = "jhu-csse",
  signals = "confirmed_incidence_num",
  time_type = "day",
  geo_type = "county",
  time_values = epirange(20200601, 20211231),
  geo_values = paste(y$geo_value, collapse = ","),
  as_of = d
) %>%
  select(geo_value, time_value, cases = value) %>%
  inner_join(y, by = "geo_value", relationship = "many-to-one", unmatched = c("error", "drop")) %>%
  as_tibble()

# We're trying to do:
#   usethis::use_data(covid_incidence_county_subset_tbl, internal = TRUE, overwrite = TRUE, compress = "xz")
# but `usethis::use_data` can only store multiple objects if they're added in
# the same call. This workaround is from
# https://github.com/r-lib/usethis/issues/1512
save_to_sysdata(covid_incidence_county_subset_tbl, "covid_incidence_county_subset_tbl")
