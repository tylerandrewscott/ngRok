#' install ngrok on your computer (based on https://ngrok.com/download)
#'
#' @description checks your OS and installs
#' @export
#' @import jsonlite

install_ngrok <- function(){
  current_loc <- Sys.which('ngrok')
  if(current_loc!=''){
    vers <- system('ngrok --version',intern = TRUE)
    print(paste(vers,'currently installed at',current_loc))
  }else{
   os <- get_os()
   platform <- .Platform$OS.type
   if(platform=='windows'){system('choco install ngrok')}else{
   if(os=='osx'){system('brew install ngrok/ngrok/ngrok')}
   if(os=='linux')system('curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc | sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null && echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | sudo tee /etc/apt/sources.list.d/ngrok.list && sudo apt update && sudo apt install ngrok')
      }
  }
}
