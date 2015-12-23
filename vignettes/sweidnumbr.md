---
output:
  html_document:
    keep_md: yes
---
<!--
%\VignetteEngine{knitr::knitr}
%\VignetteIndexEntry{sweidnumbr}
\usepackage[utf8]{inputenc}
-->

sweidnumbr : Structural handling of swedish identity numbers
===========

This R package provides tools to work with swedish identity numbers such as personal
identity numbers (personnummer) and organizational identity numbers (organisationsnummer).

## Table of contents

[Installation](#installation) (Installation)  

[Example: personal identity numbers](#examplepin) (Personal identity numbers)

[Example: organizational identity numbers](#exampleoin) (Organizational identity number)

[Licensing and Citations](#licens) (Licensing and Citations)

[References](#references) (References)  

## <a name="installation"></a>Installation

Install the stable release version in R:


```r
install.packages("sweidnumbr")
```

Test the installation by loading the library:


```r
library(sweidnumbr)
```

We also recommend setting the UTF-8 encoding:


```r
Sys.setlocale(locale="UTF-8") 
```

## <a name="examplepin"></a>Example: personal identity numbers

As a first step we need to convert personal identity numbers (pin) to the same standard format used by the Swedish tax authority.


```r
example_pin <- c("640823-3234", "6408233234", "19640823-3230")
example_pin <- as.pin(example_pin)
example_pin
```

```
## [1] "196408233234" "196408233234" "196408233230"
## Personal identity number(s)
```

The next step is to test if the vector is a ```pin``` object. To do this we use the ```is.pin()``` function.


```r
is.pin(example_pin)
```

```
## [1] TRUE
```

This only check the format of the pin. To check the pin using the control number we use ```pin_ctrl()```.


```r
pin_ctrl(example_pin)
```

```
## [1]  TRUE  TRUE FALSE
```

We can now use ```pin_birthplace()``` and ```pin_sex()```. To get information on sex and birthplace.


```r
pin_sex(example_pin)
```

```
## [1] Male Male Male
## Levels: Male
```

```r
pin_birthplace(example_pin)
```

```
## [1] Gotlands län Gotlands län Gotlands län
## 28 Levels: Stockholm stad Stockholms län Uppsala län ... Born after 31 december 1989
```

As the last step we can calculate the age based on the pin. We choose the date where we want to calculate the age. If date is not specified the current date is used.


```r
pin_age(example_pin)
```

```
## [1] 51 51 51
```

```r
pin_age(example_pin, date = "2000-01-01")
```

```
## [1] 35 35 35
```

It is also possible to format the pin for presentation in different forms. (Note however that the output of `format_pin` is just a character and no longer a `pin` object):


```r
format_pin(example_pin, "%Y-%m-%d-%N")
```

```
## [1] "1964-08-23-3234" "1964-08-23-3234" "1964-08-23-3230"
```

```r
format_pin(example_pin, "%P")
```

```
## [1] "(19) 64-08-23 - 3234" "(19) 64-08-23 - 3234" "(19) 64-08-23 - 3230"
```

## <a name="exampleoin"></a>Example: organizational identity numbers

Handling of organizational identity numbers is done in a similar fashion. But organizational numbers are only allowed to have one format.


```r
example_oin <- c("556000-4615", "232100-0156", "802002-4280")
example_oin <- as.oin(example_oin)
example_oin
```

```
## [1] "556000-4615" "232100-0156" "802002-4280"
## Organizational identity number(s)
```

We can test if the vector has a correct format in a similar way as for `pin`.


```r
is.oin(example_oin)
```

```
## [1] TRUE
```

With a vector of `oin` we can check if the organizational number is correct.


```r
oin_ctrl(example_oin)
```

```
## [1] TRUE TRUE TRUE
```

We can also check the type of organization. 


```r
oin_group(example_oin)
```

```
## [1] Aktiebolag                             
## [2] Stat, landsting, kommuner, församlingar
## [3] Ideella föreningar och stiftelser      
## 3 Levels: Aktiebolag ... Stat, landsting, kommuner, församlingar
```

## <a name="licens"></a>Licensing and Citations

This work can be freely used, modified and distributed under the open license specified in the [DESCRIPTION file](https://github.com/MansMeg/sweidnumbr/blob/master/DESCRIPTION).

Kindly cite the work as follows


```r
citation("sweidnumbr")
```

```
## 
## Kindly cite the sweidnumbr R package as follows:
## 
##   Magnusson, Mans and Bulow, Erik (2015). sweidnumbr: R tools to
##   handle of swedish identity numbers. R package version 1.0.0 URL:
##   http://github.com/rOpenGov/sweidnumbr
## 
## A BibTeX entry for LaTeX users is
## 
##   @Misc{,
##     title = {sweidnumbr: R tools to handle of swedish identity numbers.},
##     author = {Mans Magnusson and Erik Bulow},
##     url = {http://github.com/rOpenGov/sweidnumbr},
##     year = {2015},
##     note = {R package version 1.0.0},
##   }
```


## <a name="references"></a>References 

- [Population registration in Sweden](https://www.skatteverket.se/download/18.8dcbbe4142d38302d74be9/1387372677724/717B06.pdf)
- [SKV 704 : Personnummer](https://www.skatteverket.se/download/18.1e6d5f87115319ffba380001857/1285595720207/70408.pdf)
- [SOU 2008:60 : Personnummer och samordningsnummer](http://www.riksdagen.se/sv/Dokument-Lagar/Utredningar/Statens-offentliga-utredningar/Personnummer-och-samordningsnu_GWB360/)
- [Protected personal identity numbers](https://www.skatteverket.se/foretagorganisationer/myndigheter/aviseringavbefolkningsuppgifternavet/skyddadepersonuppgifter.4.18e1b10334ebe8bc80001399.html)
- Personnummer: information fran Centrala folkbokförings- och uppbördsnämnden. (1967). Stockholm
- Den svenska folkbokföringens historia under tre sekel. (1982). Solna: Riksskatteverket [URL](http://www.skatteverket.se/privat/folkbokforing/omfolkbokforing/folkbokforingigaridag/densvenskafolkbokforingenshistoriaundertresekler.4.18e1b10334ebe8bc80004141.html)
- [SKV 709 : Organisationsnummer](http://www.skatteverket.se/download/18.70ac421612e2a997f85800040284/1359707510840/70909.pdf)


## Session info

This vignette was created with


```r
sessionInfo()
```

```
## R version 3.2.3 (2015-12-10)
## Platform: x86_64-apple-darwin13.4.0 (64-bit)
## Running under: OS X 10.10.5 (Yosemite)
## 
## locale:
## [1] C/sv_SE.UTF-8/sv_SE.UTF-8/C/sv_SE.UTF-8/sv_SE.UTF-8
## 
## attached base packages:
## [1] stats     graphics  grDevices utils     datasets  methods   base     
## 
## other attached packages:
## [1] sweidnumbr_1.0.0
## 
## loaded via a namespace (and not attached):
## [1] magrittr_1.5    formatR_1.2.1   tools_3.2.3     lubridate_1.5.0
## [5] stringi_1.0-1   knitr_1.10.5    stringr_1.0.0   evaluate_0.8
```
