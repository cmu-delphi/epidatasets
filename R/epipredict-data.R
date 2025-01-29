#' JHU daily COVID-19 cases and deaths rates from all states
#'
#' This data source of confirmed COVID-19 cases and deaths is based on reports
#' made available by the Center for Systems Science and Engineering at Johns
#' Hopkins University, as downloaded from the CMU Delphi COVIDcast Epidata
#' API. This example data is a snapshot as of March 10, 2023, and
#' ranges from December 31, 2020 to December 31, 2021. It
#' includes all states.
#'
#' @format An [`epiprocess::epi_df`] (object of class `c("epi_df", "tbl_df", "tbl", "data.frame")`) with 20496 rows and 4 columns.
#' @section Data dictionary:
#' The data has columns:
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
#' @format A [`tibble::tibble`] (object of class `c("tbl_df", "tbl", "data.frame")`) with 57 rows and 4 columns.
#' @section Data dictionary:
#' The data includes 57 regions (all US states, the United
#'   States as a whole, the District of Columbia, Puerto Rico Commonwealth,
#'   American Samoa, Guam, the U.S. Virgin Islands, and the Northern Mariana
#'   Islands) with columns:
#'
#' \describe{
#'   \item{fips}{2-digit FIPS code}
#'   \item{name}{Full name of the state or territory}
#'   \item{pop}{Estimate of the location's resident population in
#'      2019.}
#'   \item{abbr}{Postal abbreviation for the location}
#' }
#'
#' @source
#'   This object is derived from several datasets from the United States
#'   Census Bureau, Population Division, at
#'   \url{https://www2.census.gov/programs-surveys/popest/datasets/2010-2019/counties/totals/co-est2019-alldata.pdf},
#'   \url{https://www.census.gov/data/tables/time-series/demo/popest/2010s-total-puerto-rico-municipios.html},
#'    and \url{https://www.census.gov/data/tables/2010/dec/2010-island-areas.html}.
#'    It is made available through the `covidcast` package. This data is
#'    public domain.
"state_census"

# Epipredict Vignette Data ----------------------------------------------------

#' Subset of CTIS COVID-19-related behaviours from 5 states
#'
#' Data set for a handful of states on masking and distancing behaviours
#' during the COVID-19 Pandemic, and downloaded from the CMU Delphi COVIDcast
#' Epidata API. This example data is a snapshot as of March 20, 2024, and
#' ranges from June 4, 2021 to December 31, 2021.
#' It is limited to California, Florida, Texas, New Jersey, and New York.
#'
#' @format An [`epiprocess::epi_df`] (object of class `c("epi_df", "tbl_df", "tbl", "data.frame")`) with 1055 rows and 4 columns.
#' @section Data dictionary:
#' The data has columns:
#' \describe{
#'   \item{geo_value}{the geographic value associated with each row
#'       of measurements.}
#'   \item{time_value}{the time value associated with each row of measurements.}
#'   \item{masking}{Estimated percentage of people who wore a mask for most or all of the time while in public in the past 7 days; those not in public in the past 7 days are not counted.}
#'   \item{distancing}{Estimated percentage of respondents who reported that all or most people they encountered in public in the past 7 days maintained a distance of at least 6 feet. Respondents who said that they have not been in public for the past 7 days are excluded.}
#' }
#'
#' @source
#'   This object contains a modified part of the
#'   \href{https://cmu-delphi.github.io/delphi-epidata/symptom-survey/#covid-19-trends-and-impact-survey}{data
#'   aggregations in the API} that are prepared from the
#'   \href{https://www.pnas.org/doi/full/10.1073/pnas.2111454118}{COVID-19
#'   Trends and Impact Survey}; see the first link for more information on
#'   citing in publications.
#'   The data is made available via the
#'   \href{https://cmu-delphi.github.io/delphi-epidata/}{Delphi Epidata API}.
#'
#'   These aggregations are licensed under the terms of
#'   the \href{https://creativecommons.org/licenses/by/4.0/}{Creative Commons
#'   Attribution license}.
#'
#' Modifications:
#' * The data has been limited to a very small number of rows, the
#'   signal names slightly altered, and formatted into an `epi_df`.
"ctis_covid_behaviours"

#' Subset of COVID-19 incident cases and deaths from 5 states
#'
#' Data set for 5 states containing COVID-19 Incident Cases and Deaths as
#' reported by JHU-CSSE and downloaded from the CMU Delphi COVIDcast Epidata
#' API. This example data is a snapshot as of March 20, 2024, and
#' ranges from June 4, 2021 to December 31, 2021. It
#' is limited to California, Florida, Texas, New Jersey, and New York.
#'
#' @format An [`epiprocess::epi_df`] (object of class `c("epi_df", "tbl_df", "tbl", "data.frame")`) with 1055 rows and 4 columns.
#' @section Data dictionary:
#' The data has columns:
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
#'
#' Modifications:
#' * \href{https://cmu-delphi.github.io/delphi-epidata/api/covidcast-signals/jhu-csse.html}{From the COVIDcast Epidata API}:
#'   The signals are taken directly from the JHU CSSE
#'   \href{https://github.com/CSSEGISandData/COVID-19}{COVID-19 GitHub repository}
#'   without changes.
#' * Furthermore, the data has been limited to a very small number of rows, the
#'   signal names slightly altered, and formatted into an `epi_df`.
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
#' This dataset contains versioned data snapshots from February 1, 2021 to December
#' 1, 2021 covering the period from April 2, 2020 to December 1, 2021. It is
#' used in the epipredict slide vignette.
#'
#' @format An [`epiprocess::epi_archive`]. The DT attribute contains the data formatted as a [`data.table::data.table`] (object of class `c("data.table", "data.frame")`) with 65299 rows and 4 columns.
#' @section Data dictionary:
#' The data in the `epi_archive$DT` attribute has columns:
#' \describe{
#'   \item{version}{the time value specifying the version for each row of measurements.}
#'   \item{geo_value}{the province or territory associated with each row of measurements.}
#'   \item{time_value}{the time value associated with each row of measurements.}
#'   \item{case_rate}{number of new confirmed cases due to COVID-19 per 100,000 population, daily}
#' }
#' @source This object contains a modified part of the COVID-19 Canada Open
#' Data Working Group's
#' \href{https://github.com/ccodwg/Covid19Canada}{Covid19Canada data repository} (archived).
#' This data set is licensed under the terms of the
#' \href{https://creativecommons.org/licenses/by/4.0/}{Creative Commons Attribution 4.0 International license}
#' by the COVID-19 Canada Open Data Working Group. The COVID-19 Canada Open
#' Data Working Group collected the data from publicly available sources such
#' as government datasets and news releases.
#'
#' Modifications:
#' * The case rate signal are calculated using the case count taken directly from the CCODWG
#'   \href{https://github.com/ccodwg/Covid19Canada}{ccodwg/Covid19Canada GitHub repository}
#'   and population data.
#' * Furthermore, the data has been limited to a very small number of rows, the
#'   signal names slightly altered, some province names replaced with abbreviations, and
#'   formatted into an `epi_archive`.
#'
#' The population data used (but not included in the dataset itself) is from the
#' \href{https://github.com/mountainMath/BCCovidSnippets/}{mountainMath/BCCovidSnippets GitHub repository}.
"can_prov_cases"

#' Subset of Statistics Canada median employment income for postsecondary graduates
#'
#' Data set for all territories (aggregated) and all 10 provinces containing
#' yearly income data for postsecondary graduates as reported by Statistics
#' Canada, downloaded from the Statistics Canada website at
#' www.statcan.gc.ca. This example data is a snapshot as of September 18,
#' 2024, and ranges from 2010 to 2017 (yearly).
#'
#' @format An [`epiprocess::epi_df`] (object of class `c("epi_df", "tbl_df", "tbl", "data.frame")`) with 1445 rows and 7 columns.
#' @section Data dictionary:
#' The data has columns:
#' \describe{
#'   \item{geo_value}{The province in Canada associated with each
#'      row of measurements.}
#'   \item{time_value}{The time value, a year integer in YYYY format}
#'   \item{edu_qual}{The education qualification}
#'   \item{age_group}{The age group; either 15 to 34 or 35 to 64}
#'   \item{num_graduates}{The number of graduates for the given row of characteristics}
#'   \item{med_income_2y}{The median employment income two years after graduation}
#'   \item{med_income_5y}{The median employment income five years after graduation}
#' }
#' @source This object contains modified data adapted from
#'  Statistics Canada, \href{https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=3710011501}{
#'  Table 37-10-0115-01 Characteristics and median employment income of
#'  longitudinal cohorts of postsecondary graduates two and five years after
#'  graduation, by educational qualification and field of study
#'  (primary groupings)}. This does not constitute an endorsement by Statistics Canada of this product.
#'
#' The data is licensed under the terms of the
#' \href{https://www.statcan.gc.ca/en/reference/licence}{Statistics Canada Open License}.
#'
#' Modifications:
#' * Only provincial and territorial regions are kept.
#' * Only age group, field of study, and educational qualification are kept as
#'   covariates. For the remaining covariates, we keep aggregated values and
#'   drop the level-specific rows.
#' * No modifications were made to the time range of the data.
"grad_employ_subset"

#' Percent CLI from different surveys, compared to ground truth COVID incidence in a subset of counties
#'
#' @description
#' Data set for more than 400 US counties containing CLI
#' (COVID-19-like-illness) incidence derived from two surveys, and a reference signal as
#' reported by JHU CSSE. This example data is a snapshot as of September 21,
#' 2020, and ranges from April 11, 2020 to September 01, 2020.
#'
#' The reference signal `case` is based on reports made available
#' by the Center for Systems Science and Engineering at Johns Hopkins
#' University.
#'
#' One survey was
#' \href{https://cmu-delphi.github.io/delphi-epidata/api/covidcast-signals/google-survey.html}{run by Google},
#' in partnership with Delphi.
#'
#' The other survey, the
#'\href{https://cmu-delphi.github.io/delphi-epidata/api/covidcast-signals/fb-survey.html}{COVID-19 Trends and Impact Survey},
#' was run by Delphi in collaboration with Facebook.
#'
#' Data is reported for counties that had at least 200 cumulative COVID-19 cases
#' on May 14, 2020, according to JHU CSSE.
#'
#' @format An [`epiprocess::epi_df`] (object of class `c("epi_df", "tbl_df", "tbl", "data.frame")`) with 63840 rows and 5 columns.
#' @section Data dictionary:
#' The data has columns:
#' \describe{
#'   \item{geo_value}{The 5-digit county FIPS code associated with each
#'      row of measurements.}
#'   \item{time_value}{The time value, a date in YYYY-MM-DD format}
#'   \item{goog}{Seven-day average of CLI (covid-like-illness) cases from the Google survey}
#'   \item{fb}{Seven-day average of CLI (covid-like-illness) cases from CTIS}
#'   \item{case}{Reference signal. Seven-day average of CLI (covid-like-illness) cases}
#' }
#' @source
#' This object contains a modified part of the \href{https://github.com/CSSEGISandData/COVID-19}{COVID-19 Data Repository by the Center for Systems Science and Engineering (CSSE) at Johns Hopkins University} as \href{https://cmu-delphi.github.io/delphi-epidata/api/covidcast-signals/jhu-csse.html}{republished in the COVIDcast Epidata API}. This data set is licensed under the terms of the
#' \href{https://creativecommons.org/licenses/by/4.0/}{Creative Commons Attribution 4.0 International license}
#' by Johns Hopkins University on behalf of its Center for Systems Science in Engineering.
#' Copyright Johns Hopkins University 2020.
#'
#' Modifications:
#' * \href{https://cmu-delphi.github.io/delphi-epidata/api/covidcast-signals/jhu-csse.html}{From the COVIDcast Epidata API}:  The signal `confirmed_cumulative_num` was used to determine eligibility for inclusion. The signal `confirmed_7dav_incidence_prop` was computed by Delphi from the original JHU-CSSE data by calculating moving averages of the preceding 7 days, so the signal for June 7 is the average of the underlying data for June 1 through 7, inclusive.
#' * Furthermore, the data has been limited to a specific time range, the
#'   signal names slightly altered, and formatted into an `epi_df`.
#'
#' This object contains a modified part of the
#' \href{https://cmu-delphi.github.io/delphi-epidata/symptom-survey/#covid-19-trends-and-impact-survey}{data
#' aggregations in the API} that are prepared from the
#' \href{https://www.pnas.org/doi/full/10.1073/pnas.2111454118}{COVID-19
#' Trends and Impact Survey}; see the first link for more information on
#' citing in publications.
#' The data is made available via the
#' \href{https://cmu-delphi.github.io/delphi-epidata/}{Delphi Epidata API}.
#'
#' These aggregations are licensed under the terms of
#' the \href{https://creativecommons.org/licenses/by/4.0/}{Creative Commons
#' Attribution license}.
#'
#' Modifications:
#' * The data has been limited to a very small number of rows, the
#'   signal names slightly altered, and formatted into an `epi_df`.
#'
#' This object contains a modified part of the
#' \href{https://cmu-delphi.github.io/delphi-epidata/api/covidcast-signals/google-survey.html}{Google symptom surveys}.
#' Aggregations based on the survey are licensed under the terms of
#' the \href{https://creativecommons.org/licenses/by/4.0/}{Creative Commons
#' Attribution license}.
#'
#' Modifications:
#' * The data has been limited to a very small number of rows, the
#'   signal names slightly altered, and formatted into an `epi_df`.
"county_smoothed_cli_comparison"

#' Daily COVID-19 case and death rates from all states in archive format
#'
#' @description
#' Data set containing COVID-19 case and death rates (counts per 100000
#' population) as reported by the Delphi API, based on reports made available
#' by the Center for Systems Science and Engineering at Johns Hopkins
#' University. This example data ranges from March 1, 2020 to November 30,
#' 2021, issued monthly on the first day of each month from September 1, 2020
#' to December 1, 2021. It includes all US states, Washington DC, Guam, Puerto
#' Rico, and the Virgin Islands.
#'
#' @format An [`epiprocess::epi_archive`]. The DT attribute contains the data formatted as a [`data.table::data.table`] (object of class `c("data.table", "data.frame")`) with 72086 rows and 7 columns.
#' @section Data dictionary:
#' The data in the `epi_archive$DT` attribute has columns:
#' \describe{
#'   \item{geo_value}{the geographic value associated with each row of measurements.}
#'   \item{time_value}{the time value associated with each row of measurements.}
#'   \item{version}{the time value specifying the version for each row of measurements. }
#'   \item{case_rate}{Number of new confirmed cases due to COVID-19 per 100,000 population, daily}
#'   \item{case_rate_7d_av}{7-day average signal of number of new confirmed cases due to COVID-19 per 100,000 population, daily}
#'   \item{death_rate}{Number of new confirmed deaths due to COVID-19 per 100,000 population, daily}
#'   \item{death_rate_7d_av}{7-day average signal of number of new confirmed deaths due to COVID-19 per 100,000 population, daily}
#' }
#' @source
#' This object contains a modified part of the \href{https://github.com/CSSEGISandData/COVID-19}{COVID-19 Data Repository by the Center for Systems Science and Engineering (CSSE) at Johns Hopkins University} as \href{https://cmu-delphi.github.io/delphi-epidata/api/covidcast-signals/jhu-csse.html}{republished in the COVIDcast Epidata API}. This data set is licensed under the terms of the
#' \href{https://creativecommons.org/licenses/by/4.0/}{Creative Commons Attribution 4.0 International license}
#' by Johns Hopkins University on behalf of its Center for Systems Science in Engineering.
#' Copyright Johns Hopkins University 2020.
#'
#' Modifications:
#' * \href{https://cmu-delphi.github.io/delphi-epidata/api/covidcast-signals/jhu-csse.html}{From the COVIDcast Epidata API}:  The signals `case_rate` and `death_rate` are taken directly from the JHU CSSE GitHub repo without changes, served through the Delphi API.
#' * \href{https://cmu-delphi.github.io/delphi-epidata/api/covidcast-signals/jhu-csse.html}{From the COVIDcast Epidata API}: Averaged signals were computed from the original JHU-CSSE data by calculating moving averages of the preceding 7 days, so the signal for June 7 is the average of the underlying data for June 1 through 7, inclusive.
#' * Furthermore, the data has been limited to a specific time range, the
#'   signal names slightly altered, and formatted into an `epi_archive`.
"case_death_rate_archive"

#' Daily COVID-19 doctor visits and cases from all states in archive format
#' @description
#' This data source is based on information about outpatient visits, provided
#' to us by health system partners, and also contains confirmed COVID-19
#' cases based on reports made available by the Center for Systems Science
#' and Engineering at Johns Hopkins University. This example data ranges from
#' June 1, 2020 to December 1, 2021, issued on dates from June 1, 2020 to December 1,
#' 2021. It includes all US states.
#'
#' It is used in the {epipredict} `sliding` article.
#'
#' @format An [`epiprocess::epi_archive`]. The DT attribute contains the data formatted as a [`data.table::data.table`] (object of class `c("data.table", "data.frame")`) with 1514489 rows and 5 columns.
#' @section Data dictionary:
#' The data in the `epi_archive$DT` attribute has columns:
#' \describe{
#'   \item{geo_value}{the geographic value associated with each row of measurements.}
#'   \item{time_value}{the time value associated with each row of measurements.}
#'   \item{version}{the time value specifying the version for each row of measurements. }
#'   \item{percent_cli}{percentage of doctor’s visits with CLI (COVID-like illness) computed from medical insurance claims}
#'   \item{case_rate}{7-day average signal of number of new confirmed cases due to COVID-19 per 100,000 population, daily}
#' }
#' @source
#' This object contains a modified part of the \href{https://github.com/CSSEGISandData/COVID-19}{COVID-19 Data Repository by the Center for Systems Science and Engineering (CSSE) at Johns Hopkins University} as \href{https://cmu-delphi.github.io/delphi-epidata/api/covidcast-signals/jhu-csse.html}{republished in the COVIDcast Epidata API}. This data set is licensed under the terms of the
#' \href{https://creativecommons.org/licenses/by/4.0/}{Creative Commons Attribution 4.0 International license}
#' by Johns Hopkins University on behalf of its Center for Systems Science in Engineering.
#' Copyright Johns Hopkins University 2020.
#'
#' Modifications:
#' * \href{https://cmu-delphi.github.io/delphi-epidata/api/covidcast-signals/doctor-visits.html}{From the COVIDcast Doctor Visits API}: The signal `percent_cli` is taken directly from the API without changes.
#' * \href{https://cmu-delphi.github.io/delphi-epidata/api/covidcast-signals/jhu-csse.html}{From the COVIDcast Epidata API}: `case_rate` signal was computed by Delphi from the original JHU-CSSE data by calculating moving averages of the preceding 7 days, so the signal for June 7 is the average of the underlying data for June 1 through 7, inclusive.
#' * Furthermore, the data has been limited to a very small number of rows, the
#'   signal names slightly altered, and formatted into an `epi_archive`.
"archive_cases_dv_subset_all_states"
