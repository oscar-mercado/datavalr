#' Flags potential Data input errors by finding mice weight outliers
#'
#' `track_outlier_mice()` takes in lab mice bodyweight data and finds potential outlier mice
#' denoting potential data entry errors. The function returns a data frame of the suspect mice
#' and a longitudinal plot showing the mice weight over time flagging spikes and valleys in mice weight.
#'
#' @param data A data frame.
#' @param id_col A string denoting the name of the column storing observation ID
#' @param weight_cols A vector of the weight columns
#' @param threshold A threshold of weight difference that will flag outlier mice
#'
#' @returns A dataframe containing the suspect mice that contain weight differences exceeding the
#' predetermined threshold. Also returns a longitudinal plot of all suspect mice weight over time.
#'
#' @examples
#' track_outlier_mice(bodyweight, id_col = "ID",
#'   weight_cols = c("Body.Weight.1", "Body.Weight.2", "Body.Weight.3"),
#'   threshold = 0.2)
#'
#' @export
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
