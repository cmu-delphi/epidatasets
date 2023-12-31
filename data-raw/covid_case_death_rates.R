library(dplyr)
library(epidatr)
library(epiprocess)

x <- pub_covidcast(
  source = "jhu-csse",
  signals = "confirmed_7dav_incidence_prop",
  time_type = "day",
  geo_type = "state",
  time_values = epirange(20200301, 20211231),
  geo_values = "*"
) %>%
  select(geo_value, time_value, case_rate = value)

y <- pub_covidcast(
  source = "jhu-csse",
  signals = "deaths_7dav_incidence_prop",
  time_type = "day",
  geo_type = "state",
  time_values = epirange(20200301, 20211231),
  geo_values = "*"
) %>%
  select(geo_value, time_value, death_rate = value)

covid_case_death_rates <- x %>%
  full_join(y, by = c("geo_value", "time_value")) %>%
  as_epi_df()

usethis::use_data(covid_case_death_rates, overwrite = TRUE)
