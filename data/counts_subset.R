delayedAssign("counts_subset", local({
  if (requireNamespace("epiprocess", quietly = TRUE)) {
    d <- as.Date("2024-03-20")
    epiprocess::as_epi_df(epidatasets:::counts_subset_dt, as_of = d)
  } else {
    epidatasets:::counts_subset_dt
  }
}))
