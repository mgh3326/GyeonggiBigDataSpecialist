options(digits=4)
var.p2 <- function(x, na.rm=FALSE) {
  if(na.rm == TRUE){
    x <- x[!is.na(x)]
  }
  n <- length(x)
  m <- mean(x, na.rm=na.rm)
  num <- sum( (x - m)^2, na.rm=na.rm )
  denom <- n
  var <- num / denom
  return( var )
}

radius <- c(234, 234, 234, 233, 233, 233, NA, 231, 232, 231)
var.p2(radius)
var.p2(radius, na.rm=TRUE)