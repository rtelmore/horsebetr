#' Determine the odds (multipliers) for the various bets
#'
#' This function returns the horse, total amount bet, and a function of the
#'   odds for the horse winning
#'
#' @param bet_df A tbl_df object with name, horse, amount, and type of bet
#' @return A tbl_df object with horse, total amount bet, and odds multiplier
#' @examples
#' horse_multiplier(bet_df = total_bets, n_factor = 3)
horse_multiplier <- function(bet_df, n_factor){
  total_bet <- sum(bet_df$amount)
  bet_by_horse <- group_by(bet_df, horse) %>%
    summarize(total = sum(amount)) %>%
    mutate(multiplier = (total_bet/n_factor - total)/total)
  return(bet_by_horse)
}
