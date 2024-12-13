#' Title
#'
#' @param data
#' @param date_cols
#'
#' @return
#' @export
#'
#' @examples
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
