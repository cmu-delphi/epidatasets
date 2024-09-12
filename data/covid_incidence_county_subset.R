delayedAssign("covid_incidence_county_subset", local({
  if (requireNamespace("epiprocess", quietly = TRUE)) {
    d <- as.Date("2024-03-20")
    epiprocess::as_epi_df(epidatasets:::covid_incidence_county_subset_dt, as_of = d)
  } else {
    epidatasets:::covid_incidence_county_subset_dt
  }
}))
