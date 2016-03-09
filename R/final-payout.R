final_payout <- function(bet_df, results){
  kBets <- length(bet_df$horse)
  mult <- final_multiplier(bet_df, kFactor = sum(results %in% bet_df$horse))
  win_payouts <- rep(0, kBets)
  for (i in 1:kBets) {
    if(bet_df$horse[i] %in% results) {
      multiplier <- mult$mult[mult$horses == bet_df$horse[i]]
      win_payouts[i] <- bet_df$amount[i]*(multiplier + 1)
    }
  }
  bet_df$payouts <- win_payouts
  return(bet_df)
}
