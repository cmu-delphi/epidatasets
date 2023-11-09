## code to prepare `ctis_covid_behaviours` dataset goes here

library(dplyr)
library(epidatr)

behav_ind_mask <- pub_covidcast(
  source = "fb-survey",
  signals = "smoothed_wwearing_mask_7d",
  time_type = "day",
  geo_type = "state",
  time_values = epirange(20210604, 20211231),
  geo_values = "ca,fl,tx,ny,nj")  %>%
  select(geo_value, time_value, masking = value)

behav_ind_distancing <- pub_covidcast(
  source = "fb-survey",
  signals = "smoothed_wothers_distanced_public",
  time_type = "day",
  geo_type = "state",
  time_values = epirange(20210604, 20211231),
  geo_values = "ca,fl,tx,ny,nj")  %>%
  select(geo_value, time_value, distancing = value)

ctis_covid_behaviours <- behav_ind_mask %>%
  full_join(behav_ind_distancing, by = c("geo_value", "time_value"))

usethis::use_data(ctis_covid_behaviours, overwrite = TRUE)
