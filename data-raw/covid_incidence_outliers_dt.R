library(dplyr)
library(epidatr)

source(here::here("data-raw/_helper.R"))

d <- as.Date("2021-10-28")

covid_incidence_outliers_dt <- pub_covidcast(
  source = "jhu-csse",
  signals = "confirmed_incidence_num",
  time_type = "day",
  geo_type = "state",
  time_values = epirange(20200601, 20210531),
  geo_values = "fl,nj",
  as_of = d
) %>%
  select(geo_value, time_value, cases = value) %>%
  as_tibble()

# We're trying to do:
#   usethis::use_data(covid_incidence_outliers_dt, internal = TRUE, overwrite = TRUE)
# but `usethis::use_data` can only store multiple objects if they're added in
# the same call. This workaround is from
# https://github.com/r-lib/usethis/issues/1512
save_to_sysdata(covid_incidence_outliers_dt, "covid_incidence_outliers_dt")
