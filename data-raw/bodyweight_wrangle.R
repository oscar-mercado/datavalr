## code to prepare `DATASET` dataset goes here

bodyweight <- utils::read.csv("/Users/Oscar/Downloads/bodyweight.csv") |>
  dplyr::mutate(Body.Weight.3 = as.numeric(Body.Weight.3)) |>
  dplyr::rename(Date.Body.Weight.3 = Date.Body.Weight.2.1)

usethis::use_data(bodyweight, overwrite = TRUE)
