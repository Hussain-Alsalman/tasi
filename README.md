
<!-- README.md is generated from README.Rmd. Please edit that file -->

# `tasi` <img src="inst/figures/tasi_logo.png" align="right" height="139"/>

<span style="color:red">package is under major update</span>

<!-- badges: start -->
<!-- badges: end -->

The goal of `tasi` is to provide the missing API to obtain historical
prices for Saudi stocks and TASI (Tadawul All Share Index) as well as
easy access to the released financial statements

## Installation

Currently `tasi` is only available on github. You can install the latest
version of `tasi` with:

``` r
devtools::install_github("Hussain-Alsalman/tasi")
```

## Example

This is a basic example which shows you how to obtain and plot TASI
historical performance for the past year:

``` r
library("tasi")

df <- get_index_records("2020-01-01","2021-01-30")

plot(df$date, df$close,xlab = "Date", ylab = "TASI points",type = "l")
```

<img src="man/figures/README-basic example-1.png" width="100%" />

This is more sophisticated example using `quantmod` package to create
candlesticks chart

``` r
library("quantmod")
library("dplyr")
library("xts")
library("tasi")
# Performance of Saudi Aramco company stock 
comp_df <- get_company_records("2020-07-01","2021-02-06",company_symbol = 2222)
comp_df %>%
  df_to_xts() %>% 
  chart_Series()
```

<img src="man/figures/README-sophisticated example-1.png" width="100%" />

## Extracting Financial Statements

Now you can extract any financial statement for any specified company in
the Saudi Market. Let see how can we easily extract an income statement
for a company

``` r
library("tasi")
library("dplyr")

income_df <- get_income_statement(1180, period_type = "q") # q stands for quarterly.

opts <-options(knitr.kable.NA = "-")
income_df %>% knitr::kable(format.args = list(big.mark = ",", scientific = FALSE))
```

| statement\_of\_income              |      Q3\_2021 |      Q2\_2021 |      Q1\_2021 |      Q3\_2020 |
|:-----------------------------------|--------------:|--------------:|--------------:|--------------:|
| Special Commission Income          | 6,886,946,000 | 6,698,016,000 | 4,901,201,000 | 4,792,430,000 |
| Special Commission Expenses        |   804,727,000 |   915,350,000 |   722,177,000 |   689,945,000 |
| Net Special Commission Income      | 6,082,219,000 | 5,782,666,000 | 4,179,024,000 | 4,102,485,000 |
| Fees from Services                 |   801,043,000 |   818,717,000 |   621,243,000 |   601,307,000 |
| Exchange Income                    |   363,094,000 |   355,805,000 |   326,174,000 |   289,944,000 |
| Trading Income                     |   634,285,000 |   554,542,000 |   254,190,000 |   627,814,000 |
| Realized Gains on Investments, net |   118,932,000 |   158,784,000 |   609,641,000 |   157,305,000 |
| Dividend Income                    |            \- |            \- |            \- |            \- |
| Other Operating Income             |  -199,802,000 |  -169,261,000 |  -217,612,000 |  -141,244,000 |
| Total Operating Income             | 7,799,771,000 | 7,501,253,000 | 5,772,660,000 | 5,637,611,000 |
| Salaries and Employees Benefits    | 1,196,493,000 | 1,139,381,000 |   865,959,000 |   887,620,000 |
| Rent and Premises                  |   137,360,000 |   146,623,000 |    89,107,000 |    87,710,000 |
| Depreciation                       |   595,832,000 |   596,373,000 |   230,040,000 |   221,175,000 |
| Other General and Admin Expenses   | 1,359,844,000 | 1,094,009,000 |   899,470,000 |   903,858,000 |
| Provision for Credit Losses        |   724,839,000 | 2,407,785,000 |   279,616,000 |   378,847,000 |
| Total Operating Expenses           | 4,014,368,000 | 5,384,171,000 | 2,364,192,000 | 2,479,210,000 |
| Extraordinary item                 |            \- |            \- |            \- |            \- |
| Net Income from Operations         | 3,785,403,000 | 2,117,082,000 | 3,408,468,000 | 3,158,401,000 |
| Balance at Beginning of Period     |            \- |            \- |            \- |            \- |
| Transferred to Reserves            |            \- |            \- |            \- |            \- |
| Cash Dividend                      |            \- |            \- |            \- |            \- |
| Other Distributions                |            \- |            \- |            \- |            \- |

``` r
options(opts)
```
