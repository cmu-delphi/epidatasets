% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/epipredict-data.R
\docType{data}
\name{case_death_rate_archive}
\alias{case_death_rate_archive}
\title{Daily COVID-19 case and death rates from all states in archive format}
\format{
An \code{\link[epiprocess:epi_archive]{epiprocess::epi_archive}}. The DT attribute contains the data formatted as a \code{\link[data.table:data.table]{data.table::data.table}} (object of class \code{c("data.table", "data.frame")}) with 72086 rows and 7 columns.
}
\source{
This object contains a modified part of the \href{https://github.com/CSSEGISandData/COVID-19}{COVID-19 Data Repository by the Center for Systems Science and Engineering (CSSE) at Johns Hopkins University} as \href{https://cmu-delphi.github.io/delphi-epidata/api/covidcast-signals/jhu-csse.html}{republished in the COVIDcast Epidata API}. This data set is licensed under the terms of the
\href{https://creativecommons.org/licenses/by/4.0/}{Creative Commons Attribution 4.0 International license}
by Johns Hopkins University on behalf of its Center for Systems Science in Engineering.
Copyright Johns Hopkins University 2020.

Modifications:
\itemize{
\item \href{https://cmu-delphi.github.io/delphi-epidata/api/covidcast-signals/jhu-csse.html}{From the COVIDcast Epidata API}:  The signals \code{case_rate} and \code{death_rate} are taken directly from the JHU CSSE GitHub repo without changes, served through the Delphi API.
\item \href{https://cmu-delphi.github.io/delphi-epidata/api/covidcast-signals/jhu-csse.html}{From the COVIDcast Epidata API}: Averaged signals were computed from the original JHU-CSSE data by calculating moving averages of the preceding 7 days, so the signal for June 7 is the average of the underlying data for June 1 through 7, inclusive.
\item Furthermore, the data has been limited to a specific time range, the
signal names slightly altered, and formatted into an \code{epi_archive}.
}
}
\usage{
case_death_rate_archive
}
\description{
Data set containing COVID-19 case and death rates (counts per 100000
population) as reported by the Delphi API, based on reports made available
by the Center for Systems Science and Engineering at Johns Hopkins
University. This example data ranges from March 1, 2020 to November 30,
2021, issued monthly on the first day of each month from September 1, 2020
to December 1, 2021. It includes all US states, Washington DC, Guam, Puerto
Rico, and the Virgin Islands.
}
\section{Data dictionary}{

The data in the \code{epi_archive$DT} attribute has columns:
\describe{
\item{geo_value}{the geographic value associated with each row of measurements.}
\item{time_value}{the time value associated with each row of measurements.}
\item{version}{the time value specifying the version for each row of measurements. }
\item{case_rate}{Number of new confirmed cases due to COVID-19 per 100,000 population, daily}
\item{case_rate_7d_av}{7-day average signal of number of new confirmed cases due to COVID-19 per 100,000 population, daily}
\item{death_rate}{Number of new confirmed deaths due to COVID-19 per 100,000 population, daily}
\item{death_rate_7d_av}{7-day average signal of number of new confirmed deaths due to COVID-19 per 100,000 population, daily}
}
}

\keyword{datasets}
