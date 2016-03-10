all_payouts <- function(bet_df, results){
  win <- horse_payout(filter(bet_df, type == "win"), results[1])
  place <- horse_payout(filter(bet_df, type == "place"), results[1:2])
  show <- horse_payout(filter(bet_df, type == "show"), results[1:3])
  return(list(win = win, place = place, show = show))
}
