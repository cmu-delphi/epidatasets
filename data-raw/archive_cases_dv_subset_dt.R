library(dplyr)
library(epidatr)
library(epiprocess)

dv_subset <- pub_covidcast(
  source = "doctor-visits",
  signals = "smoothed_adj_cli",
  time_type = "day",
  geo_type = "state",
  time_values = epirange(20200601, 20211201),
  geo_values = "ca,fl,ny,tx",
  issues = epirange(20200601, 20211201)
) %>%
  select(geo_value, time_value, version = issue, percent_cli = value) %>%
  # We're using compactify=FALSE here and below to avoid some testthat test
  # failures on tests that were based on a non-compactified version.
  as_epi_archive(compactify = FALSE)

case_rate_subset <- pub_covidcast(
  source = "jhu-csse",
  signals = "confirmed_7dav_incidence_prop",
  time_type = "day",
  geo_type = "state",
  time_values = epirange(20200601, 20211201),
  geo_values = "ca,fl,ny,tx",
  issues = epirange(20200601, 20211201)
) %>%
  select(geo_value, time_value, version = issue, case_rate_7d_av = value) %>%
  as_epi_archive(compactify = FALSE)

# Use `epiprocess::epix_merge` to avoid having to reimplement `sync`ing
# behavior. After merging, convert DT component back to tibble.
archive_cases_dv_subset_dt = epix_merge(
  dv_subset, case_rate_subset,
  sync = "locf",
  compactify = FALSE)$DT %>%
  as_tibble()

usethis::use_data(archive_cases_dv_subset_dt, internal = TRUE, overwrite = TRUE)
