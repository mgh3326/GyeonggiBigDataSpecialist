data(UCBAdmissions)
UCBAdmissions
ucba.tab <- apply(UCBAdmissions, c(1, 2), sum)
round(prop.table(ucba.tab, margin=2) * 100, 1)

# 독립성 검정
(a.n <- margin.table(ucba.tab, margin=1))
(g.n <- margin.table(ucba.tab, margin=2))

(a.p <- a.n / margin.table(ucba.tab))
(g.p <- g.n / margin.table(ucba.tab))

(expected <- margin.table(ucba.tab) * (a.p %*% t(g.p)))
addmargins( expected )


## chi-square statistic
o.e <- (ucba.tab - expected)^2 / expected
addmargins(o.e)

chisq.t <- sum(o.e)
chisq.t
qchisq(0.95, df=1)
1-pchisq(112.250, df=1)
1-pchisq(chisq.t, df=1)


chisq.test(ucba.tab)

## continuity correction
o.e2 <- (abs(ucba.tab - expected)-0.5)^2 / expected
sum(o.e2)

chisq.test(ucba.tab, correct=FALSE)
