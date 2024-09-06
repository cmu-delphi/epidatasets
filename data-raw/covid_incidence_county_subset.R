# Use covidcast::county_census to get the county and state names
library(dplyr)
library(covidcast)
library(epidatr)
library(epiprocess)

y <- covidcast::county_census %>%
  filter(STNAME %in% c("Massachusetts", "Vermont"), STNAME != CTYNAME) %>%
  select(geo_value = FIPS, county_name = CTYNAME, state_name = STNAME)

# Fetch only counties from Massachusetts and Vermont, then append names columns as well
covid_incidence_county_subset <- pub_covidcast(
  source = "jhu-csse",
  signals = "confirmed_incidence_num",
  time_type = "day",
  geo_type = "county",
  time_values = epirange(20200601, 20211231),
  geo_values = paste(y$geo_value, collapse = ",")
) %>%
  select(geo_value, time_value, cases = value) %>%
  full_join(y, by = "geo_value") %>%
  as_epi_df(as_of = as.Date("2024-03-20"))

usethis::use_data(covid_incidence_county_subset, overwrite = TRUE)
