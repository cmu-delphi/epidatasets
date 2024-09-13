delayedAssign("can_prov_cases", local({
  if (requireNamespace("epiprocess", quietly = TRUE)) {
    epiprocess::as_epi_archive(epidatasets:::can_prov_cases_dt, compactify = FALSE)
  } else {
    warning("Since the package `epiprocess` is not installed, this object will be loaded as a tibble (class `tbl_df`)")
    epidatasets:::can_prov_cases_dt
  }
}))
