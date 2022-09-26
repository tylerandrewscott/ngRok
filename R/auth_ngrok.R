#' authorize ngrok using your personal token https://dashboard.ngrok.com/get-started/your-authtoken
#'
#' @param token a string token from https://dashboard.ngrok.com/get-started/your-authtoken
#' @description authorize your online ngrok subscription to work on your computer
#' @export

auth_ngrok <- function(token){
  system(paste('ngrok config add-authtoken',token))
  }
