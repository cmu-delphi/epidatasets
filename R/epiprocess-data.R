#' Subset of JHU daily state COVID-19 cases and deaths from 4 states
#'
#' This data source of confirmed COVID-19 cases and deaths
#' is based on reports made available by the Center for
#' Systems Science and Engineering at Johns Hopkins University.
#' This example data ranges from Mar 1, 2020 to Dec 31, 2021, and is limited to
#' California, Florida, Texas, New York, Georgia, and Pennsylvania.
#'
#' @format A tibble with 4026 rows and 6 variables:
#' \describe{
#'   \item{geo_value}{the geographic value associated with each row
#'       of measurements.}
#'   \item{time_value}{the time value associated with each row of measurements.}
#'   \item{case_rate_7d_av}{7-day average signal of number of new
#'       confirmed COVID-19 cases per 100,000 population, daily}
#'   \item{death_rate_7d_av}{7-day average signal of number of new confirmed
#'       deaths due to COVID-19 per 100,000 population, daily}
#'   \item{cases}{Number of new confirmed COVID-19 cases, daily}
#'   \item{cases_7d_av}{7-day average signal of number of new confirmed
#'       COVID-19 cases, daily}
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
#' * Furthermore, the data has been limited to a very small number of rows,
#'   the signal names slightly altered, and formatted into a tibble.
# Named "jhu_csse_daily_subset" in {epiprocess}
"cases_deaths_subset"

#' Subset of daily COVID-19 doctor visits and cases from 6 states in archive format
#'
#' This data source is based on information about outpatient visits,
#' provided to us by health system partners, and also contains confirmed
#' COVID-19 cases based on reports made available by the Center for
#' Systems Science and Engineering at Johns Hopkins University.
#' This example data ranges from June 1, 2020 to Dec 1, 2021, and
#' is also limited to California, Florida, Texas, and New York.
#'
#' @format An `epi_archive$DT` data format. The data table DT has 129,638 rows and 5 columns:
#' \describe{
#'   \item{geo_value}{the geographic value associated with each row of measurements.}
#'   \item{time_value}{the time value associated with each row of measurements.}
#'   \item{version}{the time value specifying the version for each row of measurements. }
#'   \item{percent_cli}{percentage of doctor’s visits with CLI (COVID-like illness) computed from medical insurance claims}
#'   \item{case_rate_7d_av}{7-day average signal of number of new confirmed deaths due to COVID-19 per 100,000 population, daily}
#' }
#' @source
#' This object contains a modified part of the \href{https://github.com/CSSEGISandData/COVID-19}{COVID-19 Data Repository by the Center for Systems Science and Engineering (CSSE) at Johns Hopkins University} as \href{https://cmu-delphi.github.io/delphi-epidata/api/covidcast-signals/jhu-csse.html}{republished in the COVIDcast Epidata API}. This data set is licensed under the terms of the
#' \href{https://creativecommons.org/licenses/by/4.0/}{Creative Commons Attribution 4.0 International license}
#' by Johns Hopkins University on behalf of its Center for Systems Science in Engineering.
#' Copyright Johns Hopkins University 2020.
#'
#' Modifications:
#' * \href{https://cmu-delphi.github.io/delphi-epidata/api/covidcast-signals/doctor-visits.html}{From the COVIDcast Doctor Visits API}: The signal `percent_cli` is taken directly from the API without changes.
#' * \href{https://cmu-delphi.github.io/delphi-epidata/api/covidcast-signals/jhu-csse.html}{From the COVIDcast Epidata API}: `case_rate_7d_av` signal was computed by Delphi from the original JHU-CSSE data by calculating moving averages of the preceding 7 days, so the signal for June 7 is the average of the underlying data for June 1 through 7, inclusive.
#' * Furthermore, the data is a subset of the full dataset, the signal names slightly altered, and formatted into a tibble.
# This is named "archive_cases_dv_subset" in {epiprocess}
"archive_cases_dv_subset_dt"

#' Subset of JHU daily COVID-19 cases from counties in Massachusetts and Vermont
#'
#' This data source of confirmed COVID-19 cases and deaths
#' is based on reports made available by the Center for
#' Systems Science and Engineering at Johns Hopkins University.
#' This example data ranges from Mar 1, 2020 to Dec 31, 2021,
#' and is limited to Massachusetts and Vermont.
#'
#' @format A tibble with 16,212 rows and 5 variables:
#' \describe{
#'   \item{geo_value}{the geographic value associated with each row of measurements.}
#'   \item{time_value}{the time value associated with each row of measurements.}
#'   \item{cases}{Number of new confirmed COVID-19 cases, daily}
#'   \item{county_name}{the name of the county}
#'   \item{state_name}{the full name of the state}
#' }
#' @source This object contains a modified part of the \href{https://github.com/CSSEGISandData/COVID-19}{COVID-19 Data Repository by the Center for Systems Science and Engineering (CSSE) at Johns Hopkins University} as \href{https://cmu-delphi.github.io/delphi-epidata/api/covidcast-signals/jhu-csse.html}{republished in the COVIDcast Epidata API}. This data set is licensed under the terms of the
#' \href{https://creativecommons.org/licenses/by/4.0/}{Creative Commons Attribution 4.0 International license}
#' by the Johns Hopkins University on behalf of its Center for Systems Science in Engineering.
#' Copyright Johns Hopkins University 2020.
#'
#' Modifications:
#' * \href{https://cmu-delphi.github.io/delphi-epidata/api/covidcast-signals/jhu-csse.html}{From the COVIDcast Epidata API}: These signals are taken directly from the JHU CSSE \href{https://github.com/CSSEGISandData/COVID-19}{COVID-19 GitHub repository} without changes. The 7-day average signals are computed by Delphi by calculating moving averages of the preceding 7 days, so the signal for June 7 is the average of the underlying data for June 1 through 7, inclusive.
#' * Furthermore, the data has been limited to a very small number of rows, the signal names slightly altered, and formatted into a tibble.
# This is named "jhu_csse_county_level_subset" in {epiprocess}
"covid_incidence_county_subset"

# Epiprocess Vignette Data ----------------------------------------------------

#' Subset of JHU daily COVID-19 cases from California and Florida
#'
#' This data source of confirmed COVID-19 cases is based on reports made
#' available by the Center for Systems Science and Engineering at Johns
#' Hopkins University. This example data is downloaded from the CMU Delphi
#' COVIDcast Epidata API. It is a snapshot as of Oct 28, 2021 and captures the
#' cases from June 1, 2020 to May 31, 2021 and is limited to California and
#' Florida. This data set is used in the {epiprocess} vignette on outliers.
#'
#' @format A tibble with 730 rows and 3 variables:
#' \describe{
#'   \item{geo_value}{the geographic value associated with each row of measurements.}
#'   \item{time_value}{the time value associated with each row of measurements.}
#'   \item{cases}{Number of new confirmed COVID-19 cases, daily}
#' }
#' @source This object contains a modified part of the \href{https://github.com/CSSEGISandData/COVID-19}{COVID-19 Data Repository by the Center for Systems Science and Engineering (CSSE) at Johns Hopkins University} as \href{https://cmu-delphi.github.io/delphi-epidata/api/covidcast-signals/jhu-csse.html}{republished in the COVIDcast Epidata API}. This data set is licensed under the terms of the
#' \href{https://creativecommons.org/licenses/by/4.0/}{Creative Commons Attribution 4.0 International license}
#' by the Johns Hopkins University on behalf of its Center for Systems Science in Engineering.
#' Copyright Johns Hopkins University 2020.
#'
#' Modifications:
#' * \href{https://cmu-delphi.github.io/delphi-epidata/api/covidcast-signals/jhu-csse.html}{From the COVIDcast Epidata API}:
#' These signals are taken directly from the JHU CSSE \href{https://github.com/CSSEGISandData/COVID-19}{COVID-19 GitHub repository} without changes.
#' * Furthermore, the data has been limited to a very small number of rows, the signal names slightly altered, and formatted into a tibble.
"covid_incidence_outliers"

#' Subset of COVID-19 Cumulative Cases from 4 states
#'
#' Data set for 4 states containing COVID-19 Cumulative Cases as reported by
#' JHU-CSSE and downloaded from the CMU Delphi COVIDcast Epidata API. This
#' data set covers the period from March 2020 to January 2022, and is limited
#' to California, Florida, New York, and Texas. It is used in the
#' {epiprocess} "Getting Started" vignette.
#'
#' @format A tibble with 2,808 rows and 15 variables:
#' \describe{
#'   \item{geo_value}{the geographic value associated with each row of measurements.}
#'   \item{signal}{name of metric, derived from upstream data.}
#'   \item{source}{name of upstream data source.}
#'   \item{geo_type}{spatial resolution of the signal.}
#'   \item{time_type}{temporal resolution of the signal.}
#'   \item{time_value}{the time value associated with each row of measurements.}
#'   \item{direction}{trend classifier (+1 -> increasing, 0 -> steady or not determined, -1 -> decreasing).}
#'   \item{issue}{time unit (e.g., date) when the signal data were published.}
#'   \item{lag}{time delta (e.g. days) between when the underlying events happened and when the data were published.}
#'   \item{missing_value}{an integer code that is zero when the value field is present and non-zero when the data is missing (see \href{https://cmu-delphi.github.io/delphi-epidata/api/missing_codes.html}{missing codes}).}
#'   \item{missing_stderr}{an integer code that is zero when the stderr field is present and non-zero when the data is missing (see \href{https://cmu-delphi.github.io/delphi-epidata/api/missing_codes.html}{missing codes}).}
#'   \item{missing_sample_size}{an integer code that is zero when the sample_size field is present and non-zero when the data is missing (see \href{https://cmu-delphi.github.io/delphi-epidata/api/missing_codes.html}{missing codes}).}
#'   \item{value}{Cumulative number of confirmed COVID-19 cases, derived from the underlying data source.}
#'   \item{stderr}{approximate standard error of the statistic with respect to its sampling distribution, null when not applicable.}
#'   \item{sample_size}{number of “data points” used in computing the statistic, null when not applicable.}
#' }
#' @source This object contains a modified part of the \href{https://github.com/CSSEGISandData/COVID-19}{COVID-19 Data Repository by the Center for Systems Science and Engineering (CSSE) at Johns Hopkins University} as \href{https://cmu-delphi.github.io/delphi-epidata/api/covidcast-signals/jhu-csse.html}{republished in the COVIDcast Epidata API}. This data set is licensed under the terms of the
#' \href{https://creativecommons.org/licenses/by/4.0/}{Creative Commons Attribution 4.0 International license}
#' by the Johns Hopkins University on behalf of its Center for Systems Science in Engineering.
#' Copyright Johns Hopkins University 2020.
"jhu_confirmed_cumulative_num"
