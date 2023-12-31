#' Subset of JHU daily state cases and deaths
#'
#' This data source of confirmed COVID-19 cases and deaths
#' is based on reports made available by the Center for
#' Systems Science and Engineering at Johns Hopkins University.
#' This example data ranges from Dec 31, 2020 to Dec 31, 2021,
#' and includes all states.
#'
#' @format A tibble with 20,496 rows and 4 variables:
#' \describe{
#'   \item{geo_value}{the geographic value associated with each row
#'       of measurements.}
#'   \item{time_value}{the time value associated with each row of measurements.}
#'   \item{case_rate}{7-day average signal of number of new
#'       confirmed COVID-19 cases per 100,000 population, daily}
#'   \item{death_rate}{7-day average signal of number of new confirmed
#'       deaths due to COVID-19 per 100,000 population, daily}
#' }
#' @source This object contains a modified part of the
#'   \href{https://github.com/CSSEGISandData/COVID-19}{COVID-19 Data Repository by the Center for Systems Science and Engineering (CSSE) at Johns Hopkins University}
#'   as \href{https://cmu-delphi.github.io/delphi-epidata/api/covidcast-signals/jhu-csse.html}{republished in the COVIDcast Epidata API}.
#'   This data set is licensed under the terms of the
#'   \href{https://creativecommons.org/licenses/by/4.0/}{Creative Commons Attribution 4.0 International license}
#'   by the Johns Hopkins University on behalf of its Center for Systems Science
#'   in Engineering. Copyright Johns Hopkins University 2020.
#'
#' Modifications:
#' * \href{https://cmu-delphi.github.io/delphi-epidata/api/covidcast-signals/jhu-csse.html}{From the COVIDcast Epidata API}:
#'   These signals are taken directly from the JHU CSSE
#'   \href{https://github.com/CSSEGISandData/COVID-19}{COVID-19 GitHub repository}
#'   without changes. The 7-day average signals are computed by Delphi by
#'   calculating moving averages of the preceding 7 days, so the signal for
#'   June 7 is the average of the underlying data for June 1 through 7,
#'   inclusive.
"covid_case_death_rates"

#' State population data
#'
#' Data set on state populations, from the 2019 US Census.
#'
#' @format Data frame with 57 rows (including one for the United States as a
#'   whole, plus the District of Columbia, Puerto Rico Commonwealth,
#'   American Samoa, Guam, the U.S. Virgin Islands, and the Northern Mariana,
#'   Islands).
#'
#' \describe{
#'   \item{fips}{FIPS code}
#'   \item{name}{Full name of the state or territory}
#'   \item{pop}{Estimate of the location's resident population in
#'      2019.}
#'   \item{abbr}{Postal abbreviation for the location}
#' }
#'
#' @source United States Census Bureau, at
#'   \url{https://www2.census.gov/programs-surveys/popest/datasets/2010-2019/counties/totals/co-est2019-alldata.pdf},
#'   \url{https://www.census.gov/data/tables/time-series/demo/popest/2010s-total-puerto-rico-municipios.html},
#'   and \url{https://www.census.gov/data/tables/2010/dec/2010-island-areas.html}
"state_census"

# Epipredict Vignette Data ----------------------------------------------------

#' CTIS COVID Behaviours
#'
#' Data set for a handful of states on masking and distancing behaviours
#' during the COVID-19 Pandemic and downloaded from the CMU Delphi COVIDcast
#' Epidata API. This data set covers the period from
#' June to December 2021.
"ctis_covid_behaviours"

#' COVID-19 Incident Cases and Deaths
#'
#' Data set for 5 states containing COVID-19 Incident Cases and Deaths as
#' reported
#' by JHU-CSSE and downloaded from the CMU Delphi COVIDcast Epidata API.
#' This data set covers the period from June 2021 to December 2021, and is
#' used in the [epipredict] Vignette on ... .
#'
#' @source This object contains a modified part of the \href{https://github.com/CSSEGISandData/COVID-19}{COVID-19 Data Repository by the Center for Systems Science and Engineering (CSSE) at Johns Hopkins University} as \href{https://cmu-delphi.github.io/delphi-epidata/api/covidcast-signals/jhu-csse.html}{republished in the COVIDcast Epidata API}. This data set is licensed under the terms of the
#' \href{https://creativecommons.org/licenses/by/4.0/}{Creative Commons Attribution 4.0 International license}
#' by the Johns Hopkins University on behalf of its Center for Systems Science in Engineering.
#' Copyright Johns Hopkins University 2020.
"counts_subset"

#' Canadian COVID-19 case rates
#'
#' Data set for all Canadian provinces and territories containing COVID-19
#' case rates (COVID-19 cases per 100,000 people) derived from COVID-19 case
#' counts as reported by the
#' \href{https://opencovid.ca/}{COVID-19 Canada Open Data Working Group (CCODWG)}.
#' Data is available both through the archived
#' \href{https://github.com/ccodwg/Covid19Canada}{ccodwg/Covid19Canada GitHub repository}
#' and the newer
#' \href{https://github.com/ccodwg/CovidTimelineCanada}{ccodwg/CovidTimelineCanada GitHub repository},
#' which also reports vaccine-related signals.
#'
#' This dataset contains versioned data covering the period from April 2020 to
#' December 2021 and is used in the [epipredict] slide vignette.
#'
#' @source This object contains a modified part of the COVID-19 Canada Open
#' Data Working Group's
#' \href{https://github.com/ccodwg/Covid19Canada}{Covid19Canada data repository} (archived).
#' This data set is licensed under the terms of the
#' \href{https://creativecommons.org/licenses/by/4.0/}{Creative Commons Attribution 4.0 International license}
#' by the COVID-19 Canada Open Data Working Group.
"can_prov_cases"
