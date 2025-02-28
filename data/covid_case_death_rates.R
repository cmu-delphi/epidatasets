delayedAssign("covid_case_death_rates", local({
  if (requireNamespace("epiprocess", quietly = TRUE)) {
    d <- as.Date("2023-03-10")
    epiprocess::as_epi_df(epidatasets:::covid_case_death_rates_tbl, as_of = d)
  } else {
    warning("Since the package `epiprocess` is not installed, this object will be loaded as a tibble (class `tbl_df`)")
    epidatasets:::covid_case_death_rates_tbl
  }
}))
