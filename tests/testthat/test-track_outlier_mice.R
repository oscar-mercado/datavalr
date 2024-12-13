test_that("track_outlier_mice correctly identifies outliers", {
  # Sample dataset with one outlier
  data <- data.frame(
    ID = c("Mouse_1", "Mouse_2", "Mouse_3"),
    Body_Weight_1 = c(22.5, 23.1, 21.8),
    Body_Weight_2 = c(22.0, 22.9, 21.5),
    Body_Weight_3 = c(21.5, 30.0, 21.2)
  )

  # Run the function
  result <- track_outlier_mice(
    data,
    id_col = "ID",
    weight_cols = c("Body_Weight_1", "Body_Weight_2", "Body_Weight_3")
  )

  # Extract the flagged data
  flagged_data <- result$flagged_data

  # Check the flagged data structure
  expect_s3_class(flagged_data, "data.frame")

  # Check that the outlier is correctly flagged
  expect_equal(nrow(flagged_data), 1) # Only one mouse is flagged
  expect_equal(flagged_data$ID, "Mouse_2") # The flagged mouse is Mouse_2

  # Check that the plot is a ggplot object
  flagged_plot <- result$flagged_plot
  expect_s3_class(flagged_plot, "gg")
})
