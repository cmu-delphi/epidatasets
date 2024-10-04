library(dplyr)
library(epidatr)

source(here::here("data-raw/_helper.R"))

d <- "2020-09-21"

case_num <- 200
geos_date <- "2020-05-14"

# Find counties that on 2020-05-14 had >= 200 cases reported.
# For later datasets, we will only keep data for these geos.
geo_values_initial <- pub_covidcast(
  source = "jhu-csse",
  signals = "confirmed_cumulative_num",
  geo_type = "county",
  time_type = "day",
  geo_values = "*",
  time_values = epirange(geos_date, geos_date),
  as_of = d
) %>%
  filter(value >= case_num) %>%
  pull(geo_value) %>%
  unique()

# Fetch county-level Google and Facebook % CLI-in-community signals, and JHU
# confirmed case incidence proportion
start_day <- "2020-04-11"
end_day <- "2020-09-01"

goog_sm_cli <- pub_covidcast(
  source = "google-survey",
  signals = "smoothed_cli",
  geo_type = "county",
  time_type = "day",
  geo_values = "*",
  time_values = epirange(start_day, end_day),
  as_of = d
) %>%
  filter(geo_value %in% geo_values_initial) %>%
  select(geo_value, time_value, value) %>%
  rename(goog = value)

fb_survey <- pub_covidcast(
  source = "fb-survey",
  signals = "smoothed_hh_cmnty_cli",
  geo_type = "county",
  time_type = "day",
  geo_values = "*",
  time_values = epirange(start_day, end_day),
  as_of = d
) %>%
  filter(geo_value %in% geo_values_initial) %>%
  select(geo_value, time_value, value) %>%
  rename(fb = value)

jhu_7dav_incid <- pub_covidcast(
  source = "jhu-csse",
  signals = "confirmed_7dav_incidence_prop",
  geo_type = "county",
  time_type = "day",
  geo_values = "*",
  time_values = epirange(start_day, end_day),
  as_of = d
) %>%
  filter(geo_value %in% geo_values_initial) %>%
  select(geo_value, time_value, value) %>%
  rename(case = value)

# Find "complete" counties, present in all three data signals, and also 
# present in the `geo_values_initial` object.
geo_values_complete <- intersect(
  intersect(goog_sm_cli$geo_value, fb_survey$geo_value),
  jhu_7dav_incid$geo_value
)

# Join the three data frames together
county_smoothed_cli_comparison_tbl <- full_join(
  full_join(goog_sm_cli, fb_survey, by = c("geo_value", "time_value")),
  jhu_7dav_incid,
  by = c("geo_value", "time_value")
) %>%
  filter(geo_value %in% geo_values_complete) %>%
  as_tibble()

# We're trying to do:
#   usethis::use_data(county_smoothed_cli_comparison_tbl, internal = TRUE, overwrite = TRUE, compress = "xz")
# but `usethis::use_data` can only store multiple objects if they're added in
# the same call. This workaround is from
# https://github.com/r-lib/usethis/issues/1512
save_to_sysdata(county_smoothed_cli_comparison_tbl, "county_smoothed_cli_comparison_tbl")
