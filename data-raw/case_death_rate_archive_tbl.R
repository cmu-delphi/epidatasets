library(dplyr)
library(epidatr)
library(epiprocess)

source(here::here("data-raw/_helper.R"))

states <- "*"
fc_time_values <- seq(
  from = as.Date("2020-09-01"),
  to = as.Date("2021-12-31"),
  by = "1 month"
)

confirmed_incidence_prop <- pub_covidcast(
  source = "jhu-csse",
  signals = "confirmed_incidence_prop",
  time_type = "day",
  geo_type = "state",
  time_values = epirange(20200301, 20211231),
  geo_values = states,
  issues = epirange(20000101, 20211231)
) %>%
  select(geo_value, time_value, version = issue, case_rate = value) %>%
  arrange(geo_value, time_value) %>%
  as_epi_archive(compactify = FALSE)

deaths_incidence_prop <- pub_covidcast(
  source = "jhu-csse",
  signals = "deaths_incidence_prop",
  time_type = "day",
  geo_type = "state",
  time_values = epirange(20200301, 20211231),
  geo_values = states,
  issues = epirange(20000101, 20211231)
) %>%
  select(geo_value, time_value, version = issue, death_rate = value) %>%
  arrange(geo_value, time_value) %>%
  as_epi_archive(compactify = FALSE)

# Use `epiprocess::epix_merge` to avoid having to reimplement `sync`ing
# behavior.
case_death_rate_archive_dt <- epix_merge(
  confirmed_incidence_prop, deaths_incidence_prop,
  sync = "locf"
)

# Calculate 7-day averages for case and death rates.
case_death_rate_archive_dt <- case_death_rate_archive_dt %>%
  epix_slide(
    before = 365000L, ref_time_values = fc_time_values,
    function(x, gk, rtv) {
      x %>%
        group_by(geo_value) %>%
        epi_slide_mean(case_rate, before = 6L) %>%
        rename(case_rate_7d_av = slide_value_case_rate) %>%
        epi_slide_mean(death_rate, before = 6L) %>%
        ungroup() %>%
        rename(death_rate_7d_av = slide_value_death_rate)
    }
  ) %>%
  rename(
    version = time_value,
    time_value = slide_value_time_value,
    geo_value = slide_value_geo_value,
    case_rate = slide_value_case_rate,
    death_rate = slide_value_death_rate,
    case_rate_7d_av = slide_value_case_rate_7d_av,
    death_rate_7d_av = slide_value_death_rate_7d_av
  ) %>%
  as_epi_archive(compactify = TRUE)
# Convert DT component back to tibble.
case_death_rate_archive_dt <- case_death_rate_archive_dt$DT %>% 
  as_tibble()

# We're trying to do:
#   usethis::use_data(case_death_rate_archive_dt, internal = TRUE, overwrite = TRUE, compress = "xz")
# but `usethis::use_data` can only store multiple objects if they're added in
# the same call. This workaround is from
# https://github.com/r-lib/usethis/issues/1512
save_to_sysdata(case_death_rate_archive_dt, "case_death_rate_archive_dt")
