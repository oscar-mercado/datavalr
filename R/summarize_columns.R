#' Title
#'
#' @param data
#'
#' @return
#' @export
#'
#' @examples
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
