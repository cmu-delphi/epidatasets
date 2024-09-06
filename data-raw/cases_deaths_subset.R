library(dplyr)
library(epidatr)
library(epiprocess)

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

cases_deaths_subset <- confirmed_7dav_incidence_prop %>%
  full_join(deaths_7dav_incidence_prop,
            by = c("geo_value", "time_value")) %>%
  full_join(confirmed_incidence_num,
            by = c("geo_value", "time_value")) %>%
  full_join(confirmed_7dav_incidence_num,
            by = c("geo_value", "time_value")) %>%
  as_epi_df(as_of = d)

usethis::use_data(cases_deaths_subset, overwrite = TRUE)
