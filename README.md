## horsebetr - The R program for making your KY Derby party awesome

Here's how I use the program.
1. Place your bets into a google sheet using a google form.
2. You should have five fields in the sheet:
  a. timestamp
  b. person betting
  c. horse
  d. amount
  e. type of bet: win, place, or show (I only take show bets at my party for
  simplicity.)
3. Run the following R code:

```r
library(googlesheets)
library(lubridate)
devtools::install_github("rtelmore/horsebetr")
library(horsebetr)
```
