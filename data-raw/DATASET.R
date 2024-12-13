## code to prepare `DATASET` dataset goes here

footballbetting23 <- utils::read.csv("/Users/Oscar/Downloads/spreadspoke_scores.csv")[, 1:17]|>
  dplyr::filter(schedule_season == 2023) |>
  dplyr::mutate(over_under = dplyr::case_when(score_home + score_away > over_under_line ~ "over",
                                              score_home + score_away < over_under_line ~ "under",
                                              score_home + score_away == over_under_line ~ "push"))

usethis::use_data(footballbetting23, overwrite = TRUE)
