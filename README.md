## horsebetr - The R package for making your KY Derby party more awesome

Here's how I use the program.
1. Have bettors place their bets into a google sheet, *e.g.* using a google form.
2. You should have five fields in the sheet:
    1. timestamp
    2. person betting
    3. horse
    4. amount
    5. type of bet: win, place, or show (I only take show bets at my party for simplicity.)
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

## You have to manually enter the winners after the race.
wps_results <- c("Win Horse", "Place Horse", "Show Horse")
payout_results <- all_payouts(bets, wps_results)
```

4. The win, place, and show results are in the `payout_results` object.
