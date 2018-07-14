sns.c <- read.csv("./data/snsbyage.csv", header=T, stringsAsFactors=FALSE)
str( sns.c )

sns.c <- transform(sns.c, age.c = 
                  factor(age, levels=c(1, 2, 3), 
                  labels=c("20대", "30대", "40대")))

sns.c <- transform(sns.c, service.c = 
                  factor(service, levels=c("F", "T", "K", "C", "E"), 
                  ordered=TRUE))

c.tab <- table(sns.c$age.c, sns.c$service.c)
(a.n <- margin.table(c.tab, margin=1))
(s.n <- margin.table(c.tab, margin=2))
(s.p <- s.n / margin.table(c.tab))
(expected <- a.n %*% t(s.p))

(o.e <- c.tab-expected)
(t.t <- sum(  (o.e)^2 / expected ))


qchisq(0.95, df=8)

1-pchisq(t.t, df=8)

chisq.test(c.tab) 
addmargins(chisq.test(c.tab)$expected)