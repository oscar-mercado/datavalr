#' Finds and Returns Columns with empty values (non-NA) and offers a table replacing empty values with NA
#'
#' `diagnose_empty_values()` finds empty values in a dataframe for each column
#'
#' @param data A data frame.
#'
#' @returns
#' A list containing a modified data frame with NAs replacing empty values and
#' a table containing all columns with empty values and the count of such values
#'
#' @examples
#' diagnose_empty_values(footballbetting23)
#'
#' @export
#'
diagnose_empty_values <- function(data) {
  empty_values <- sapply(data, function(col) sum(col == "", na.rm=T))
  data[data == ""] <- NA
  list(
    Modified_Data = data,
    Empty_Values_Summary = empty_values[empty_values > 0]
  )
}
