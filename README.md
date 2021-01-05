
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Metaan

<!-- badges: start -->

[![Travis build
status](https://travis-ci.com/Package-Metaan-Rep/Metaan.svg?branch=master)](https://travis-ci.com/Package-Metaan-Rep/Metaan)
[![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/Package-Metaan-Rep/Metaan?branch=master&svg=true)](https://ci.appveyor.com/project/Package-Metaan-Rep/Metaan)
[![Codecov test
coverage](https://codecov.io/gh/Package-Metaan-Rep/Metaan/branch/master/graph/badge.svg)](https://codecov.io/gh/Package-Metaan-Rep/Metaan?branch=master)
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
method of [Richardson et
al. 2020](https://link.springer.com/article/10.1007/s00411-020-00863-w)
for the computation of excess relative risk (ERR) estimates metanalyses.

## Installation

You can install the released version of Metaan from
[CRAN](https://CRAN.R-project.org) with:

    install.packages("Metaan")

-   Install directly from github :

<!-- -->

    #install.packages("devtools") # if you do not have it already
    devtools::install_github("Package-Metaan-Rep/Metaan")
    library(Metaan)

## Data format

Format the dataset in order to have your individual studies in lines and
the following columns : - A column with your ERR/EOR for each study - A
column with the upper bound of the confidence interval of the ERR/EOR
for each study - A column with the lower bound of the confidence
interval of the ERR/EOR for each study - A column reporting the maximum
dose from each study - A column with the study caracteristics (Authors,
Year of publication etc.). This column is optional and can be replaced
by numbers.

An example of the ischemic heart disease (IHD) dataset:

    data(IHD)
    print(IHD)
    #>                  Study   err lower_ci upper_ci max_dose
    #> 1  Azizova et al. 2010  0.12    0.051    0.186     5.92
    #> 2   Ivanov et al. 2006  0.41    0.050    0.780     0.50
    #> 3     Lane et al. 2010  0.15   -0.140    0.580     0.12
    #> 4  Laurent et al. 2010  4.10   -2.900   13.700     0.60
    #> 5 Muirhead et al. 2009  0.26   -0.050    0.610     0.40
    #> 6  Shimizu et al. 2010  0.02   -0.100    0.150     4.00
    #> 7 Vrijheid et al. 2007 -0.01   -0.590    0.690     0.50
    #> 8   Yamada et al. 2004  0.05   -0.050    0.160     4.00

In this example the “Study” column contains information on the Authors
and the date of the study. “err” is the value of the excess relative
risk (err) reported from the study. “lower\_ci” is the value of the
lower bound of the confidence interval of the risk reported from the
study. “upper\_ci” is the upper bound of the confidence interval of the
risk reported from the study and the “max\_dose” column give the maximum
dose (in millisievert mSv) reported from the study.

## Estimate the summary effect

To estimate the pooled effect from this set of studies, we will make use
of the functions “alpexfix” or “alpexrand” for respectively estimate
using the alternative fixed effect model or the alternative random
effect.For more details about these two models [Richardson et
al. 2020](https://link.springer.com/article/10.1007/s00411-020-00863-w).

-   Estimate the fixed effect summary :

<!-- -->

    alpexfix(err=IHD$err,
             u=IHD$upper_ci,
             l=IHD$lower_ci,
             d=IHD$max_dose)
    #>                                                      
    #>  Alternative meta-analysis with fixed effect model  
    #> ---------------------------------------------------- 
    #>                                                      
    #>   Effect SE-Log(Effect) Lower CI Upper CI
    #>     0.10           0.00     0.05     0.15
    #>                                                      
    #> ---------------------------------------------------- 
    #>                                                      
    #>               Test of heterogeneity  
    #>                                                      
    #>   Cochran Q statistic Degree of Freedom P-Value
    #>                  7.92              7.00    0.34
    #>                                                      
    #> ---------------------------------------------------- 
    #>                                                      
    #>   Higgins and Thompson I^2 (%)
    #>                          11.64
    #> ____________________________________________________ 
    #> 

-   Estimate the random effect summary :

<!-- -->

    alpexrand(err=IHD$err,
             u=IHD$upper_ci,
             l=IHD$lower_ci,
             d=IHD$max_dose)
    #>                                                      
    #>   Alternative meta-analysis with random effect model  
    #> ---------------------------------------------------- 
    #>                                                      
    #>   Effect SE-Log(Effect) Lower CI Upper CI
    #>     0.10           0.00     0.04     0.16
    #>                                                      
    #> ---------------------------------------------------- 
    #>                                                      
    #>               Test of heterogeneity  
    #>                                                      
    #>   Cochran Q statistic Degree of Freedom P-Value
    #>                  7.92              7.00    0.34
    #>                                                      
    #> ---------------------------------------------------- 
    #>                                                      
    #>   Higgins and Thompson I^2 (%)
    #>                          11.64
    #> ____________________________________________________ 
    #> 

These functions estimate the summary effect using the correction method
proposed by Richarson et al.. However user can choose to use the
standard model without correction. To do so, user can choose the
following functions “pexfix” and “pexrand”.

-   Estimate the fixed effect summary using the standard model :

<!-- -->

    pexfix(err=IHD$err,
             u=IHD$upper_ci,
             l=IHD$lower_ci)
    #>                                                   
    #>   Standard meta-analysis with fixed effect model 
    #> ------------------------------------------------- 
    #>                                                   
    #>   Effect SE Effect Lower CI Upper CI
    #>     0.10      0.03     0.05     0.15
    #>                                                   
    #> ------------------------------------------------- 
    #>                                                   
    #>             Test of heterogeneity 
    #>                                                   
    #>   Cochran Q statistic Degree of Freedom P-Value
    #>                  7.52              7.00    0.38
    #>                                                   
    #> ------------------------------------------------- 
    #>                                                   
    #>   Higgins and Thompson I^2 (%)
    #>                           6.91
    #> _________________________________________________ 
    #> 

-   Estimate the random effect summary using the standard model :

<!-- -->

    pexrand(err=IHD$err,
             u=IHD$upper_ci,
             l=IHD$lower_ci)
    #>                                                   
    #>   Standard meta-analysis with random effect model 
    #> ------------------------------------------------- 
    #>                                                   
    #>   Effect SE Effect Lower CI Upper CI
    #>     0.10      0.03     0.04     0.15
    #>                                                   
    #> ------------------------------------------------- 
    #>                                                   
    #>               Test of heterogeneity 
    #>                                                   
    #>   Cochran Q statistic Degree of Freedom P-Value
    #>                  7.52              7.00    0.38
    #>                                                   
    #> ------------------------------------------------- 
    #>                                                   
    #>   Higgins and Thompson I^2 (%)
    #>                           6.91
    #> _________________________________________________ 
    #> 

## Estimate the summary effect in a sensitivity analysis

-   Random effect using the alternative model

<!-- -->

    exsens(study = IHD$Study,
           err=IHD$err,
             u=IHD$upper_ci,
             l=IHD$lower_ci,
             d=IHD$max_dose,
             test = "RANDOM", # you can choose test="FIXED" for the fixed effect model
           model = "alternative") # you can choose model = "standard" for the fixed effect model
    #> Warning in log((C * u + 1)/(C * l + 1)): production de NaN
    #> ALTERNATIVE RANDOM EFFECT MODEL EXCESS RISK ESTIMATE
    #>                  Study Effect SE(Effect) Lower CI Upper CI
    #> 1   Yamada et al. 2004   0.11       0.00     0.03     0.19
    #> 2 Vrijheid et al. 2007   0.10       0.00     0.03     0.17
    #> 3  Shimizu et al. 2010   0.11       0.00     0.05     0.17
    #> 4 Muirhead et al. 2009   0.09       0.00     0.03     0.16
    #> 5  Laurent et al. 2010   0.10       0.00     0.04     0.16
    #> 6     Lane et al. 2010    NaN        NaN      NaN      NaN
    #> 7   Ivanov et al. 2006   0.09       0.00     0.04     0.14
    #> 8  Azizova et al. 2010   0.08       0.01    -0.02     0.16

-   Random effect using the standard model

<!-- -->

    exsens(study = IHD$Study,
           err=IHD$err,
             u=IHD$upper_ci,
             l=IHD$lower_ci,
             d=IHD$max_dose,
             test = "RANDOM", # you can choose test="FIXED" for the fixed effect model
           model = "standard")
    #> STANDARD RANDOM EFFECT MODEL EXCESS RISK ESTIMATE
    #>                  Study Effect SE(Effect) Lower CI Upper CI
    #> 1   Yamada et al. 2004   0.11       0.04     0.04     0.18
    #> 2 Vrijheid et al. 2007   0.10       0.03     0.03     0.16
    #> 3  Shimizu et al. 2010   0.11       0.03     0.06     0.17
    #> 4 Muirhead et al. 2009   0.09       0.03     0.03     0.15
    #> 5  Laurent et al. 2010   0.10       0.03     0.04     0.15
    #> 6     Lane et al. 2010   0.09       0.03     0.03     0.16
    #> 7   Ivanov et al. 2006   0.09       0.03     0.04     0.14
    #> 8  Azizova et al. 2010   0.08       0.04    -0.01     0.16
