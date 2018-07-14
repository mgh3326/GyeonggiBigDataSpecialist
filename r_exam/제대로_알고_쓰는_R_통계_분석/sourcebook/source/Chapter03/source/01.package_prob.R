library(prob)
tosscoin(1)
rolldie(1)
urnsamples(1:3, size=2)
urnsamples(1:3, size=2, replace=T)
urnsamples(c( rep("R", 3), rep("B", 2)), size=2)
tosscoin(2, makespace=T)

# figure 3.6
x <- c(0, 1, 2)
px <- c(1/4, 2/4, 1/4)
barplot(px, names=x, xlab="앞면이 나오는 횟수(x)", ylab="확률(P[X=x])")
