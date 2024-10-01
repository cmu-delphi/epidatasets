delayedAssign("case_death_rate_archive", local({
  if (requireNamespace("epiprocess", quietly = TRUE)) {
    epiprocess::as_epi_archive(epidatasets:::case_death_rate_archive_tbl, compactify = TRUE)
  } else {
    warning("Since the package `epiprocess` is not installed, this object will be loaded as a tibble (class `tbl_df`)")
    epidatasets:::case_death_rate_archive_tbl
  }
}))
