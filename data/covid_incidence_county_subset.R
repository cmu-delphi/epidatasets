delayedAssign("covid_incidence_county_subset", local({
  if (requireNamespace("epiprocess", quietly = TRUE)) {
    d <- as.Date("2024-03-20")
    epiprocess::as_epi_df(epidatasets:::covid_incidence_county_subset_tbl, as_of = d)
  } else {
    warning("Since the package `epiprocess` is not installed, this object will be loaded as a tibble (class `tbl_df`)")
    epidatasets:::covid_incidence_county_subset_tbl
  }
}))
