delayedAssign("archive_cases_dv_subset", local({
  if (requireNamespace("epiprocess", quietly = TRUE)) {
    epiprocess::as_epi_archive(epidatasets:::archive_cases_dv_subset_tbl, compactify = FALSE)
  } else {
    warning("Since the package `epiprocess` is not installed, this object will be loaded as a tibble (class `tbl_df`)")
    epidatasets:::archive_cases_dv_subset_tbl
  }
}))
