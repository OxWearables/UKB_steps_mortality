# Function factory for rounding to a given number of dp
round_dp <- function(dp) {
  force(dp)
  function(x) {
    format(round(x, digits = dp), nsmall = dp, trim = TRUE, big.mark=",") # big mark is thousands commas
  }
}

# Function for rounding to 2 dp
round_2_dp <- round_dp(2)

# Function for round to 0 dp (mostly used for thousand formatting so given this alternative name as well)
round_0_dp <- round_dp(0)
format_thousand <- round_dp(0)
