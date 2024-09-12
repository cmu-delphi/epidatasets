delayedAssign("archive_cases_dv_subset", local({
  if (requireNamespace("epiprocess", quietly = TRUE)) {
    epiprocess::as_epi_archive(epidatasets:::archive_cases_dv_subset_dt, compactify = FALSE)
  } else {
    epidatasets:::archive_cases_dv_subset_dt
  }
}))
