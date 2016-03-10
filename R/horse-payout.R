#' Determine the payouts for all bets
#'
#' This function returns the bettor, horse, total amount paid out
#'
#' @param bet_df bet_df A tbl_df object with name, horse, amount, and type of bet
#' @param results A vector with win, place, show results
#' @return A tbl_df object with name, horse, amount, and type of bet
#' @examples
#' horse_payout(bet_df = total_bets,
#'              results = c("Barbaro", "Secretariat", "Mr Ed"))
horse_payout <- function(bet_df, results){
  n_bets <- dim(bet_df)[1]
  mult <- horse_multiplier(bet_df, n_factor = sum(results %in% bet_df$horse))
  win_payouts <- rep(0, n_bets)
  for (i in 1:n_bets) {
    if(bet_df$horse[i] %in% results) {
       bet_multiplier <- filter(mult, horse == bet_df$horse[i]) %>%
        select(multiplier) %>%
        .[["multiplier"]]
      win_payouts[i] <- bet_df$amount[i]*(bet_multiplier + 1)
    }
  }
  bet_df$payouts <- win_payouts
  final_payouts <- filter(bet_df, payouts > 0) %>%
    group_by(bettor, horse)
  return(final_payouts)
}
