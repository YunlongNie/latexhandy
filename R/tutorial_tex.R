#' This function write a tex file with certain template
#' @param writeto the resulting tex file, full name ended with .tex, a string 
#' @export
#' @import dplyr
#' @examples
#' \dontrun{
#' tutorial_tex(writeto='tutorial_temp.tex',type="tutorial")
#' }

tutorial_tex <- function(writeto,type='tutorial')
{
  eval(parse(text =sprintf("data(%s)",type)))
  sink(writeto)
  tutorial%>%cat(.,sep="\n")
  sink()
}
