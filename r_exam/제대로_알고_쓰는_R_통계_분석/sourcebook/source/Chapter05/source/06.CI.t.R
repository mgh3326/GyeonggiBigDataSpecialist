ci.t <- function(x, alpha=0.05) {
  n <- length(smp)
  m <- mean(x)
  s <- sd(x)
  t <- qt(1-(alpha/2), df=n-1)
  ll <- m - t * (s / sqrt(n))
  ul <- m + t * (s / sqrt(n))
  ci <- c(1-alpha, ll, m, ul)
  names(ci) <- c("Confidence Level", "Lower limit", "Mean", "Upper limit")
  return( ci )
}

smp <- c(520, 498, 481, 512, 515, 542, 520, 518, 527, 526)
ci.t(smp)
ci.t(smp, 0.1)