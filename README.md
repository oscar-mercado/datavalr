
<!-- README.md is generated from README.Rmd. Please edit that file -->

# datavalr: Tools for Data Validation and Quality Assessment

## Why should I use this package?

Data quality is critical for accurate analysis and decision-making. The
**datavalr** package provides an essential toolkit for validating
datasets, diagnosing common data issues, and performing quality control
checks. Whether you are working with real-world messy data or aiming to
ensure data integrity in predictive modeling, **datavalr** offers robust
and intuitive functions for exploratory data analysis and cleaning.

<!-- badges: start -->
<!-- badges: end -->

The goal of datavalr is to …

## Installation

You can install the development version of datavalr from
[GitHub](https://github.com/oscar-mercado/datavalr) with:

``` r
# install.packages("pak")
pak::pak("oscar-mercado/datavalr")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(datavalr)
## basic example code
```

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub and CRAN.

``` r
# Add a new observation with dates out of order
new_observation <- data.frame(
  ID = "New.Mouse",
  Body.Weight.1 = 22.5,
  Date.Body.Weight.1 = "10/12/24",
  Body.Weight.2 = 21.8,
  Date.Body.Weight.2 = "10/5/24", # Out of order
  Body.Weight.3 = 21.0,
  Date.Body.Weight.3 = "10/19/24"
)

# Combine the new observation with the existing data
body_weight_data <- rbind(bodyweight, new_observation)

# Print the updated dataset
validate_date_order(body_weight_data, 
                    date_cols = c("Date.Body.Weight.1", 
                                  "Date.Body.Weight.2", 
                                  "Date.Body.Weight.3"))
#>           ID Body.Weight.1 Date.Body.Weight.1 Body.Weight.2 Date.Body.Weight.2
#> 33 New.Mouse          22.5         2024-10-12          21.8         2024-10-05
#>    Body.Weight.3 Date.Body.Weight.3
#> 33            21         2024-10-19
```
