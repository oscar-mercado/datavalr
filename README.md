
<!-- README.md is generated from README.Rmd. Please edit that file -->

# stat108project2

<!-- badges: start -->
<!-- badges: end -->

The goal of stat108project2 is to …

## Installation

You can install the development version of stat108project2 from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("oscar-mercado/stat108-Rpackage")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(stat108project2)
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
  Date.Body.Weight.2.1 = "10/19/24"
)

# Combine the new observation with the existing data
body_weight_data <- rbind(bodyweight, new_observation)

# Print the updated dataset
print(body_weight_data)
#>              ID Body.Weight.1 Date.Body.Weight.1 Body.Weight.2
#> 1   C57BL6J_M_1      23.81000            10/5/24         23.82
#> 2   C57BL6J_M_2      22.27000            10/5/24         22.09
#> 3   C57BL6J_M_3      23.12000            10/5/24         23.22
#> 4   C57BL6J_M_4      23.23000            10/5/24         22.84
#> 5   C57BL6J_F_5      19.89000            10/5/24         20.14
#> 6   C57BL6J_M_6      22.71000            10/5/24         22.59
#> 7   C57BL6J_M_7      19.33000            10/5/24         19.18
#> 8   C57BL6J_M_8      26.21000            10/5/24         25.76
#> 9   C57BL6J_F_9      21.33000            10/5/24         21.43
#> 10 C57BL6J_F_10      25.55000            10/5/24         25.86
#> 11 C57BL6J_F_11      24.48000            10/5/24         24.58
#> 12 C57BL6J_F_12      21.70000            10/5/24         21.75
#> 13 C57BL6J_F_13      21.05000            10/5/24         21.27
#> 14 C57BL6J_F_14      22.36000            10/5/24         22.49
#> 15 C57BL6J_F_15      20.01614            10/5/24         19.65
#> 16 C57BL6J_F_16      21.19000            10/5/24         21.18
#> 17 C57BL6J_M_17      20.97000            10/5/24         20.84
#> 18 C57BL6J_M_18      20.60000            10/5/24         20.54
#> 19 C57BL6J_M_19      22.92000            10/5/24         23.08
#> 20 C57BL6J_M_20      22.34000            10/5/24         22.19
#> 21 C57BL6J_M_21      22.64000            10/5/24         22.59
#> 22 C57BL6J_M_22      23.51000            10/5/24         23.50
#> 23 C57BL6J_M_23      20.68000            10/5/24         20.50
#> 24 C57BL6J_M_24      26.93000            10/5/24         15.93
#> 25 C57BL6J_F_25      15.48000            10/5/24         26.97
#> 26 C57BL6J_M_26      21.17000            10/5/24         21.29
#> 27 C57BL6J_F_27      18.67000            10/5/24         18.64
#> 28 C57BL6J_F_28      19.21000            10/5/24         18.86
#> 29 C57BL6J_F_29      19.06000            10/5/24         18.99
#> 30 C57BL6J_F_30      19.49000            10/5/24         19.71
#> 31 C57BL6J_F_31      20.79000            10/5/24         20.84
#> 32 C57BL6J_F_32      31.03000            10/5/24         19.07
#> 33    New.Mouse      22.50000           10/12/24         21.80
#>    Date.Body.Weight.2 Body.Weight.3 Date.Body.Weight.2.1
#> 1            10/12/24         24.11             10/19/24
#> 2            10/12/24         22.62             10/19/24
#> 3            10/12/24         22.86             10/19/24
#> 4            10/12/24         23.22             10/19/24
#> 5            10/12/24         19.71             10/19/24
#> 6            10/12/24         22.80             10/19/24
#> 7            10/12/24         19.58             10/19/24
#> 8            10/12/24         26.67             10/19/24
#> 9            10/12/24         20.93             10/19/24
#> 10           10/12/24         24.98             10/19/24
#> 11           10/12/24         24.74             10/19/24
#> 12           10/12/24         21.42             10/19/24
#> 13           10/12/24         21.47             10/19/24
#> 14           10/12/24         22.50             10/19/24
#> 15           10/12/24         20.42             10/19/24
#> 16           10/12/24         21.02             10/19/24
#> 17           10/12/24         20.64             10/19/24
#> 18           10/12/24         20.69             10/19/24
#> 19           10/12/24         22.48             10/19/24
#> 20           10/12/24         22.20             10/19/24
#> 21           10/12/24         22.97             10/19/24
#> 22           10/12/24         23.28             10/19/24
#> 23           10/12/24         21.14             10/19/24
#> 24           10/12/24         15.10             10/19/24
#> 25           10/12/24         27.22             10/19/24
#> 26           10/12/24         21.77             10/19/24
#> 27           10/12/24         18.25             10/19/24
#> 28           10/12/24         19.42             10/19/24
#> 29           10/12/24         18.87             10/19/24
#> 30           10/12/24         19.66             10/19/24
#> 31           10/12/24            NA             10/19/24
#> 32           10/12/24         18.89             10/19/24
#> 33            10/5/24         21.00             10/19/24
```
