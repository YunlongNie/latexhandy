#' This function print the latex code for a input matrix
#' @param matr input matrix 
#' @export
#' @examples
#' \dontrun{
#' print.figure('figure.tex'),filename = "yourfigure.pdf",caption = "figure title",label="yourlabel",landscape=FALSE)
#' }

matrix2latex <- function(matr,environment.matrix="bmatrix") {
printmrow <- function(x) {
       cat(cat(x,sep=" & "),"\\\\ \n")
}
cat(sprintf("\\begin{%s}",environment.matrix),"\n")
body <- apply(matr,1,printmrow)
cat(sprintf("\\end{%s}",environment.matrix))
}