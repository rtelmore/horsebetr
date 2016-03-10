horse_multiplier <- function(bet_df, kFactor){
  horses <- unique(bet_df$horse)
  bet <- 1:length(horses)
  ## amount bet per horse
  for (horse in bet){
    bet[horse] <- sum(bet_df$amount[bet_df$horse == horses[horse]])
  }
  mult <- (sum(bet_df$amount)/kFactor - bet)/bet
  return(data.frame(horses = horses, total = bet, multiplier = mult))
}
