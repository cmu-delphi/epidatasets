library(dplyr)
library(epidatr)

source(here::here("data-raw/_helper.R"))

d <- as.Date("2024-03-20")

behav_ind_mask <- pub_covidcast(
  source = "fb-survey",
  signals = "smoothed_wwearing_mask_7d",
  time_type = "day",
  geo_type = "state",
  time_values = epirange(20210604, 20211231),
  geo_values = "ca,fl,tx,ny,nj",
  as_of = d
)  %>%
  select(geo_value, time_value, masking = value)

behav_ind_distancing <- pub_covidcast(
  source = "fb-survey",
  signals = "smoothed_wothers_distanced_public",
  time_type = "day",
  geo_type = "state",
  time_values = epirange(20210604, 20211231),
  geo_values = "ca,fl,tx,ny,nj",
  as_of = d
)  %>%
  select(geo_value, time_value, distancing = value)

ctis_covid_behaviours_dt <- behav_ind_mask %>%
  full_join(behav_ind_distancing, by = c("geo_value", "time_value")) %>%
  as_tibble()

# We're trying to do:
#   usethis::use_data(ctis_covid_behaviours_dt, internal = TRUE, overwrite = TRUE, compress = "xz")
# but `usethis::use_data` can only store multiple objects if they're added in
# the same call. This workaround is from
# https://github.com/r-lib/usethis/issues/1512
save_to_sysdata(ctis_covid_behaviours_dt, "ctis_covid_behaviours_dt")
