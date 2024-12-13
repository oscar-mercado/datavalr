#' Title
#'
#' @param data
#' @param metric_cols
#' @param ranges
#'
#' @return
#' @export
#'
#' @examples
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
