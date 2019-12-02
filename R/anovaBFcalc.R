#' An interactive Shiny application for computing Bayes factors from ANOVA summary statistics
#'
#' @import shiny
#' @export
#' @note The interactive app can be directly accessed on-line. Check See Also section.
#' @seealso Online version: \url{https://tomfaulkenberry.shinyapps.io/anovaBFcalc}
#' @author Thomas J. Faulkenberry <faulkenberry@tarleton.edu>
#' @param run run the interactive app (or not). Default is TRUE, meaning that the app will be lanuched.
#' @param report_path report the directory of the app in your system. Default is FALSE, which will show the online app link.
#' @examples
#' if (interactive()) {
#'   anovaBFcalc::anovaBFcalc()
#' }
anovaBFcalc <- function(run = T, report_path = F) {
  app <- system.file("anovaBF",
                     package = 'anovaBFcalc')
  if (run == T) {shiny::runApp(app)}
  if (run == F) {
    if (report_path == T){
      return(app)
    }
    if (report_path == F){
      onlineapp <- "Have fun with anovaBFcalc : https://tomfaulkenberry.shinyapps.io/anovaBFcalc"
      return(onlineapp)
    }
  }
}
