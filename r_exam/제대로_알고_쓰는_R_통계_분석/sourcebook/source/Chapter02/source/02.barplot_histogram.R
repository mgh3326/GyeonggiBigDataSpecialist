load("data.rda")
tableV5 <- table(data$V5)
tableV5
barplot( tableV5, main="출생아(남자)별 빈도", xlab="출생아수", ylab="빈도")
tableV1.V4 <- table(data$V1, data$V4)
tableV1.V4
barplot( tableV1.V4, col=c("orange", "green"), main="학력에 따른 성별 인원수", xlab="학력", ylab="빈도", legend.text=T)
hist( data$V2,  main="연령별 분포", xlab="연령", ylab="빈도")
hist( data$V2, breaks=c(seq(0, 90, 10)), right=F, main="연령별 분포", xlab="연령", ylab="빈도")