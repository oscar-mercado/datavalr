
<!-- README.md is generated from README.Rmd. Please edit that file -->

# datavalr: Tools for Data Validation and Quality Assessment

## Why should I use this package?

Data quality is critical for accurate analysis and decision-making. The
**datavalr** package provides an essential toolkit for validating
datasets, diagnosing common data issues, and performing quality control
checks. Whether you are working with real-world messy data or aiming to
ensure data integrity in predictive modeling, **datavalr** offers robust
and intuitive functions for exploratory data analysis and cleaning.

The goal of datavalr is to diagnose primarily data entry errors,
flagging them for collaborators to fix before further statistical
analysis. The package can denote outliers, misclassification of data
frame columns, showcase missingness in data frames, and diagnose other
data entry errors.

### Key Features

- **Diagnose Empty Values**: Quickly identify columns with empty
  strings, assessing their prevalence and offering a data frame with
  NA’s replacing the empty strings.
- **Summarize Columns**: Generate insights about column data types and
  missingness
- **Track Outliers**: Detect and visualize possible mice outliers by
  flagging irregular weight trends over time.
- **Validate data consistency**: Ensure chronological order and logical
  consistency of time series mice data.
- **Audit Betting Metrics**: Evaluate and flag anomalies in betting
  metrics like spreads and over/under lines.

Designed with ease of use in mind, **datavalr** streamlines data
validation and enhances your workflow.

## How Do I Access the Package?

You can install the development version of datavalr from
[GitHub](https://github.com/oscar-mercado/datavalr) with:

``` r
# install.packages("pak")
pak::pak("oscar-mercado/datavalr")
```

Otherwise install the `devtools` library and run the following code:

``` r
devtools::install_github("oscar-mercado/datavalr")
```

## How Do I Use the Package?

Here are some examples to demonstrate the core functionality of
**datavalr**:

``` r
library(datavalr)
df <- footballbetting23
summarize_columns(df)
#>                                  Column     Class Missing_Values
#> schedule_date             schedule_date character              0
#> schedule_season         schedule_season   integer              0
#> schedule_week             schedule_week character              0
#> schedule_playoff       schedule_playoff   logical              0
#> team_home                     team_home character              0
#> score_home                   score_home   integer              0
#> score_away                   score_away   integer              0
#> team_away                     team_away character              0
#> team_favorite_id       team_favorite_id character              0
#> spread_favorite         spread_favorite   numeric              0
#> over_under_line         over_under_line   numeric              0
#> stadium                         stadium character              0
#> stadium_neutral         stadium_neutral   logical              0
#> weather_temperature weather_temperature   integer            180
#> weather_wind_mph       weather_wind_mph   integer            180
#> weather_humidity       weather_humidity   integer            277
#> weather_detail           weather_detail character              0
#> over_under                   over_under character              0
```

The first example above loads the `footballbetting23` dataset in the
library and uses the `summarize_columns()` function. This generates a
comprehensive data table summarizing the columns of our dataframe
including data types and missing values for each column. This helps
collaborators determine data entry errors if they want columns to have
different classes or further analyze the missingness in the data.
Through further exploration of the football data frame, I observe
something unique: the `weather_detail` column contains empty strings as
possible values but are not counted as missing

    #> [1] ""       "indoor"

In this case, we can use the `diagnose_empty_values()` function to
determine the count of empty string values and replace them with NA’s if
collaborators desire:

``` r
diagnosis <- diagnose_empty_values(df)
head(diagnosis$Modified_Data)
#>   schedule_date schedule_season schedule_week schedule_playoff
#> 1      9/7/2023            2023             1            FALSE
#> 2     9/10/2023            2023             1            FALSE
#> 3     9/10/2023            2023             1            FALSE
#> 4     9/10/2023            2023             1            FALSE
#> 5     9/10/2023            2023             1            FALSE
#> 6     9/10/2023            2023             1            FALSE
#>            team_home score_home score_away          team_away team_favorite_id
#> 1 Kansas City Chiefs         20         21      Detroit Lions               KC
#> 2    Atlanta Falcons         24         10  Carolina Panthers              ATL
#> 3   Baltimore Ravens         25          9     Houston Texans              BAL
#> 4      Chicago Bears         20         38  Green Bay Packers              CHI
#> 5   Cleveland Browns         24          3 Cincinnati Bengals              CIN
#> 6     Denver Broncos         16         17  Las Vegas Raiders              DEN
#>   spread_favorite over_under_line                         stadium
#> 1            -4.5            53.0 GEHA Field at Arrowhead Stadium
#> 2            -3.5            39.5           Mercedes-Benz Stadium
#> 3            -9.5            43.5                M&T Bank Stadium
#> 4            -1.0            41.5                   Soldier Field
#> 5            -2.0            47.5             FirstEnergy Stadium
#> 6            -3.5            43.0      Empower Field at Mile High
#>   stadium_neutral weather_temperature weather_wind_mph weather_humidity
#> 1           FALSE                  NA               NA               NA
#> 2           FALSE                  72                0               NA
#> 3           FALSE                  NA               NA               NA
#> 4           FALSE                  NA               NA               NA
#> 5           FALSE                  NA               NA               NA
#> 6           FALSE                  NA               NA               NA
#>   weather_detail over_under
#> 1           <NA>      under
#> 2         indoor      under
#> 3           <NA>      under
#> 4           <NA>       over
#> 5           <NA>      under
#> 6           <NA>      under
diagnosis$Empty_Values_Summary
#> weather_detail 
#>            188
```

## Additional Information

For more advanced examples and explanations, please refer to the package
vignette:

``` r
vignette("datavalr")
```

## Contributions

Contributions are welcome! Feel free to fork the repository, submit
issues, or propose enhancements. Contact me at
<oscarmercado@college.harvard.edu> for any inquiries.

## License

This package is licensed under GPL (\>= 3). See the LICENSE file for
more details.
