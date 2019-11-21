# ANOVA Bayes Factor Calculator

`anovaBFcalc` is a Shiny app that is designed to calculate Bayes factors from minimal ANOVA summary statistics (i.e., the F statistic and the degrees of freedom of the test).  Its use is described in the paper "Estimating evidential value from ANOVA summaries: A comment on Ly et al. (2018)", published in *Advances in Methods and Practices in Psychological Science*. 

- published version at [AMPPS](https://journals.sagepub.com/doi/10.1177/2515245919872960)
- preprint available on [PsyArXiv](https://psyarxiv.com/35wyv/)

## How to use the app

#### 1\. Github version (Development version)

To run `anovaBFcalc` on your computer locally, the following R packages are required:

  - [`devtools`](https://cran.r-project.org/web/packages/devtools/devtools.pdf)
  - [`shiny`](https://cran.r-project.org/web/packages/shiny/shiny.pdf)

They may be installed by typing the following at the R console:

``` r
install.packages("devtools")
install.packages("shiny")
```

Now, to install and launch `anovaBFcalc`, type the following commands:

``` r
devtools::install_github("tomfaulkenberry/anovaBFcalc")
anovaBFcalc::anovaBFcalc()
```

#### 2\. shinyapps.io version (Standard version)

If you want to use the standard version of `anovaBFcalc`, installation is
not required. The application is already deployed on the **shinyapps.io** server.


