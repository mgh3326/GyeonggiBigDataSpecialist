data <- read.table("http://www.amstat.org/publications/jse/datasets/babyboom.dat.txt", header=F)

nrow(data)
ncol(data)

str( data )

head(data)
tail(data)
head(data, n=2)
tail(data, n=3)

names(data)

names(data) <- c("time", "gender", "weight", "minutes")
names(data)
names(data)[1] <- "time.24Hrs"
names(data)

row.names(data)

g1 <- data$gender
str(g1)

g2 <- data[,2]
str(g2)

g3 <- data["gender"]
str(g3)

g4 <- data[[2]]
str(g4)

g5 <- data[["gender"]]
str(g5)



gg1 <- data[, c(2, 4)]
str( gg1 )

gg2 <- data[c("gender", "minutes")]
str( gg2 )



str( data[data$gender==2, ] )
str( subset(data, gender==2) )

male.m <- mean(data$weight)
str( data[data$gender==2 & data$weight > male.m, ] )
str( subset(data, (gender==2) & (weight > male.m) ) )


str( data[data$gender==2 & data$weight > male.m, c(2, 4)] )
str( subset(data, (gender==2) & (weight > male.m), select=c(2, 4)) )

chapter7 <- data[, c(2, 3)]
write.table(chapter7, "./data/chapter7.txt")

write.table(chapter7, "./data/chapter7.txt", row.names=FALSE)
