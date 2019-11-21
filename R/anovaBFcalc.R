#' A simple shiny application for computing Bayes factors from ANOVA summary statistics
#'
#' @import shiny
#' @export
#' @note anovaBFcalc can directly be used on-line. Check See Also section.
#' @seealso Online version: \url{https://tomfaulkenberry.shinyapps.io/anovaBFcalc}
#' @seealso Tutorial : \url{https://github.com/tomfaulkenberry/anovaBFcalc}
#' @author Thomas J. Faulkenberry <faulkenberry@tarleton.edu>
#' @param run run the anovaBFcalc app (or not). Default is TRUE, meaning that the app will be lanuched.
#' @param report_Apppath report the directory of the app in your system. Default is FALSE, which will show the online app link.
#' @examples
#' if (interactive()) {
#'   anovaBFcalc::anovaBFcalc()
#' }
anovaBFcalc <- function(run = T, report_Apppath = F) {
  app <- system.file("anovaBF",
                     package = 'anovaBFcalc')
  if (run == T) {shiny::runApp(app)}
  if (run == F) {
    if (report_Apppath == T){
      return(app)
    }
    if (report_Apppath == F){
      onlineapp <- "Have fun with anovaBFcalc : https://tomfaulkenberry.shinyapps.io/anovaBFcalc"
      return(onlineapp)
    }
  }
}
