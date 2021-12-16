## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(Metaan)

## -----------------------------------------------------------------------------
data(IHD)
print(IHD)

## -----------------------------------------------------------------------------
alpexfix(err=IHD$err,
         u=IHD$upper_ci,
         l=IHD$lower_ci,
         d=IHD$max_dose)

## -----------------------------------------------------------------------------
alpexrand(err=IHD$err,
         u=IHD$upper_ci,
         l=IHD$lower_ci,
         d=IHD$max_dose)

## -----------------------------------------------------------------------------
pexfix(err=IHD$err,
         u=IHD$upper_ci,
         l=IHD$lower_ci)

## -----------------------------------------------------------------------------
pexrand(err=IHD$err,
         u=IHD$upper_ci,
         l=IHD$lower_ci)

## -----------------------------------------------------------------------------
exsens(study = IHD$Study,
       err=IHD$err,
         u=IHD$upper_ci,
         l=IHD$lower_ci,
         d=IHD$max_dose,
         test = "RANDOM", # you can choose test="FIXED" for the fixed effect model
       model = "alternative") # you can choose model = "standard" for the fixed effect model

## -----------------------------------------------------------------------------
exsens(study = IHD$Study,
       err=IHD$err,
         u=IHD$upper_ci,
         l=IHD$lower_ci, # d=NULL when using the standard model with model = "standard"
         test = "RANDOM", # you can choose test="FIXED" for the fixed effect model
       model = "standard")

