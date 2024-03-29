% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pin.R
\name{pin_ctrl}
\alias{pin_ctrl}
\title{Check control number from \code{pin}}
\usage{
pin_ctrl(pin, force_logical = FALSE)
}
\arguments{
\item{pin}{A vector of class \code{pin}. See \link{as.pin}.}

\item{force_logical}{If TRUE, force all NA in pin to be FALSE. Default is FALSE.}
}
\value{
Logical vector indicating if a pin is correct (\code{TRUE}) or not (\code{FALSE})
}
\description{
Calculates the control number using the Luhn algorithm and compare it with the 
control number in the personal identity number.
}
\examples{
# Examples taken from SKV 704 (see references)
ex_pin <- c("196408233234", "196408233235")
pin_ctrl(ex_pin)

}
\references{
\itemize{
 \item Skatteverket, \href{https://github.com/rOpenGov/sweidnumbr/blob/master/docs/skv717B-4.pdf}{\emph{Population registration in Sweden}}. SKV 717B. (2007)
 \item Skatteverket, \href{https://github.com/rOpenGov/sweidnumbr/blob/master/docs/skv704-8.pdf}{\emph{Personnummer}}. SKV 704. (2007)
 \href{https://www.riksdagen.se/sv/dokument-och-lagar/dokument/statens-offentliga-utredningar/personnummer-och-samordningsnummer-del-1_gwb360/}{SOU 2008:60 : Personnummer och samordningsnummer}, (2008)
}
}
