delayedAssign("covid_case_death_rates", local({
  if (requireNamespace("epiprocess", quietly = TRUE)) {
    d <- as.Date("2024-03-20")
    epiprocess::as_epi_df(epidatasets:::covid_case_death_rates_dt, as_of = d)
  } else {
    warning("Since the package `epiprocess` is not installed, this object will be loaded as a tibble (class `tbl_df`)")
    epidatasets:::covid_case_death_rates_dt
  }
}))
