paste_quartiles <- function(quartiles, dp = 0) {
  quartiles <- round_dp(dp)(quartiles)
  return(paste0(quartiles[2], " (", quartiles[1], "-", quartiles[3], ")"))
}


get_table_numbers <- function(dat_loc, dat){
  # NUMBERS IN GROUP--------------------------------------------
  n <- format(nrow(dat_loc), big.mark = ",") # format command is to format with 1000s comma
  percent <- round_dp(1)(100*nrow(dat_loc) / nrow(dat)) # note round_dp is a function factory, see useful_functions/rounding_functions.R
  
  # QUANTILES IN GROUP--------------------------------------------------------
  steps <- quantile(dat_loc$med_steps, c(0.25, 0.5, 0.75))
  peak_cadence <- quantile(dat_loc$mean_one_minute_cadence, c(0.25, 0.5, 0.75), na.rm = T)
  acc <- quantile(dat_loc$overall_activity, c(0.25, 0.5, 0.75))
  
  # OUTPUT AS ROW OF DATA FRAME--------------------------------------------------------
  table1_numbers <- data.frame("N (Percent)" = paste0(n, " (", percent, ")"),
                               "Daily Steps" = paste_quartiles(steps),
                               "One-Minute Peak Cadence (steps per minute)" = paste_quartiles(peak_cadence),
                               "Overall Acceleration (mg)" = paste_quartiles(acc, 1))
  return(table1_numbers)
}