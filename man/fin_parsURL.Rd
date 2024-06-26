% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/parseURL.R
\name{fin_parsURL}
\alias{fin_parsURL}
\title{Parsing URL call for Financial Statements
This function construct the URL string used to request data from TADAWUL website specifically for Financial Statements.}
\usage{
fin_parsURL(comSymbol = NULL, statement_type)
}
\arguments{
\item{comSymbol}{Company Symbol number}

\item{statement_type}{Type of Financial Statement. This can be one of these choices "balance_sheet", "income_statement", "cash_flow", "xbrl"}
}
\value{
string of values
}
\description{
Parsing URL call for Financial Statements
This function construct the URL string used to request data from TADAWUL website specifically for Financial Statements.
}
