library(dplyr)
library(epidatr)

source(here::here("data-raw/_helper.R"))

d <- as.Date("2024-03-20")

x <- pub_covidcast(
  source = "jhu-csse",
  signals = "confirmed_incidence_num",
  time_type = "day",
  geo_type = "state",
  time_values = epirange(20210604, 20211231),
  geo_values = "ca,fl,tx,ny,nj",
  as_of = d
) %>%
  select(geo_value, time_value, cases = value)

y <- pub_covidcast(
  source = "jhu-csse",
  signals = "deaths_incidence_num",
  time_type = "day",
  geo_type = "state",
  time_values = epirange(20210604, 20211231),
  geo_values = "ca,fl,tx,ny,nj",
  as_of = d
) %>%
  select(geo_value, time_value, deaths = value)

counts_subset_dt <- full_join(x, y, by = c("geo_value", "time_value")) %>%
  as_tibble()

# We're trying to do:
#   usethis::use_data(counts_subset_dt, internal = TRUE, overwrite = TRUE)
# but `usethis::use_data` can only store multiple objects if they're added in
# the same call. This workaround is from
# https://github.com/r-lib/usethis/issues/1512
save_to_sysdata(counts_subset_dt, "counts_subset_dt")
