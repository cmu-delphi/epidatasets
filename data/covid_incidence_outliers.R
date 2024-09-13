delayedAssign("covid_incidence_outliers", local({
  if (requireNamespace("epiprocess", quietly = TRUE)) {
    d <- as.Date("2021-10-28")
    epiprocess::as_epi_df(epidatasets:::covid_incidence_outliers_dt, as_of = d)
  } else {
    warning("Since the package `epiprocess` is not installed, this object will be loaded as a tibble (class `tbl_df`)")
    epidatasets:::covid_incidence_outliers_dt
  }
}))
