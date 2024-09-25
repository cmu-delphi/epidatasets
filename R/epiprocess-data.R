#' Subset of JHU daily state COVID-19 cases and deaths from 6 states
#' @description
#' This data source of confirmed COVID-19 cases and deaths is based on reports
#' made available by the Center for Systems Science and Engineering at Johns
#' Hopkins University. This example data is a snapshot as of March 20, 2024, and
#' ranges from March 1, 2020 to December 31, 2021. It is limited to California,
#' Florida, Texas, New York, Georgia, and Pennsylvania.
#'
#' It is used in the {epiprocess} growth rate and `epi_slide` vignettes.
#'
#' @format An [`epiprocess::epi_df`] (object of class `c("epi_df", "tbl_df", "tbl", "data.frame")`) with 4026 rows and 6 columns.
#' @section Data dictionary:
#' The data has columns:
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
#'   The case signal is taken directly from the JHU CSSE
#'   \href{https://github.com/CSSEGISandData/COVID-19}{COVID-19 GitHub repository}.
#'   The rate signals were computed by Delphi using Census population data.
#'   The 7-day average signals were computed by Delphi by calculating moving
#'   averages of the preceding 7 days, so the signal for June 7 is the
#'   average of the underlying data for June 1 through 7, inclusive.
#' * Furthermore, the data has been limited to a very small number of rows, the
#'   signal names slightly altered, and formatted into an `epi_df`.
"cases_deaths_subset"

#' Subset of daily COVID-19 doctor visits and cases from 6 states in archive format
#' @description
#' This data source is based on information about outpatient visits, provided
#' to us by health system partners, and also contains confirmed COVID-19
#' cases based on reports made available by the Center for Systems Science
#' and Engineering at Johns Hopkins University. This example data ranges from
#' June 1, 2020 to December 1, 2021, issued on dates from June 1, 2020 to December 1,
#' 2021. It is limited to California, Florida, Texas, and New York.
#'
#' It is used in the {epiprocess} `compactify`, `epi_archive`, and
#' advanced-use (`advanced`) vignettes.
#'
#' @format An [`epiprocess::epi_archive`]. The DT attribute contains the data formatted as a [`data.table::data.table`] (object of class `c("data.table", "data.frame")`) with 129638 rows and 5 columns.
#' @section Data dictionary:
#' The data in the `epi_archive$DT` attribute has columns:
#' \describe{
#'   \item{geo_value}{the geographic value associated with each row of measurements.}
#'   \item{time_value}{the time value associated with each row of measurements.}
#'   \item{version}{the time value specifying the version for each row of measurements. }
#'   \item{percent_cli}{percentage of doctor’s visits with CLI (COVID-like illness) computed from medical insurance claims}
#'   \item{case_rate_7d_av}{7-day average signal of number of new confirmed cases due to COVID-19 per 100,000 population, daily}
#' }
#' @source
#' This object contains a modified part of the \href{https://github.com/CSSEGISandData/COVID-19}{COVID-19 Data Repository by the Center for Systems Science and Engineering (CSSE) at Johns Hopkins University} as \href{https://cmu-delphi.github.io/delphi-epidata/api/covidcast-signals/jhu-csse.html}{republished in the COVIDcast Epidata API}. This data set is licensed under the terms of the
#' \href{https://creativecommons.org/licenses/by/4.0/}{Creative Commons Attribution 4.0 International license}
#' by Johns Hopkins University on behalf of its Center for Systems Science in Engineering.
#' Copyright Johns Hopkins University 2020.
#'
#' Modifications:
#' * \href{https://cmu-delphi.github.io/delphi-epidata/api/covidcast-signals/jhu-csse.html}{From the COVIDcast Epidata API}: `case_rate_7d_av` signal was computed by Delphi from the original JHU-CSSE data by calculating moving averages of the preceding 7 days, so the signal for June 7 is the average of the underlying data for June 1 through 7, inclusive.
#' * Furthermore, the data has been limited to a very small number of rows, the
#'   signal names slightly altered, and formatted into an `epi_archive`.
#'
#' This object contains a modified part of the \href
#' {https://cmu-delphi.github.io/delphi-epidata/api/covidcast-signals/doctor-visits.html}{Delphi
#' `doctor-visits` indicator}. This data source is computed by the Delphi
#' Group from information about outpatient visits, provided to Delphi by
#' health system partners, and published in the COVIDcast Epidata API. This
#' data set is licensed under the terms of the
#' \href{https://creativecommons.org/licenses/by/4.0/}{Creative Commons Attribution 4.0 International license}
#' by the Delphi group.
#'
#' Modifications:
#' * \href{https://cmu-delphi.github.io/delphi-epidata/api/covidcast-signals/doctor-visits.html}{From the COVIDcast Doctor Visits signal}: The signal `smoothed_adj_cli` is taken directly from the API without changes.
#' * Furthermore, the data has been limited to a very small number of rows, the
#'   signal names slightly altered, and formatted into an `epi_archive`.
"archive_cases_dv_subset"

#' Subset of JHU daily COVID-19 cases from counties in Massachusetts and Vermont
#' @description
#' This data source of confirmed COVID-19 cases and deaths
#' is based on reports made available by the Center for
#' Systems Science and Engineering at Johns Hopkins University.
#' This example data is a snapshot as of March 20, 2024, and
#' ranges from March 1, 2020 to December 31, 2021.
#' It is limited to counties from Massachusetts and Vermont.
#'
#' It is used in the {epiprocess} aggregation vignette.
#'
#' @format An [`epiprocess::epi_df`] (object of class `c("epi_df", "tbl_df", "tbl", "data.frame")`) with 16212 rows and 5 columns.
#' @section Data dictionary:
#' The data has columns:
#' \describe{
#'   \item{geo_value}{the geographic value associated with each row of measurements.}
#'   \item{time_value}{the time value associated with each row of measurements.}
#'   \item{cases}{Number of new confirmed COVID-19 cases, daily}
#'   \item{county_name}{the name of the county}
#'   \item{state_name}{the full name of the state}
#' }
#' @source This object contains a modified part of the
#'   \href{https://github.com/CSSEGISandData/COVID-19}{COVID-19 Data Repository by the Center for Systems Science and Engineering (CSSE) at Johns Hopkins University} as
#'   \href{https://cmu-delphi.github.io/delphi-epidata/api/covidcast-signals/jhu-csse.html}{republished in the COVIDcast Epidata API}.
#'   This data set is licensed under the terms of the
#'   \href{https://creativecommons.org/licenses/by/4.0/}{Creative Commons Attribution 4.0 International license}
#'   by the Johns Hopkins University on behalf of its Center for Systems
#'   Science in Engineering. Copyright Johns Hopkins University 2020.
#'
#' Modifications:
#' * \href{https://cmu-delphi.github.io/delphi-epidata/api/covidcast-signals/jhu-csse.html}{From the COVIDcast Epidata API}:
#'   These signals are taken directly from the JHU CSSE
#'   \href{https://github.com/CSSEGISandData/COVID-19}{COVID-19 GitHub repository}
#'   without changes. The 7-day average signals are computed by Delphi by
#'   as moving averages of the preceding 7 days, so the signal for
#'   June 7 is the average of the underlying data for June 1 through 7,
#'   inclusive.
#' * Furthermore, the data has been limited to a very small number of rows,
#'   formatted into an `epi_df`, and the signal names slightly altered.
"covid_incidence_county_subset"

# Epiprocess Vignette Data ----------------------------------------------------

#' Subset of JHU daily COVID-19 cases from New Jersey and Florida
#' @description
#' This data source of confirmed COVID-19 cases is based on reports made
#' available by the Center for Systems Science and Engineering at Johns
#' Hopkins University. This example data is downloaded from the CMU Delphi
#' COVIDcast Epidata API. It is a snapshot as of October 28, 2021, and captures the
#' cases from June 1, 2020 to May 31, 2021. It is limited to New Jersey and
#' Florida.
#'
#' This data set is used in the {epiprocess} vignette on outliers.
#'
#' @format An [`epiprocess::epi_df`] (object of class `c("epi_df", "tbl_df", "tbl", "data.frame")`) with 730 rows and 3 columns.
#' @section Data dictionary:
#' The data has columns:
#' \describe{
#'   \item{geo_value}{the geographic value associated with each row of measurements.}
#'   \item{time_value}{the time value associated with each row of measurements.}
#'   \item{cases}{Number of new confirmed COVID-19 cases, daily}
#' }
#' @source This object contains a modified part of the
#'   \href{https://github.com/CSSEGISandData/COVID-19}{COVID-19 Data Repository by the Center for Systems Science and Engineering (CSSE) at Johns Hopkins University}
#'   as \href{https://cmu-delphi.github.io/delphi-epidata/api/covidcast-signals/jhu-csse.html}{republished in the COVIDcast Epidata API}.
#'   This data set is licensed under the terms of the
#'   \href{https://creativecommons.org/licenses/by/4.0/}{Creative Commons Attribution 4.0 International license}
#'   by the Johns Hopkins University on behalf of its Center for Systems
#'   Science in Engineering. Copyright Johns Hopkins University 2020.
#'
#' Modifications:
#' * \href{https://cmu-delphi.github.io/delphi-epidata/api/covidcast-signals/jhu-csse.html}{From the COVIDcast Epidata API}:
#'   These signals are taken directly from the JHU CSSE \href{https://github.com/CSSEGISandData/COVID-19}{COVID-19 GitHub repository} without changes.
#' * Furthermore, the data has been limited to a very small number of rows,
#'   formatted into an `epi_df`, and the signal names slightly altered.
"covid_incidence_outliers"

#' Subset of COVID-19 cumulative case counts from 4 states
#' @description
#' Data set for 4 states containing COVID-19 Cumulative Cases as reported by
#' JHU-CSSE and downloaded from the CMU Delphi COVIDcast Epidata API.
#' This example data is a snapshot as of March 20, 2024, and
#' ranges from March 1, 2020 to January 31, 2022. It is limited
#' to California, Florida, New York, and Texas.
#'
#' It is used in the {epiprocess} "Getting Started" vignette.
#'
#' @format A [`tibble::tibble`] (object of class `c("tbl_df", "tbl", "data.frame")`) with 2808 rows and 15 columns.
#' @section Data dictionary:
#' The data has columns:
#' \describe{
#'   \item{geo_value}{the geographic value associated with each row of measurements.}
#'   \item{signal}{name of metric, derived from upstream data.}
#'   \item{source}{name of upstream data source.}
#'   \item{geo_type}{spatial resolution of the signal.}
#'   \item{time_type}{temporal resolution of the signal.}
#'   \item{time_value}{the time value associated with each row of measurements.}
#'   \item{issue}{time unit (e.g., date) when the signal data were published.}
#'   \item{lag}{time delta (e.g. days) between when the underlying events happened and when the data were published.}
#'   \item{missing_value}{an integer code that is zero when the value field is present and non-zero when the data is missing (see \href{https://cmu-delphi.github.io/delphi-epidata/api/missing_codes.html}{missing codes}).}
#'   \item{missing_stderr}{an integer code that is zero when the stderr field is present and non-zero when the data is missing (see \href{https://cmu-delphi.github.io/delphi-epidata/api/missing_codes.html}{missing codes}).}
#'   \item{missing_sample_size}{an integer code that is zero when the sample_size field is present and non-zero when the data is missing (see \href{https://cmu-delphi.github.io/delphi-epidata/api/missing_codes.html}{missing codes}).}
#'   \item{value}{cumulative number of confirmed COVID-19 cases, derived from the underlying data source.}
#'   \item{stderr}{approximate standard error of the statistic with respect to its sampling distribution, NA when not applicable.}
#'   \item{sample_size}{number of “data points” used in computing the statistic, NA when not applicable.}
#' }
#' @source This object contains a modified part of the \href{https://github.com/CSSEGISandData/COVID-19}{COVID-19 Data Repository by the Center for Systems Science and Engineering (CSSE) at Johns Hopkins University} as \href{https://cmu-delphi.github.io/delphi-epidata/api/covidcast-signals/jhu-csse.html}{republished in the COVIDcast Epidata API}. This data set is licensed under the terms of the
#' \href{https://creativecommons.org/licenses/by/4.0/}{Creative Commons Attribution 4.0 International license}
#' by the Johns Hopkins University on behalf of its Center for Systems Science in Engineering.
#' Copyright Johns Hopkins University 2020.
#'
#' Modifications:
#' * \href{https://cmu-delphi.github.io/delphi-epidata/api/covidcast-signals/jhu-csse.html}{From the COVIDcast Epidata API}:
#'   These signals are taken directly from the JHU CSSE \href{https://github.com/CSSEGISandData/COVID-19}{COVID-19 GitHub repository} without changes.
#' * Furthermore, the data has been limited to a very small number of rows,
#'   formatted into an `epi_df`, and the signal names slightly altered.
"jhu_confirmed_cumulative_num"
