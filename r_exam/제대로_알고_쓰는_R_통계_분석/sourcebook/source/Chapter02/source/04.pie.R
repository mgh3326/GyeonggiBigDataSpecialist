load("data.rda")
table.V4 <- table(data$V4)
table.V4
pie( table.V4, main="학력수준별 비중")