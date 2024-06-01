library(epidatr)
library(epiprocess)
library(dplyr)
library(tidyr)

covid_incidence_outliers <- pub_covidcast(
  source = "jhu-csse",
  signals = "confirmed_incidence_num",
  geo_type = "state",
  time_type = "day",
  geo_values = "fl,nj",
  time_values = epirange(20200601, 20210531),
  as_of = 20211028
) %>%
  select(geo_value, time_value, cases = value) %>%
  as_epi_df()

usethis::use_data(covid_incidence_outliers, overwrite = TRUE)
