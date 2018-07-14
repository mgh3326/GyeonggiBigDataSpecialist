v <- c(1, 4, 5)
for( i in v ) {
  print( i )
}

r.n <- rnorm(10)
sum <- 0
for(i in 1:10) {
  sum <- sum + r.n[i]
}
print(sum)
sum(r.n)

dan <- 2
for( i in 2:9 ) {
  times <- dan * i
  print(paste(dan, "곱하기", i, "=", times))
}

(m <- matrix(1:12, ncol=3))
for(i in 1:nrow(m)) {
  for(j in 1:ncol(m)) {
    cat( i, "행", j, "열 =", m[i,j], "\n")
  }
}