# ANOVA Bayes Factor Calculator

[![Build Status](https://travis-ci.org/tomfaulkenberry/anovaBFcalc.svg?branch=master)](https://travis-ci.org/tomfaulkenberry/anovaBFcalc)

`anovaBFcalc` is an R package that is designed to help users easily calculate Bayes factors from minimal ANOVA summary statistics (i.e., the F statistic and the degrees of freedom of the test). It contains two R functions and an interactive Shiny app; the app's usage is described in the paper "Estimating evidential value from ANOVA summaries: A comment on Ly et al. (2018)", published in *Advances in Methods and Practices in Psychological Science*. 

- published version at [AMPPS](https://journals.sagepub.com/doi/10.1177/2515245919872960)
- preprint available on [PsyArXiv](https://psyarxiv.com/35wyv/)

## How to use the app

#### 1\. Github version (Development version)

To run the `anovaBFcalc` Shiny app on your computer locally, the following R packages are required:

  - [`devtools`](https://cran.r-project.org/web/packages/devtools/index.html)
  - [`shiny`](https://cran.r-project.org/web/packages/shiny/index.html)
  - [`plotrix`](https://cran.r-project.org/web/packages/plotrix/index.html)

They may be installed by typing the following at the R console:

``` r
install.packages("devtools")
install.packages("shiny")
install.packages("plotrix")
```

Now, to install and launch the `anovaBFcalc` app, type the following commands:

``` r
devtools::install_github("tomfaulkenberry/anovaBFcalc")
anovaBFcalc::anovaBFcalc()
```

#### 2\. shinyapps.io version (Standard version)

If you want to use the standard version of the `anovaBFcalc` interactive app, installation is
not required. The application is already deployed on the **shinyapps.io** server, 
and can be found at the following link: https://tomfaulkenberry.shinyapps.io/anovaBFcalc/


