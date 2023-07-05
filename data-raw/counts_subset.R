## code to prepare jhu_incidence_num dataset goes here

library(dplyr)
library(epidatr)
library(epiprocess)

x <- covidcast(
  data_source = "jhu-csse",
  signals = "confirmed_incidence_num",
  time_type = "day",
  geo_type = "state",
  time_values = epirange(20210604, 20211231),
  geo_values = "ca,fl,tx,ny,nj") %>%
  fetch() %>%
  select(geo_value, time_value, cases = value)

y <- covidcast(
  data_source = "jhu-csse",
  signals = "deaths_incidence_num",
  time_type = "day",
  geo_type = "state",
  time_values = epirange(20210604, 20211231),
  geo_values = "ca,fl,tx,ny,nj") %>%
  fetch() %>%
  select(geo_value, time_value, deaths = value)

counts_subset <- full_join(x, y, by = c("geo_value", "time_value")) %>%
  as_epi_df()

usethis::use_data(counts_subset, overwrite = TRUE)
