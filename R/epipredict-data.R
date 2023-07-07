#' JHU daily COVID-19 cases and deaths from all states
#'
#' This data source of confirmed COVID-19 cases and deaths is based on reports
#' made available by the Center for Systems Science and Engineering at Johns
#' Hopkins University, as downloaded from the CMU Delphi COVIDcast Epidata
#' API. This example data ranges from Dec 31, 2020 to Dec 31, 2021, and
#' includes all states.
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
#' @source United States Census Bureau, Population Division, at
#'   \url{https://www2.census.gov/programs-surveys/popest/datasets/2010-2019/counties/totals/co-est2019-alldata.pdf},
#'   \url{https://www.census.gov/data/tables/time-series/demo/popest/2010s-total-puerto-rico-municipios.html},
#'   and \url{https://www.census.gov/data/tables/2010/dec/2010-island-areas.html}
#'   This data is public domain.
"state_census"

# Epipredict Vignette Data ----------------------------------------------------

#' Subset of CTIS COVID-19 behaviours from 5 states
#'
#' Data set for a handful of states on masking and distancing behaviours
#' during the COVID-19 Pandemic, and downloaded from the CMU Delphi COVIDcast
#' Epidata API. This data set covers the period from June to December 2021,
#' and is limited to California, Florida, Texas, New Jersey, and New York.
#'
#' @format A tibble with 1,055 rows and 4 variables:
#' \describe{
#'   \item{geo_value}{the geographic value associated with each row
#'       of measurements.}
#'   \item{time_value}{the time value associated with each row of measurements.}
#'   \item{masking}{Estimated percentage of people who wore a mask for most or all of the time while in public in the past 7 days; those not in public in the past 7 days are not counted.}
#'   \item{distancting}{Estimated percentage of respondents who reported that all or most people they enountered in public in the past 7 days maintained a distance of at least 6 feet. Respondents who said that they have not been in public for the past 7 days are excluded.}
#' }
#'
#' @source Data from Delphi COVIDcast. Obtained via the Delphi Epidata API.
#'   \url{https://cmu-delphi.github.io/delphi-epidata/api/covidcast.html}. This
#'   object contains a modified part of the
#'   \href{https://cmu-delphi.github.io/delphi-epidata/symptom-survey/#covid-19-trends-and-impact-survey}{data
#'   aggregations in the API} that are prepared from the
#'   \href{https://www.pnas.org/doi/full/10.1073/pnas.2111454118}{COVID-19
#'   Trends and Impact Survey}; see the first link for more information on
#'   citing in publications. These aggregations are licensed under the terms of
#'   the \href{https://creativecommons.org/licenses/by/4.0/}{Creative Commons
#'   Attribution license}.
#'
#' Modifications:
#' * Selected a small subset of the available data.
#' * Changed to wide format.
#'
#' Delphi Group at Carnegie Mellon University
"ctis_covid_behaviours"

#' Subset of COVID-19 incident cases and deaths from 5 states
#'
#' Data set for 5 states containing COVID-19 Incident Cases and Deaths as
#' reported by JHU-CSSE and downloaded from the CMU Delphi COVIDcast Epidata
#' API. This data set covers the period from June 2021 to December 2021, and
#' is limited to California, Florida, Texas, New Jersey, and New York.
#'
#' @format A tibble with 1,055 rows and 4 variables:
#' \describe{
#'   \item{geo_value}{the geographic value associated with each row
#'       of measurements.}
#'   \item{time_value}{the time value associated with each row of measurements.}
#'   \item{cases}{Number of new confirmed COVID-19 cases, daily}
#'   \item{deaths}{Number of new confirmed COVID-19 deaths, daily}
#' }
#'
#' @source This object contains a modified part of the \href{https://github.com/CSSEGISandData/COVID-19}{COVID-19 Data Repository by the Center for Systems Science and Engineering (CSSE) at Johns Hopkins University}
#' as \href{https://cmu-delphi.github.io/delphi-epidata/api/covidcast-signals/jhu-csse.html}{republished in the COVIDcast Epidata API}.
#' This data set is licensed under the terms of the
#' \href{https://creativecommons.org/licenses/by/4.0/}{Creative Commons Attribution 4.0 International license}
#' by the Johns Hopkins University on behalf of its Center for Systems Science in Engineering.
#' Copyright Johns Hopkins University 2020.
"counts_subset"
