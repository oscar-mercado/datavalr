#' Title
#'
#' @param data
#' @param id_col
#' @param weight_cols
#' @param threshold
#'
#' @return
#' @export
#'
#' @examples
track_outlier_mice <- function(data, id_col = "ID",
                               weight_cols = c("Body.Weight.1", "Body.Weight.2",
                                               "Body.Weight.3"),
                               threshold = 0.2) {

  # Ensure numeric columns and calculate percent change
  data <- data |>
    dplyr::mutate(dplyr::across(dplyr::all_of(weight_cols), as.numeric,
                                .names = "clean_{.col}")) |>
    dplyr::rowwise() |>
    dplyr::mutate(Max_Percent_Change =
                    max(abs(
                      dplyr::across(dplyr::starts_with("clean_"),
                                    .fns = ~ (. - dplyr::first(dplyr::c_across(dplyr::starts_with("clean_")))) /
                                      dplyr::first(dplyr::c_across(dplyr::starts_with("clean_"))))))) |>
    dplyr::ungroup()

  # Get outlier data
  flagged_data <- data |>
    dplyr::filter(Max_Percent_Change > threshold)
  flagged_ids <- flagged_data[[id_col]]

  # Convert data to long for longitudinal plot
  long_data <- data |>
    tidyr::pivot_longer(cols = starts_with("clean_"),
                        names_to = "Time_Point",
                        values_to = "Body_Weight") |>
    dplyr::select(id_col, Time_Point, Body_Weight) |>
    dplyr::filter(get(id_col) %in% flagged_ids)

  # Longitudinal plot of mice body weight over recording periods
  flagged_plot <- ggplot2::ggplot(long_data,
                         ggplot2::aes(x = Time_Point,
                                      y = Body_Weight,
                                      group = get(id_col))) +
    ggplot2::geom_line(ggplot2::aes(color = get(id_col))) +
    ggplot2::geom_point() +
    ggplot2::labs(title = "Longitudinal Body Weight Trends for Potentially Outlier Mice",
         x = "Time Point",
         y = "Body Weight",
         color = "Mouse ID") +
    ggplot2::theme_minimal()

  # Return flagged mice dataset and plot
  list(flagged_data = flagged_data,
       flagged_plot = flagged_plot)
}
