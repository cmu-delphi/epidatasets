library(dplyr)
library(epidatr)
library(epiprocess)

source(here::here("data-raw/_helper.R"))

dv_subset <- pub_covidcast(
  source = "doctor-visits",
  signals = "smoothed_adj_cli",
  time_type = "day",
  geo_type = "state",
  time_values = epirange(20200601, 20211201),
  geo_values = "*",
  issues = epirange(20200601, 20211201)
) %>%
  select(geo_value, time_value, version = issue, percent_cli = value) %>%
  # Drop DC and territories.
  filter(!(geo_value %in% c("as", "gu", "dc", "mp", "pr", "vi"))) %>%
  # We're using compactify=FALSE here and below to avoid some testthat test
  # failures on tests that were based on a non-compactified version.
  as_epi_archive(compactify = FALSE)

case_rate_subset <- pub_covidcast(
  source = "jhu-csse",
  signals = "confirmed_7dav_incidence_prop",
  time_type = "day",
  geo_type = "state",
  time_values = epirange(20200601, 20211201),
  geo_values = "*",
  issues = epirange(20200601, 20211201)
) %>%
  select(geo_value, time_value, version = issue, case_rate_7d_av = value) %>%
  filter(!(geo_value %in% c("as", "gu", "dc", "mp", "pr", "vi"))) %>%
  as_epi_archive(compactify = FALSE)

# Use `epiprocess::epix_merge` to avoid having to reimplement `sync`ing
# behavior. After merging, convert DT component back to tibble.
archive_cases_dv_subset_all_states_tbl = epix_merge(
  dv_subset, case_rate_subset,
  sync = "locf",
  compactify = TRUE)$DT %>%
  as_tibble()

# We're trying to do:
#   usethis::use_data(archive_cases_dv_subset_all_states_tbl, internal = TRUE, overwrite = TRUE, compress = "xz")
# but `usethis::use_data` can only store multiple objects if they're added in
# the same call. This workaround is from
# https://github.com/r-lib/usethis/issues/1512
save_to_sysdata(archive_cases_dv_subset_all_states_tbl, "archive_cases_dv_subset_all_states_tbl")
