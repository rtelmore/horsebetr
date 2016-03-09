all_payouts <- function(bet_df, results){
  win <- final_payout(bet_df[bet_df$type == 'win', ], results[1])
  place <- final_payout(bet_df[bet_df$type == 'place', ], results[1:2])
  show <- final_payout(bet_df[bet_df$type == 'show', ], results[1:3])
  return(list(win = win, place = place, show = show))
}
