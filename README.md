
<!-- README.md is generated from README.Rmd. Please edit that file -->

# metalearners

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/metalearners)](https://CRAN.R-project.org/package=metalearners)
<!-- badges: end -->

The goal of metalearners is to provide a dataset that arose from a set
of experiments intended to benchmark the time-to-fit and predictive
performance of a number of alternative model stacking methods (or
“meta-learners”) for use in the stacks package.

## Installation

You can install the development version of metalearners like so:

``` r
pak::pak("simonpcouch/metalearners")
```

## Data

The dataset in the metalearners package looks like this:

``` r
library(metalearners)

metalearners
#> # A tibble: 217 × 8
#>    task   meta_learner   recipe  specification elapsed metric estimate estimator
#>    <fct>  <fct>          <fct>   <fct>           <dbl> <chr>     <dbl> <chr>    
#>  1 barley minimal_glmnet Minimal GLM (glmnet)    0.628 rsq       0.977 standard 
#>  2 barley minimal_glmnet Minimal GLM (glmnet)    0.628 rmse      2.29  standard 
#>  3 barley minimal_lgb    Minimal Boosted Tree… 194.    rsq       0.966 standard 
#>  4 barley minimal_lgb    Minimal Boosted Tree… 194.    rmse      3.13  standard 
#>  5 barley minimal_xgb    Minimal Boosted Tree… 263.    rsq       0.973 standard 
#>  6 barley minimal_xgb    Minimal Boosted Tree… 263.    rmse      2.53  standard 
#>  7 barley normalize_bt   Center… Bagged Tree …  25.7   rsq       0.970 standard 
#>  8 barley normalize_bt   Center… Bagged Tree …  25.7   rmse      2.63  standard 
#>  9 barley normalize_nn   Center… Neural Netwo… 407.    rsq       0.859 standard 
#> 10 barley normalize_nn   Center… Neural Netwo… 407.    rmse      5.75  standard 
#> # ℹ 207 more rows
```
