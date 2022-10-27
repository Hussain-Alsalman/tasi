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
