library(dplyr)
library(covidcast)
library(epidatr)

source(here::here("data-raw/_helper.R"))

d <- as.Date("2024-03-20")

# Use covidcast::county_census to get the county and state names
y <- covidcast::county_census %>%
  filter(STNAME %in% c("Massachusetts", "Vermont"), STNAME != CTYNAME) %>%
  select(geo_value = FIPS, county_name = CTYNAME, state_name = STNAME)

# Fetch only counties from Massachusetts and Vermont, then append names columns as well
covid_incidence_county_subset_dt <- pub_covidcast(
  source = "jhu-csse",
  signals = "confirmed_incidence_num",
  time_type = "day",
  geo_type = "county",
  time_values = epirange(20200601, 20211231),
  geo_values = paste(y$geo_value, collapse = ","),
  as_of = d
) %>%
  select(geo_value, time_value, cases = value) %>%
  full_join(y, by = "geo_value") %>%
  as_tibble()

# We're trying to do:
#   usethis::use_data(covid_incidence_county_subset_dt, internal = TRUE, overwrite = TRUE, compress = "xz")
# but `usethis::use_data` can only store multiple objects if they're added in
# the same call. This workaround is from
# https://github.com/r-lib/usethis/issues/1512
save_to_sysdata(covid_incidence_county_subset_dt, "covid_incidence_county_subset_dt")
