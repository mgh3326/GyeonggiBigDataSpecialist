# 그림 7-3
data <- read.table("./data/chapter7.txt", header=T)

par(mar=c(2, 1, 1, 1))
hist(data$weight[data$gender==1], xlim=c(1500, 4500), ylim=c(0, 12), col="orange", border=NA, main="", xlab="", ylab="", axes=F)
hist(data$weight[data$gender==2], density=10, angle=45, add=TRUE, col="green")
axis(1)
abline(v = mean(data$weight[data$gender==1]), lty=3, lwd=1.5, col="orange")
abline(v = mean(data$weight[data$gender==2]), lty=1, lwd=1.5, col="green")
legends = c("여자아이", "남자아이")
legend("topright", legend=legends, fill=c("orange", "green"), density=c(NA, 20))
