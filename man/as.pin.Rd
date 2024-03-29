% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pin.R
\name{as.pin}
\alias{as.pin}
\alias{is.pin}
\title{Parse personal identity numbers to ABS format}
\usage{
as.pin(pin)

is.pin(pin)
}
\arguments{
\item{pin}{Vector with swedish personal identity numbers in character or numeric format. 
See details.}
}
\value{
\code{as.pin} returns a vector of class "pin" (with additional classes "AsIs" and character) 
with swedish personal identity numbers with standard ABS format \code{"YYYYMMDDNNNC"}.
\code{is.pin} returns \code{TRUE} if \code{pin} is of class "pin", otherwise \code{FALSE}.
}
\description{
\code{as.pin} Converts personal identity numbers of different formats to standard (ABS) 
pin format \code{YYYYMMDDNNNC} where \code{YYYYMMDD} is the date of birth, \code{NNN} 
is the birth number and \code{C} is the
control number.
\code{is.pin} checks wether an R object is of class "pin".
}
\details{
\code{as.pin} converts different formats of swedish personal identity numbers to
the standard ABS format. The formats that can be converted are:
\itemize{
  \item numeric: \code{YYYYMMDDNNNC}
  \item numeric: \code{YYMMDDNNNC} (assuming < 100 years of age)
  \item character: \code{"YYYYMMDDNNNC"}
  \item character: \code{"YYMMDD-NNNC"},  \code{"YYMMDD+NNNC"}
  \item character: \code{"YYYYMMDD-NNNC"}
  \item character: \code{"YYMMDDNNNC"} (assuming < 100 years of age)
}
(where "C" can be substituted by characters "A", "T" or "X" if "YYYY" < 1967).
}
\examples{
# Examples taken from SKV 704 (see references)
ex_pin1 <- c("196408233234", "640823-3234", "19640823-3234")
as.pin(pin = ex_pin1)
ex_pin2 <- c("6408233234")
as.pin(ex_pin2)
ex_pin3 <- c(6408233234, 196408233234)
as.pin(ex_pin3)
ex_pin4 <-rep(c("20121209-0122", "201212090122", "121209-0122", "1212090122"),250)
as.pin(ex_pin4)
ex_pin5 <-c("205012090122", "186512090122", "121209-0122", "121209-012A")
as.pin(pin = ex_pin5)
pin <-c("201212090122", "201212090122", "121209-0122", "1212090122")

ex_pin <- rpin(3)
is.pin(ex_pin)

ex_pin_char <- as.character(ex_pin)
is.pin(ex_pin_char)

}
\references{
\itemize{
 \item \href{https://github.com/rOpenGov/sweidnumbr/blob/master/docs/skv717B-4.pdf}{Skatteverket, \emph{Population registration in Sweden}, SKV 717B} (2007)
 \item \href{https://github.com/rOpenGov/sweidnumbr/blob/master/docs/skv704-8.pdf}{Skatteverket, \emph{Personnummer}, SKV 704} (2007)
 \item \href{https://www.riksdagen.se/sv/dokument-och-lagar/dokument/statens-offentliga-utredningar/personnummer-och-samordningsnummer-del-1_gwb360/}{SOU 2008:60 : Personnummer och samordningsnummer} (2008)
 \item \emph{Personnummer: information fran Centrala folkbokförings- och uppbördsnämnden.} (1967). Stockholm
 \item \emph{Den svenska folkbokföringens historia under tre sekel.} (1982). Solna: Riksskatteverket \href{http://www.skatteverket.se/privat/folkbokforing/omfolkbokforing/folkbokforingigaridag/densvenskafolkbokforingenshistoriaundertresekler.4.18e1b10334ebe8bc80004141.html}{URL}
}
}
