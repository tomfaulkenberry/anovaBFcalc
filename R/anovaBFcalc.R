#' This function computes Bayes factors from ANOVA summary statistics.
#' 
#' Currently, it employs two methods:
#' (1) the BIC method (Kass and Raftery, 1995), and
#' (2) the MWS method, based on methods of Maruyama (2009) 
#' and Wang and Sun (2014).
#' 
#' Minimally, the user must provide three inputs:
#' F = the observed F statistic
#' df1 = the "between-treatments" degrees of freedom
#' df2 = the residual degrees of freedom
#' 
#' The function gives BF_10 as an output.
#' 
#' Additional options may be specified -- see below
#' @param F the observed F statistic
#' @param df1 the between-treatments degrees of freedom
#' @param df2 the residual degrees of freedom
#' @param repeated a logical indicating whether design is repeated
#'     measures (TRUE) or between subjects (FALSE). Defaults to FALSE
#' @param method a string specifying "BIC" method of Kass and Raftery (1995)
#'     or "MWS" method of Maruyama (2009) and Wang and Sun (2014).
#' @param alpha hyperparameter for scale of Pearson Type VI prior. Wang and Sun
#'     recommend choosing alpha between -0.5 and 0. Defaults to -0.5, which 
#'     provides asymptotic approximation to multivariate Cauchy prior.  
#' @export
#' @author Thomas J. Faulkenberry <faulkenberry@tarleton.edu>
#' @references Kass, R. E., & Raftery, A. E. (1995). Bayes Factors. 
#'     Journal of the American Statistical Association, 90(430), 773. doi:10.2307/2291091
#'     
#'     Maruyama, Y. (2009). A Bayes factor with reasonable model selection consistency for 
#'     ANOVA model. arXiv preprint arXiv:0906.4329.
#'     
#'     Wang, M., & Sun, X. (2014). Bayes Factor Consistency for One-way Random Effects Model. 
#'     Communications in Statistics - Theory and Methods, 43(23), 5072–5090. 
#'     doi:10.1080/03610926.2012.739252
#' 
#' @examples
#' ## using BIC approximation
#' ## between subjects design, observed F(3,96) = 2.76
#' anovaBFcalc(F=2.76, df1=3, df2=96)
#' 
#' ## repeated measures design, observed F(1,22) = 1.336
#' anovaBFcalc(F=1.336, df1=1, df2=22, repeated=TRUE)
#' 
#' ## using MWS method with alpha = -0.5 (default)
#' ## observed F(2,15) = 7.16
#' anovaBFcalc(F=7.16, df1=2, df2=15, method="MWS")
#' 
#' ## using alpha=0
#' anovaBFcalc(F=7.16, df1=2, df2=15, method="MWS", alpha=0)

anovaBFcalc <- function(F, df1, df2, repeated=FALSE, method="BIC", alpha=-0.5) {
  if (method=="BIC"){
    if (repeated==FALSE) {
      N = df1+df2+1
    } 
    else {
      N = df1+df2
    }
    return(1/sqrt(N^df1*(1+F*df1/df2)^(-1*N)))
  }
  else if (method=="MWS"){
    if (repeated==FALSE) {
     return(gamma(df1/2+alpha+1)*gamma(df2/2)/gamma(df1/2+df2/2)/gamma(alpha+1)*(df2/(df2+df1*F))^(alpha-df2/2+1)) 
    }
  }
}
