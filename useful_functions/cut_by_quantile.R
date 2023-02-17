# CUT BY QUANTILE-------------------------------------
qtile_cut <-  function(x, probs = seq(0, 1, 0.25), na.rm = TRUE, labels = NULL, dp_label = 0) {
  
  # Set up
  breaks <- quantile(x = x, probs = probs, na.rm = na.rm) # Get breaks
  round_local <- round_dp(dp_label) # Get function for rounding labels to specified number of dp
  
  # Autogenerate labels if needed
  if (is.null(labels)){
    labels <- c(paste0("<", round_local(breaks[2])))
    for (i in 2:(length(breaks)-2)){
      labels <- c(labels, paste0(round_local(breaks[i]), "-",  round_local(breaks[i+1]- 10^(-dp_label))))
    }
    labels <- c(labels, paste0(round_local(breaks[length(breaks)-1]), "+"))
  }
  
  # Perform cut by quantile
  out <- cut(x = x, breaks = breaks, labels = labels, right = FALSE, include.lowest = TRUE)
  return(out)
}