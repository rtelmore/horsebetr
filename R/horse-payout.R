#' Determine the payouts for all bets
#'
#' This function returns the bettor, horse, total amount paid out
#'
#' @param bet_df bet_df A tbl_df object with name, horse, amount, and type of bet
#' @param results A vector with win, place, show results
#' @return A tbl_df object with name, horse, amount, and type of bet
#' @examples
#' horse_payout(bet_df = total_bets,
#'              results = c("Barbaro", "Secretariat", "Man-o-War")
horse_payout <- function(bet_df, results){
  n_bets <- dim(bet_df)[1]
  mult <- horse_multiplier(bet_df, n_factor = sum(results %in% bet_df$horse))
  final_payouts <- left_join(bet_df, mult, by = "horse") %>%
    mutate(winner = bet_df$horse %in% results) %>%
    filter(winner == TRUE) %>%
    mutate(payout = amount*(multiplier + 1)) %>%
    group_by(bettor, horse) %>%
    select(bettor, horse, type, amount, payout)
  return(final_payouts)
}
