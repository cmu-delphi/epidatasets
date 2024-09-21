delayedAssign("county_smoothed_cli_comparison", local({
  if (requireNamespace("epiprocess", quietly = TRUE)) {
    d <- as.Date("2020-09-21")
    epiprocess::as_epi_df(epidatasets:::county_smoothed_cli_comparison_dt, as_of = d)
  } else {
    warning("Since the package `epiprocess` is not installed, this object will be loaded as a tibble (class `tbl_df`)")
    epidatasets:::county_smoothed_cli_comparison_dt
  }
}))
