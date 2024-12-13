#' Summarizes the Class and Missingness of Columns in a Dataframe
#'
#' `summarize_columns()` finds the class of all columns in a dataframe and the number of missing values
#'
#' @param data A data frame.
#'
#' @returns
#' A summary table containing each column name along with its class and number of missing values.
#'
#' @examples
#' summarize_columns(footballbetting23)
#' summarize_columns(bodyweight)
#'
#' @export
summarize_columns <- function(data) {
  if (!is.data.frame(data)) {
    stop("Input must be a data frame!")
  }

  summary_table <- data.frame(
    Column = colnames(data),
    Class = sapply(data, class),
    Missing_Values = sapply(data, function(x) sum(is.na(x)))
  )

  return(summary_table)
}
