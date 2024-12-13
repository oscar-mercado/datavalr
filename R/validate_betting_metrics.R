#' Find data entry errors for betting lines
#'
#' `validate_betting_metrics()` finds betting lines (total score props and/or spreads) that exceed
#' a user defined input range. Therefore, the function flags potentially data entry issues
#' (e.g., spread in the data is -20 when actually it was -2).
#'
#'
#' @param data A data frame
#' @param metric_cols A vector of betting columns that the user wants to explore for anomalies
#' @param ranges A list of vector user input ranges defining valid betting lines
#'
#' @returns A data frame of observations with values for betting columns outside the user defined
#' valid range of betting lines.
#'
#' @examples
#' validate_betting_metrics(footballbetting23, metric_cols = c("spread_favorite", "over_under_line"),
#'   ranges = list(spread_favorite = c(-10, 0), over_under_line = c(20, 40)))
#'
#' @export
validate_betting_metrics <- function(data, metric_cols, ranges = list()) {
  anomalies <- list()
  for(col in metric_cols) {
    if (col %in% names(ranges)) {
      range <- ranges[[col]]
      anomalies[[col]] <- data[!(data[[col]] >= range[1] & data[[col]] <= range[2]), ]
    } else {
      anomalies[[col]] <- data[is.na(data[[col]]), ]
    }
  }
  return(anomalies)
}
