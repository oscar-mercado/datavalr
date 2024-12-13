#' Title
#'
#' @param data
#'
#' @return
#' @export
#'
#' @examples
diagnose_empty_values <- function(data) {
  empty_values <- sapply(data, function(col) sum(col == "", na.rm=T))
  data[data == ""] <- NA
  list(
    Modified_Data = data,
    Empty_Values_Summary = empty_values[empty_values > 0]
  )
}
