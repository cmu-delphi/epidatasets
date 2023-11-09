library(dplyr)
library(epidatr)
library(epiprocess)

covid_incidence_outliers <- pub_covidcast(
  source = "jhu-csse",
  signals = "confirmed_incidence_num",
  time_type = "day",
  geo_type = "state",
  time_values = epirange(20200601, 20210531),
  geo_values = "fl,nj",
  as_of = 20211028
) %>%
  select(geo_value, time_value, cases = value) %>%
  as_epi_df()

usethis::use_data(covid_incidence_outliers, overwrite = TRUE)
