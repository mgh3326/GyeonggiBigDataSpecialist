# 표준정규분포표
x <- seq(0, 2.99, by=0.01)
y <- pnorm(x)
z.tab <- matrix(y, ncol=10, byrow=T)


x.graph <- seq(-3, 3, by=0.01)
y.graph <- dnorm(x.graph)


#jpeg("./output/01.z.jpg", width=300, height=300, quality=100)
par(mar=c(1, 0, 1, 0))
plot(x.graph, y.graph, type="l", axes=F, ylim=c(-0.02, 0.4), main="", xlab="", ylab="")
lines(c(-3, 3), c(0, 0))
polygon(c(-3, x.graph[x.graph<=1] ,1), c(0, y.graph[x.graph<=1] , 0), col=2)
text(1.3, 0.35, expression(plain(P)(Z<z)), cex=1)
arrows(1.1, 0.33, 0.8, y.graph[381], length=0.1)
text(1, -0.01, expression(z), cex=1)
#dev.off()



# t-분포
alpha <- c(0.25, 0.2, 0.15, 0.1, 0.05, 0.025, 0.01, 0.005)
k <- c(1:30, 40, 50, 100)
t.tab <- matrix( 1:(length(alpha)*length(k)), ncol=length(alpha) )
for(i in 1:length(k)) {
  for(j in 1:length(alpha)) {
    t.tab[i, j] <- qt( 1-alpha[j] , df=k[i])
  }
}
write.csv(t.tab, "./output/t.tab.csv", row.names=F)


x.graph <- seq(-3, 3, by=0.01)
y.graph <- dt(x.graph, df=5)
t.a <- qt(1-0.05, df=5)

#jpeg("./output/02.t.jpg", width=300, height=300, quality=100)
par(mar=c(1, 0, 1, 0))
plot(x.graph, y.graph, type="l", axes=F, ylim=c(-0.02, 0.4), main="", xlab="", ylab="")
lines(c(-3, 3), c(0, 0))
polygon(c(t.a, x.graph[x.graph>t.a],3), c(0, y.graph[x.graph>t.a] , 0), col=2)
text(2.3, 0.15, expression(alpha), cex=1.2)
arrows(2.3, 0.12, 2.3, 0.05, length=0.1)
text(t.a, -0.015, expression(t[alpha](k)), cex=1.2)
#dev.off()



# chi^{2}-분포
alpha <- c(0.99, 0.975, 0.95, 0.9, 0.05, 0.025, 0.01, 0.005)
k <- c(1:30, 40, 50, 100)
t.tab <- matrix( 1:(length(alpha)*length(k)), ncol=length(alpha) )
for(i in 1:length(k)) {
  for(j in 1:length(alpha)) {
    t.tab[i, j] <- qchisq( 1-alpha[j] , df=k[i])
  }
}
write.csv(t.tab, "./output/c2.tab.csv", row.names=F)


x.graph <- seq(0, 15, by=0.01)
y.graph <- dchisq(x.graph, df=5)
chi.a <- qchisq(1-0.05, df=5)

#jpeg("./output/03.chi.jpg", width=300, height=300, quality=100)
par(mar=c(1, 0, 1, 0))
plot(x.graph, y.graph, type="l", axes=F, ylim=c(-0.01, 0.15), main="", xlab="", ylab="")
lines(c(0, 15), c(0, 0))
polygon(c(chi.a, x.graph[x.graph>=round(chi.a, 2)],15), c(0, y.graph[x.graph>=round(chi.a, 2)] , 0), col=2)
text(12.5, 0.06, expression(alpha), cex=1.2)
arrows(12.5, 0.05, 12.5, 0.02, length=0.1)
text(chi.a, -0.01, expression(plain(chi^2)[alpha](k)), cex=1.2)
#dev.off()



# F-분포
alpha <- c(0.1, 0.05, 0.025, 0.01)
k1 <- c(1:9, 10, 20, 30)
k2 <- c(1:30, 50, 100, 300)

f.tab <- array( 1:(length(alpha)*length(k2)*length(k1)), dim=c(length(alpha), length(k2), length(k1)) )
for(i in 1:length(alpha)) {
  for(j in 1:length(k2)) {
    for(k in 1:length(k1)) {
      f.tab[i, j, k] <- qf( 1-alpha[i] , df1=k1[k], df2=k2[j])
    }
  }
}

for(i in 1:length(alpha) ) {
  fname = paste("./output/f.", alpha[i], ".tab.csv", sep="")
  write.csv(f.tab[i,,], fname, row.names=F)
}


x.graph <- seq(0, 5, by=0.01)
y.graph <- df(x.graph, df1=3, df2=5)
f.a <- qf(1-0.1, df1=3, df2=5)

#jpeg("./output/04.f.jpg", width=300, height=300, quality=100)
par(mar=c(1, 0, 1, 0))
plot(x.graph, y.graph, type="l", axes=F, ylim=c(-0.02, max(y.graph)), main="", xlab="", ylab="")
lines(c(0, 5), c(0, 0))
polygon(c(round(f.a, 2), x.graph[x.graph>=round(f.a, 2)],5), c(0, y.graph[x.graph>=round(f.a, 2)] , 0), col=2)
text(4, 0.15, expression(alpha), cex=1.2)
arrows(4, 0.12, 4, 0.04, length=0.1)
text(f.a, -0.015, expression(plain(F)[alpha](k1,k2)), cex=1.2)
#dev.off()
