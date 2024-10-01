library(dplyr)
library(epidatr)

source(here::here("data-raw/_helper.R"))

d <- as.Date("2024-03-20")

x <- pub_covidcast(
  source = "jhu-csse",
  signals = "confirmed_7dav_incidence_prop",
  time_type = "day",
  geo_type = "state",
  time_values = epirange(20201201, 20211231),
  geo_values = "*",
  as_of = d
) %>%
  select(geo_value, time_value, case_rate = value)

y <- pub_covidcast(
  source = "jhu-csse",
  signals = "deaths_7dav_incidence_prop",
  time_type = "day",
  geo_type = "state",
  time_values = epirange(20201201, 20211231),
  geo_values = "*",
  as_of = d
) %>%
  select(geo_value, time_value, death_rate = value)

covid_case_death_rates_tbl <- x %>%
  full_join(y, by = c("geo_value", "time_value")) %>%
  as_tibble()

# We're trying to do:
#   usethis::use_data(covid_case_death_rates_tbl, internal = TRUE, overwrite = TRUE, compress = "xz")
# but `usethis::use_data` can only store multiple objects if they're added in
# the same call. This workaround is from
# https://github.com/r-lib/usethis/issues/1512
save_to_sysdata(covid_case_death_rates_tbl, "covid_case_death_rates_tbl")
