test_that("Date Parsing Works", {
  date1 <- "2015-12-30"
  date2 <- "2030-1-3"
  date3 <- "02-12-2026"
  date4 <- "03-04-2034"

  expect_equal(date_elements(date1)$Y, "2015")
  expect_equal(date_elements(date1)$M, "12")
  expect_equal(date_elements(date1)$D, "30")
  expect_error(object = date_elements(date3), regexp = "Date provided is in incorrect format. Please provide date in 'yyyy-mm-dd' format. for example '2020-02-01', '2021-12-23'" )
  expect_error(object = date_elements(date4), regexp = "Date provided is in incorrect format. Please provide date in 'yyyy-mm-dd' format. for example '2020-02-01', '2021-12-23'" )

  })

test_that("Input Validation Works", {

  correct_start_date <- "2022-05-01"
  incorrect_start_date <- 2022-05-01
  correct_end_date <- "2013-08-01"
  incorrect_end_date <- "2016-6-5"
  correct_company_symbol <- 1562
  incorrect_company_symbol <- "1564"

  string_error_msg <- "Date provided is not a string. Please provide date as string in 'yyyy-mm-dd' format"
  date_error_msg <- "Date provided is in incorrect format. Please provide date in 'yyyy-mm-dd' format. for example '2020-02-01', '2021-12-23'"
  company_error_msg <- "Company Symbol provided is incorrect. Company Symbols are usually 4 digit number with non-leading zero. for example 2222, 2010"

  expect_error(object = validate_input(correct_start_date, incorrect_end_date, incorrect_company_symbol), regexp = date_error_msg)
  expect_error(object = validate_input(correct_start_date, correct_end_date, incorrect_company_symbol), regexp = company_error_msg)
  expect_error(object = validate_input(incorrect_start_date, correct_end_date, correct_company_symbol), regexp = string_error_msg)
})


test_that("Number Formatting Works", {
  num_1 <- "123,453,23"
  num_2 <- 32436
  num_3 <- "-32,452  "

  expect_equal(num_format(num_1), 12345323)
  expect_equal(num_format(num_2), 32436)
  expect_equal(num_format(num_3), -32452)
})
