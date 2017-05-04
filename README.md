## horsebetr - The R program for making your KY Derby party awesome

Here's how I use the program.
1. Place your bets into a google sheet using a google form.
2. You should have five fields in the sheet:
    a. timestamp
    b. person betting
    c. horse
    d. amount
    e. type of bet: win, place, or show (I only take show bets at my party for simplicity.)
3. Run the following R code:

```r
library(googlesheets)
library(lubridate)
devtools::install_github("rtelmore/horsebetr")
library(horsebetr)

## Use a googlesheet
horse_key <- "Your unique key goes here"
bets_ts <- gs_key(horse_key) %>%
  gs_read("bets")
names(bets_ts) <- c("time", "bettor", "horse", "amount", "type")
bets <- select(bets_ts, bettor, horse, amount, type) %>%
  filter(type == "Show")
wps_results <- c("Nyquist (3-1)", "Exaggerator (8-1)", "Gunnevera (15-1)")
payout_results <- all_payouts(bets, wps_results)
```

4. The win, place, and show results are in the `payout_results` object.
