% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/validate_betting_metrics.R
\name{validate_betting_metrics}
\alias{validate_betting_metrics}
\title{Find data entry errors for betting lines}
\usage{
validate_betting_metrics(data, metric_cols, ranges = list())
}
\arguments{
\item{data}{A data frame}

\item{metric_cols}{A vector of betting columns that the user wants to explore for anomalies}

\item{ranges}{A list of vector user input ranges defining valid betting lines}
}
\value{
A data frame of observations with values for betting columns outside the user defined
valid range of betting lines.
}
\description{
\code{validate_betting_metrics()} finds betting lines (total score props and/or spreads) that exceed
a user defined input range. Therefore, the function flags potentially data entry issues
(e.g., spread in the data is -20 when actually it was -2).
}
\examples{
validate_betting_metrics(footballbetting23, metric_cols = c("spread_favorite", "over_under_line"),
  ranges = list(spread_favorite = c(-10, 0), over_under_line = c(20, 40)))

}
