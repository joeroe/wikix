
<!-- README.md is generated from README.Rmd. Please edit that file -->

# wikix

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/wikix)](https://CRAN.R-project.org/package=wikix)
[![R build
status](https://github.com/joeroe/wikix/workflows/R-CMD-check/badge.svg)](https://github.com/joeroe/wikix/actions)
<!-- badges: end -->

**wikix** is an R package that accesses the
[XTools](https://xtools.wmflabs.org/) API, providing statistics tools
for Wikipedia and other Wikimedia projects.

## Installation

You can install the development version of wikix with the
[remotes](https://remotes.r-lib.org/) package:

``` r
# install.packages("remotes")
remotes::install_github("joeroe/wikix")
```

## Example

Get the number of edits by user [Jimbo
Wales](https://en.wikipedia.org/wiki/User:Jimbo_Wales) on the English
Wikipedia, per month:

``` r
library(wikix)
wpx_user_month_counts("Jimbo Wales")
#> Requesting https://xtools.wmflabs.org/api/user/month_counts/enwiki/Jimbo_Wales
#> ...
#> # A tibble: 4,336 × 4
#>    namespace year  month edits
#>    <chr>     <chr> <chr> <int>
#>  1 Main      2001  3        20
#>  2 Main      2001  4         6
#>  3 Main      2001  5         1
#>  4 Main      2001  6         2
#>  5 Main      2001  7         1
#>  6 Main      2001  8         2
#>  7 Main      2001  9         8
#>  8 Main      2001  10       30
#>  9 Main      2001  11       13
#> 10 Main      2001  12       79
#> # ℹ 4,326 more rows
```
