str(iris)

m <- lm(Sepal.Length ~ Species, data=iris)
anova(m)

out <- aov(m)
summary(out)
(ph <- TukeyHSD(out))
#jpeg("./output/10.TukeyHSD.jpg", width=600, height=400, quality=100)
par(mar=c(4,4,4,4))
plot(ph)
#dev.off()