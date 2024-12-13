test_that("diagnose_empty_values correctly identifies empty strings", {
  # Sample dataset with empty string values
  data <- data.frame(
    column1 = c("A", "B", "", "D"),
    column2 = c(1, 2, 3, 4),
    column3 = c("", "", "C", "D")
    )

  # Run the function
  result <- diagnose_empty_values(data)
  empty_vals <- result$Empty_Values_Summary
  replaced_empty_table <- result$Modified_Data

  # Expected output
  expected_output <- c(column1 = 1, column3 = 2)

  # Check that the names match columns with empty strings
  expect_equal(names(empty_vals), c("column1", "column3"))

  # Check that the counts of empty strings are correct
  expect_equal(empty_vals, expected_output)

  # Check that output is a table
  expect_s3_class(replaced_empty_table, "data.frame")

  # Check that NAs replaced the number of empty strings
  expect_equal(sum(is.na(replaced_empty_table)), 3)
})
