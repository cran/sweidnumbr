## ----install, eval=FALSE-------------------------------------------------
#  install.packages("sweidnumbr")

## ----test, message=FALSE, warning=FALSE, eval=TRUE-----------------------
library(sweidnumbr)

## ----locale, eval=FALSE--------------------------------------------------
#  Sys.setlocale(locale="UTF-8")

## ----example1, message=FALSE, eval=TRUE----------------------------------
example_pin <- c("640823-3234", "6408233234", "19640823-3230")
example_pin <- pin_format(example_pin)
example_pin

## ----example2, message=FALSE, eval=TRUE----------------------------------
is.pin(example_pin)

## ----example3, message=FALSE, eval=TRUE----------------------------------
pin_ctrl(example_pin)

## ----example4, message=FALSE, eval=TRUE----------------------------------
pin_sex(example_pin)
pin_birthplace(example_pin)

## ----example5, message=FALSE, eval=TRUE----------------------------------
pin_age(example_pin)
pin_age(example_pin, date = "2000-01-01")

## ----citation, message=FALSE, eval=TRUE----------------------------------
citation("sweidnumbr")

## ----sessioninfo, message=FALSE, warning=FALSE---------------------------
sessionInfo()

