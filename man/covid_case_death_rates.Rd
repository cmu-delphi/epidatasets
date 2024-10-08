% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/epipredict-data.R
\docType{data}
\name{covid_case_death_rates}
\alias{covid_case_death_rates}
\title{JHU daily COVID-19 cases and deaths rates from all states}
\format{
An \code{\link[epiprocess:epi_df]{epiprocess::epi_df}} (object of class \code{c("epi_df", "tbl_df", "tbl", "data.frame")}) with 37576 rows and 4 columns.
}
\source{
This object contains a modified part of the
\href{https://github.com/CSSEGISandData/COVID-19}{COVID-19 Data Repository by the Center for Systems Science and Engineering (CSSE) at Johns Hopkins University}
as \href{https://cmu-delphi.github.io/delphi-epidata/api/covidcast-signals/jhu-csse.html}{republished in the COVIDcast Epidata API}.
This data set is licensed under the terms of the
\href{https://creativecommons.org/licenses/by/4.0/}{Creative Commons Attribution 4.0 International license}
by the Johns Hopkins University on behalf of its Center for Systems Science
in Engineering. Copyright Johns Hopkins University 2020.

Modifications:
\itemize{
\item \href{https://cmu-delphi.github.io/delphi-epidata/api/covidcast-signals/jhu-csse.html}{From the COVIDcast Epidata API}:
These signals are taken directly from the JHU CSSE
\href{https://github.com/CSSEGISandData/COVID-19}{COVID-19 GitHub repository}
without changes. The 7-day average signals are computed by Delphi by
calculating moving averages of the preceding 7 days, so the signal for
June 7 is the average of the underlying data for June 1 through 7,
inclusive.
}
}
\usage{
covid_case_death_rates
}
\description{
This data source of confirmed COVID-19 cases and deaths is based on reports
made available by the Center for Systems Science and Engineering at Johns
Hopkins University, as downloaded from the CMU Delphi COVIDcast Epidata
API. This example data is a snapshot as of March 20, 2024, and
ranges from December 31, 2020 to December 31, 2021. It
includes all states. It is used in the {epiprocess} correlation vignette.
}
\section{Data dictionary}{

The data has columns:
\describe{
\item{geo_value}{the geographic value associated with each row
of measurements.}
\item{time_value}{the time value associated with each row of measurements.}
\item{case_rate}{7-day average signal of number of new
confirmed COVID-19 cases per 100,000 population, daily}
\item{death_rate}{7-day average signal of number of new confirmed
deaths due to COVID-19 per 100,000 population, daily}
}
}

\keyword{datasets}
