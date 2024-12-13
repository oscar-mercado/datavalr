test_that("validate_date_order flags out-of-order dates in mouse dataset", {
  # Sample mouse dataset
  mouse_data <- data.frame(
    ID = c("Mouse_1", "Mouse_2", "Mouse_3"),
    Date_1 = c("10/5/24", "10/12/24", "10/12/24"),
    Date_2 = c("10/12/24", "10/10/24", "10/19/24"),
    Date_3 = c("10/19/24", "10/19/24", "10/19/24")
  )

  # Convert to Date format
  mouse_data[, c("Date_1", "Date_2", "Date_3")] <- lapply(
    mouse_data[, c("Date_1", "Date_2", "Date_3")],
    as.Date, format = "%m/%d/%y"
  )

  # Run the function
  out_of_order_rows <- validate_date_order(
    mouse_data,
    date_cols = c("Date_1", "Date_2", "Date_3")
  )

  # Check that only the out-of-order row is flagged
  expect_equal(nrow(out_of_order_rows), 1)
  expect_equal(out_of_order_rows$ID, "Mouse_2")
})
