#' Compute BIC Bayes factor from ANOVA summary statistics.
#' 
#' This function employs the BIC method (Kass and Raftery, 1995) 
#' to compute an approximation of the Bayes factor.
#' 
#' Minimally, the user must provide three inputs:
#' F = the observed F statistic
#' df1 = the "between-treatments" degrees of freedom
#' df2 = the residual degrees of freedom
#' 
#' The function outputs the value of BF_01 by default,
#' though this can be changed to BF_10 by the user (see
#' below).
#' 
#' @param F the observed F statistic
#' @param df1 the between-treatments degrees of freedom
#' @param df2 the residual degrees of freedom
#' @param repeated a logical indicating whether design is repeated
#'     measures (TRUE) or between subjects (FALSE). Defaults to FALSE
#' @param report.as a string indicating whether to report Bayes factor
#'     as support for null ("BF01") or alternative ("BF10"). Defaults
#'     to "BF01"
#' @export
#' @author Thomas J. Faulkenberry <faulkenberry@tarleton.edu>
#' @references Kass, R. E., & Raftery, A. E. (1995). Bayes Factors. 
#'     Journal of the American Statistical Association, 90(430), 773. doi:10.2307/2291091
#' 
#' @examples
#' ## using BIC approximation
#' ## between subjects design, observed F(3,96) = 2.76
#' bf_bic(F=2.76, df1=3, df2=96)
#' 
#' ## repeated measures design, observed F(1,22) = 1.336
#' bf_bic(F=1.336, df1=1, df2=22, repeated=TRUE)
#' 
#' ## between subjects design, observed F(2,25) = 5.43
#' ## report as support for alternative
#' bf_bic(F=5.43, df1=2, df2=25, report.as="BF10")

bf_bic <- function(F, df1, df2, repeated=FALSE, report.as="BF01") {
  if (repeated==FALSE) {
      N = df1+df2+1
    } 
    else {
      N = df1+df2
    }
  
  bf = sqrt(N^df1*(1+F*df1/df2)^(-1*N))
  
  if (report.as=="BF01"){
    return(c(B01=bf))
  }
  else {
    return(c(B10=1/bf))
  }
}
