delayedAssign("grad_employ_subset", local({
  if (requireNamespace("epiprocess", quietly = TRUE)) {
    d <- as.Date("2024-09-18")
    epiprocess::as_epi_df(
      epidatasets:::grad_employ_subset_dt,
      as_of = d,
      other_keys = c("age_group", "edu_qual")
    )
  } else {
    warning("Since the package `epiprocess` is not installed, this object will be loaded as a tibble (class `tbl_df`)")
    epidatasets:::grad_employ_subset_dt
  }
}))
