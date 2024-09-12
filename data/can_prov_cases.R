delayedAssign("can_prov_cases", local({
  if (requireNamespace("epiprocess", quietly = TRUE)) {
    epiprocess::as_epi_archive(epidatasets:::can_prov_cases_dt, compactify = FALSE)
  } else {
    epidatasets:::can_prov_cases_dt
  }
}))
