#' Returns the betting results from a horse race
#'
#' This function returns the bettor, horse, and total amount to be paid out
#'   to the winners.
#'
#' @param bet_df A tbl_df object with name, horse, amount, and type of bet
#' @return A tbl_df object with bettor, horse, total amount paid out
#' @examples
#' all_payouts(bet_df = all_bets, results)
all_payouts <- function(bet_df, results){
  win <- horse_payout(filter(bet_df, type == "win"), results[1])
  place <- horse_payout(filter(bet_df, type == "place"), results[1:2])
  show <- horse_payout(filter(bet_df, type == "show"), results[1:3])
  return(list(win = win, place = place, show = show))
}
