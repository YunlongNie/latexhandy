#' This function write a tex file to insert the figure into your latex file 
#' @param writeto the resulting tex file, full name ended with .tex, a string 
#' @param filename the filename for the figure, full name, a string 
#' @param caption figure caption name, a string 
#' @param label figure label, a string 
#' @param landscape  TRUE or FALSE, landscape or not 
#' @export
#' @examples
#' \dontrun{
#' print.figure('figure.tex'),filename = "yourfigure.pdf",caption = "figure title",label="yourlabel",landscape=FALSE)
#' }

print.figure <- function(writeto,filename,placement="hppt",caption,label,shcap,scale=1,height=FALSE,landscape=FALSE)
{
  figname = "figure" 
  if (landscape) {

    figname = "sidewaysfigure";placement="ht";
    cat("note that using landscape you have to use 
    \\usepackage{rotating}
    \\usepackage{MnSymbol}
    \\usepackage{wasysym}")
   }
  sink(writeto)
  cat("\\begin{",figname,"}[",placement,"]\n",sep="")
  cat("\\begin{center}\n",sep="")
  if (!height) {cat("\\includegraphics[width=",scale,"\\textwidth]{",filename,"}\n",sep="")} else cat("\\includegraphics[height=",scale,"\\textheight]{",filename,"}\n",sep="")
  cat("\\end{center}\n",sep="")
  if((!missing(caption))&missing(shcap)) {cat("\\caption","{", caption,"}\n",sep="")} else cat("\\caption[",shcap,"]","{", caption,"}\n",sep="")
  if(!missing(label)) {cat("\\label{", label,"}\n",sep="")}
  cat("\\end{",figname,"}\n",sep="")
  sink()
  system(paste("cat",writeto))
}
