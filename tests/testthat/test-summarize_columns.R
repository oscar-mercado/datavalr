test_that("summarize_columns works correctly", {
  testdata <- data.frame(
    column1 = c(1,2,NA, 4),
    column2 = c("A","B","C",""),
    column3 = c(TRUE, NA, FALSE, TRUE)
  )
  expected_output <- data.frame(
    Column = c("column1","column2","column3"),
    Class = c("numeric","character","logical"),
    Missing_Values = c(1,0,1)
  )
  result <- summarize_columns(data=testdata)
  rownames(expected_output) <- NULL
  rownames(result) <- NULL

  # Check that result is a data frame
  testthat::expect_s3_class(result, "data.frame")

  # Check that column names match
  testthat::expect_equal(colnames(result),
                         c("Column", "Class", "Missing_Values"))

  # Check the actual content
  testthat::expect_equal(result, expected_output)
})
