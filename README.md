
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Metaan

<!-- badges: start -->

[![Travis build
status](https://travis-ci.com/Package-Metaan-Rep/Metaan.svg?branch=master)](https://travis-ci.com/Package-Metaan-Rep/Metaan)
<!-- badges: end -->

The goal of Metaan package is to help user to compute a Meta-Analysis of
Published Epidemiological Studies.

## Description:

This package helps to combine estimates from published individual
studies and provide a summarized or a pooled estimate of evidence. It
makes use of statistical methods of meta-analysis computation such as
the fixed effect model and the random effect model. These methods are
ready for risk estimates (e.g relative risk (RR), odds ratio (OR) and
hazard ratio (HR)) meta-analyses but are improved using the alternative
method of Richardson et al 2020 for the computation of excess relative
risk (ERR) estimates metanalyses.

## Installation

You can install the released version of Metaan from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("Metaan")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(Metaan)
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
up-to-date.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub\!
