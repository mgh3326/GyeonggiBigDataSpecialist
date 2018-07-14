# 1. 산점도
methods("plot")

rm(list = ls())
library(mlbench)
data("Ozone")

help("Ozone")

# 기본 그래프 
plot(Ozone$V8, Ozone$V9)
# 그래픽 옵션

# 축 이름(xlab, ylab)
plot(Ozone$V8, Ozone$V9, 
     xlab = "Sandburg Temperature", 
     ylab = "El Monte Temperature")

# 그래프 제목(main)
plot(Ozone$V8, Ozone$V9, 
     xlab = "Sandburg Temperature", 
     ylab = "El Monte Temperature", 
     main = "Ozone")

# 점의 종류(pch)
plot(Ozone$V8, Ozone$V9, 
     xlab = "Sandburg Temperature", 
     ylab = "El Monte Temperature", 
     main = "Ozone", # title
     pch = 20)



?pch


# 점의 크기(cex)
plot(Ozone$V8, Ozone$V9, 
     xlab = "Sandburg Temperature", 
     ylab = "El Monte Temperature", 
     main = "Ozone", # title
     cex = .1)

# 색상(col)
plot(Ozone$V8, Ozone$V9, 
     xlab = "Sandburg Temperature", 
     ylab = "El Monte Temperature", 
     main = "Ozone", # title
     col = "#FF0000")

# 좌표축 값의 범위(xlim, ylim)
plot(Ozone$V8, Ozone$V9, 
     xlab = "Sandburg Temperature", 
     ylab = "El Monte Temperature", 
     main = "Ozone" # title
)

max(Ozone$V8)
max(Ozone$V8, na.rm = TRUE)
max(Ozone$V9, na.rm = TRUE)

plot(Ozone$V8, Ozone$V9, 
     xlab = "Sandburg Temperature", 
     ylab = "El Monte Temperature", 
     main = "Ozone", # title
     xlim = c(0, 100), ylim = c(0, 90)
)

# Type
data("cars")
str(cars); head(cars)

plot(cars, type = "l") # lower alphabet L
plot(cars, 
     type = "o", 
     cex = .5) # lower alphabet O

tapply(cars$dist, cars$speed, mean)
plot(tapply(cars$dist, cars$speed, mean), 
     type = "o", 
     cex = .5, 
     xlab = "speed", 
     ylab = "dist")
?par

# 그래프의 배열(mfrow)
