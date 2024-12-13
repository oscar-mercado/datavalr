#' Verifies data recorded sequentially
#'
#' `validate_date_order()` finds data entry errors where dates for lab mice weight recording do not align
#' (i.e., Date.Body.Weight.2 is an earlier date than the date for initial weight)
#'
#' @param data A data frame.
#' @param date_cols A vector of the date columns in the data frame.
#'
#' @returns A table of mice that do not have dates of weight recordings in order (data entry error)
#'
#' @examples
#' validate_date_order(bodyweight, date_cols=c("Date.Body.Weight.1", "Date.Body.Weight.2",
#'   "Date.Body.Weight.3"))
#'
#'
#' @export
validate_date_order <- function(data, date_cols) {
  data[date_cols] <- lapply(data[date_cols], function(col) {
    as.Date(col, format = "%m/%d/%y")
  })
  out_of_order <- apply(data[date_cols], 1, function(row) {
    date_diffs <- as.double(difftime(row[-1], row[-length(row)], units="days"))
    any(date_diffs < 0, na.rm=T)
  })

  return(data[out_of_order, ])
}
