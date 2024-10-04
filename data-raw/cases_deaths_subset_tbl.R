library(dplyr)
library(epidatr)

source(here::here("data-raw/_helper.R"))

d <- as.Date("2024-03-20")

confirmed_7dav_incidence_prop <- pub_covidcast(
  source = "jhu-csse",
  signals = "confirmed_7dav_incidence_prop",
  time_type = "day",
  geo_type = "state",
  time_values = epirange(20200301, 20211231),
  geo_values = "ca,fl,ny,tx,ga,pa",
  as_of = d
) %>%
  select(geo_value, time_value, case_rate_7d_av = value) %>%
  arrange(geo_value, time_value)

deaths_7dav_incidence_prop <- pub_covidcast(
  source = "jhu-csse",
  signals = "deaths_7dav_incidence_prop",
  time_type = "day",
  geo_type = "state",
  time_values = epirange(20200301, 20211231),
  geo_values = "ca,fl,ny,tx,ga,pa",
  as_of = d
) %>%
  select(geo_value, time_value, death_rate_7d_av = value) %>%
  arrange(geo_value, time_value)

confirmed_incidence_num <- pub_covidcast(
  source = "jhu-csse",
  signals = "confirmed_incidence_num",
  time_type = "day",
  geo_type = "state",
  time_values = epirange(20200301, 20211231),
  geo_values = "ca,fl,ny,tx,ga,pa",
  as_of = d
) %>%
  select(geo_value, time_value, cases = value) %>%
  arrange(geo_value, time_value)

confirmed_7dav_incidence_num <- pub_covidcast(
  source = "jhu-csse",
  signals = "confirmed_7dav_incidence_num",
  time_type = "day",
  geo_type = "state",
  time_values = epirange(20200301, 20211231),
  geo_values = "ca,fl,ny,tx,ga,pa",
  as_of = d
) %>%
  select(geo_value, time_value, cases_7d_av = value) %>%
  arrange(geo_value, time_value)

cases_deaths_subset_tbl <- confirmed_7dav_incidence_prop %>%
  full_join(deaths_7dav_incidence_prop,
            by = c("geo_value", "time_value")) %>%
  full_join(confirmed_incidence_num,
            by = c("geo_value", "time_value")) %>%
  full_join(confirmed_7dav_incidence_num,
            by = c("geo_value", "time_value")) %>%
  as_tibble()

# We're trying to do:
#   usethis::use_data(cases_deaths_subset_tbl, internal = TRUE, overwrite = TRUE, compress = "xz")
# but `usethis::use_data` can only store multiple objects if they're added in
# the same call. This workaround is from
# https://github.com/r-lib/usethis/issues/1512
save_to_sysdata(cases_deaths_subset_tbl, "cases_deaths_subset_tbl")
