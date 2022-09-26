#' start the livestream
#'
#' @param hostname custom domain
#' @param user login for the group
#' @param password password for the group
#' @param port port for tunnel
#' @param scheme use http or https (http seems to be the only thing that works at the moment)
#' @description authorize your online ngrok subscription to work on your computer
#' @details for some reason, https ends up showing a blank page, so forcing http scheme is the only way to get the custom url to work right
#' @importFrom livecode serve_file
#' @importFrom rstudioapi terminalExecute
#' @import remotes
#' @export

livestream_start <- function(hostname = NULL,password = NULL,user = NULL,port = 4040,scheme = 'http'){
 # packs = c('rstudioapi','remotes')
 #  for(i in packs){if(!require(i,character.only = T)){install.packages(i);require(i,character.only = T)}}
 #  if(!require('livecode')){remotes::install_github('rundel/livecode');require(livecode)}

  #https://bitsandbricks.github.io/post/code-live-from-rstudio-and-share-it-with-the-world-in-real-time/
  #troubleshooting install: https://stackoverflow.com/questions/65251887/clang-7-error-linker-command-failed-with-exit-code-1-for-macos-big-sur/65334247#65334247
  #start livecode local server (available only on LAN)
  s <- serve_file(port = port,open_browser = F)
  url = s$url
  #adding -bind-tls=true makes https, but for some reason people just then get a blank white screen
  command = paste0("ngrok http --scheme=",scheme," --hostname=",hostname," --basic-auth='",user,"':'",password,"' ",url)
  print(command)
  terminal_id = terminalExecute(command)
  id = terminalExecute('R --version',show = F)
  return(id)
}
