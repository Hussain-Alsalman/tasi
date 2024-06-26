% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/caching.R
\name{check_cached_company}
\alias{check_cached_company}
\title{Checking Cached historical data for companies}
\usage{
check_cached_company(start_date, end_date, symbol)
}
\arguments{
\item{start_date}{The start date of the query. Date is a string that needs to be in yyyy-mm-dd format}

\item{end_date}{The end date of the query. Date is a string that needs to be in yyyy-mm-dd format}

\item{symbol}{Company Symbol number}
}
\value{
It returns a list that will include a cached data frame if exists
}
\description{
Checking Cached historical data for companies
}
