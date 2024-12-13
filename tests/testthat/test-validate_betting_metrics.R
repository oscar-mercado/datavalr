test_that("validate_betting_metrics correctly flags anomalies", {
  # Sample dataset
  betting_data <- data.frame(
    spread_favorite = c(-3.5, -10.0, 50.0, NA), # Erroneous value (50.0) and missing value
    over_under_line = c(40.5, 45.0, 15.0, 35.0) # Erroneous value (15.0)
  )

  # Expected ranges
  ranges <- list(
    spread_favorite = c(-20, 20),
    over_under_line = c(20, 100)
  )

  # Run the function
  anomalies <- validate_betting_metrics(
    betting_data,
    metric_cols = c("spread_favorite", "over_under_line"),
    ranges = ranges
  )

  # Check that anomalies for 'spread_favorite' are correctly identified
  expect_equal(nrow(anomalies$spread_favorite), 2) # 1 invalid value + 1 NA
  expect_equal(anomalies$spread_favorite$spread_favorite, c(50.0, NA))

  # Check that anomalies for 'over_under_line' are correctly identified
  expect_equal(nrow(anomalies$over_under_line), 1) # Only 1 invalid value
  expect_equal(anomalies$over_under_line$over_under_line, 15.0)
})
