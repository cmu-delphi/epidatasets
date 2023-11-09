library(dplyr)
library(epidatr)

jhu_confirmed_cumulative_num <- pub_covidcast(
  source = "jhu-csse",
  signals = "confirmed_cumulative_num",
  time_type = "day",
  geo_type = "state",
  time_values = epirange(20200301, 20220131),
  geo_values = "ca,fl,ny,tx"
)

usethis::use_data(jhu_confirmed_cumulative_num, overwrite = TRUE)
