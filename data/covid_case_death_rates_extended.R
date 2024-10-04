delayedAssign("covid_case_death_rates_extended", local({
  if (requireNamespace("epiprocess", quietly = TRUE)) {
    d <- as.Date("2022-05-31")
    epiprocess::as_epi_df(
      dplyr::bind_rows(
        epidatasets:::covid_case_death_rates_extension_tbl,
        epidatasets:::covid_case_death_rates_tbl
      )
      , as_of = d)
  } else {
    warning("Since the package `epiprocess` is not installed, this object will be loaded as a tibble (class `tbl_df`)")
    dplyr::bind_rows(
      epidatasets:::covid_case_death_rates_extension_tbl,
      epidatasets:::covid_case_death_rates_tbl
    )
  }
}))
