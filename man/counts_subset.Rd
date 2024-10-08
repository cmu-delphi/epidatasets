% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/epipredict-data.R
\docType{data}
\name{counts_subset}
\alias{counts_subset}
\title{Subset of COVID-19 incident cases and deaths from 5 states}
\format{
An \code{\link[epiprocess:epi_df]{epiprocess::epi_df}} (object of class \code{c("epi_df", "tbl_df", "tbl", "data.frame")}) with 1055 rows and 4 columns.
}
\source{
This object contains a modified part of the \href{https://github.com/CSSEGISandData/COVID-19}{COVID-19 Data Repository by the Center for Systems Science and Engineering (CSSE) at Johns Hopkins University}
as \href{https://cmu-delphi.github.io/delphi-epidata/api/covidcast-signals/jhu-csse.html}{republished in the COVIDcast Epidata API}.
This data set is licensed under the terms of the
\href{https://creativecommons.org/licenses/by/4.0/}{Creative Commons Attribution 4.0 International license}
by the Johns Hopkins University on behalf of its Center for Systems Science in Engineering.
Copyright Johns Hopkins University 2020.

Modifications:
\itemize{
\item \href{https://cmu-delphi.github.io/delphi-epidata/api/covidcast-signals/jhu-csse.html}{From the COVIDcast Epidata API}:
The signals are taken directly from the JHU CSSE
\href{https://github.com/CSSEGISandData/COVID-19}{COVID-19 GitHub repository}
without changes.
\item Furthermore, the data has been limited to a very small number of rows, the
signal names slightly altered, and formatted into an \code{epi_df}.
}
}
\usage{
counts_subset
}
\description{
Data set for 5 states containing COVID-19 Incident Cases and Deaths as
reported by JHU-CSSE and downloaded from the CMU Delphi COVIDcast Epidata
API. This example data is a snapshot as of March 20, 2024, and
ranges from June 4, 2021 to December 31, 2021. It
is limited to California, Florida, Texas, New Jersey, and New York.
}
\section{Data dictionary}{

The data has columns:
\describe{
\item{geo_value}{the geographic value associated with each row
of measurements.}
\item{time_value}{the time value associated with each row of measurements.}
\item{cases}{Number of new confirmed COVID-19 cases, daily}
\item{deaths}{Number of new confirmed COVID-19 deaths, daily}
}
}

\keyword{datasets}
