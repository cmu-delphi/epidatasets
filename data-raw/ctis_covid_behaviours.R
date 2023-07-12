## code to prepare `ctis_covid_behaviours` dataset goes here

behav_ind_mask <- covidcast(
  data_source = "fb-survey",
  signals = "smoothed_wwearing_mask_7d",
  time_type = "day",
  geo_type = "state",
  time_values = epirange(20210604, 20211231),
  geo_values = "ca,fl,tx,ny,nj")  %>%
  fetch() %>%
  select(geo_value, time_value, masking = value)

behav_ind_distancing <- covidcast(
  data_source = "fb-survey",
  signals = "smoothed_wothers_distanced_public",
  time_type = "day",
  geo_type = "state",
  time_values = epirange(20210604, 20211231),
  geo_values = "ca,fl,tx,ny,nj")  %>%
  fetch() %>%
  select(geo_value, time_value, distancing = value)

pop_dat <- state_census %>% select(abbr, pop)

ctis_covid_behaviours <- behav_ind_mask %>%
  full_join(behav_ind_distancing, by = c("geo_value", "time_value"))

usethis::use_data(ctis_covid_behaviours, overwrite = TRUE)