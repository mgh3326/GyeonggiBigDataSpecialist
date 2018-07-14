# figure 18~20
n <- 10
x <- 0:n

p <- 0.5
px <- dbinom(x, size=n, prob=p)
barplot(px, names=x, xlab="성공의 횟수(x)",
        ylab="확률(P[X=x])",
        main="B(10, 0.5)")


p <- 0.1
px <- dbinom(x, size=n, prob=p)
barplot(px, names=x, xlab="성공의 횟수(x)",
        ylab="확률(P[X=x])",
        main="B(10, 0.1)")


p <- 0.9
px <- dbinom(x, size=n, prob=p)
barplot(px, names=x, xlab="성공의 횟수(x)",
        ylab="확률(P[X=x])",
        main="B(10, 0.9)")