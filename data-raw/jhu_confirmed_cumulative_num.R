library(dplyr)
library(epidatr)

d <- as.Date("2024-03-20")

jhu_confirmed_cumulative_num <- pub_covidcast(
  source = "jhu-csse",
  signals = "confirmed_cumulative_num",
  time_type = "day",
  geo_type = "state",
  time_values = epirange(20200301, 20220131),
  geo_values = "ca,fl,ny,tx",
  as_of = d
)

usethis::use_data(jhu_confirmed_cumulative_num, overwrite = TRUE)
