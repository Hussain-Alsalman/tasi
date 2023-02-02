
<!-- README.md is generated from README.Rmd. Please edit that file -->

# `tasi` <img src="inst/figures/tasi_logo.png" align="right" height="139"/>

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
library("ggplot2")
library("magrittr")

df <- get_index_records("2021-01-01","2022-12-31")
df %>%  ggplot(mapping = aes(x = as.POSIXct(transactionDate), y = previousClosePrice)) + geom_line() + 
  labs(title = "Historical data for tasi index 2021-2022", x = "Date", y = "TASI index") + theme_classic()
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

opts <- options(knitr.kable.NA = "-")
income_df %>% knitr::kable(format.args = list(big.mark = ",", scientific = FALSE))
```

| statement_of_income          |      Q3_2022 |      Q2_2022 |      Q1_2022 |      Q3_2021 |
|:-----------------------------|-------------:|-------------:|-------------:|-------------:|
| Sales                        |  176,497,000 |  172,065,000 |  172,377,000 |  191,011,000 |
| Sales Cost                   |   78,596,000 |   93,809,000 |   86,843,000 |   95,270,000 |
| Total Income                 |   97,901,000 |   78,256,000 |   85,534,000 |   95,741,000 |
| Other Revenues               |   41,398,000 |    1,404,000 |      540,000 |   33,904,000 |
| Total Revenues               |  139,299,000 |   79,660,000 |   86,074,000 |  129,645,000 |
| Admin and Marketing Expenses |   41,067,000 |   46,436,000 |   46,059,000 |   52,471,000 |
| Depreciation                 |   50,869,000 |   54,077,000 |   57,439,000 |   57,270,000 |
| Other Expenses               |   35,248,000 |   14,121,000 |   13,942,000 |   16,018,000 |
| Total Expenses               |  127,184,000 |  114,634,000 |  117,440,000 |  125,759,000 |
| Net Income Before Zakat      |   12,115,000 |  -34,974,000 |  -31,366,000 |    3,886,000 |
| Zakat                        |           \- |           \- |           \- |   -2,296,000 |
| Net Income                   |   12,115,000 |  -34,974,000 |  -31,366,000 |    6,182,000 |
| Balance First Period         | -338,631,000 | -303,657,000 | -272,291,000 | -432,388,000 |
| Reserves                     |           \- |           \- |           \- |           \- |
| Cash Dividends               |           \- |           \- |           \- |           \- |
| Other Distributions          |           \- |           \- |           \- | -201,618,000 |
| Balance End Period           | -326,516,000 | -338,631,000 | -303,657,000 | -224,588,000 |

``` r
options(opts)
```
