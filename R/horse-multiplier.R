#' Determine the odds (multipliers) for the various bets
#'
#' This function returns the horse, total amount bet, and a function of the
#'   odds for the horse winning
#'
#' @param bet_df A tbl_df object with name, horse, amount, and type of bet
#' @return A tbl_df object with horse, total amount bet, and odds multiplier
#' @examples
#' horse_multiplier(bet_df = total_bets, kFactor)
horse_multiplier <- function(bet_df, kFactor){
  horses <- unique(select(bet_df, horse))
  bet <- 1:length(horses)
  ## amount bet per horse
  for (horse in bet){
    bet[horse] <- sum(bet_df$amount[bet_df$horse == horses[horse]])
  }
  mult <- (sum(bet_df$amount)/kFactor - bet)/bet
  return(data.frame(horses = horses, total = bet, multiplier = mult))
}
