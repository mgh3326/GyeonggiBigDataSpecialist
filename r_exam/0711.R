options(digits = 2)
Students <- c(
  "John Davis",
  "Angela Williams",
  "Bullwinkle Moose",
  "David Jones",
  "Janice Markhammer",
  "Cheryl Cushing",
  "Reuven Ytzrhak",
  "Greg Knox",
  "Joel England",
  "Mary Rayburn"
)
Math <- c(502, 600, 412, 358, 495, 512, 410, 625, 573, 522)
Science <- c(95, 99, 80, 82, 75, 85, 80, 95, 89, 86)
English <- c(25, 22, 18, 15, 20, 28, 15, 30, 27, 18)
roster <- data.frame(Students, Math, Science, English,
                     stringsAsFactors = FALSE)
roster
z <- scale(roster[, 2:4])
? scale
score <- apply(z, 1, mean)
roster <- cbind(roster, score)
roster

y <- quantile(score, c(.8, .6, .4, .2))
y

roster$grade[score >= y[1]] <- "A"
roster$grade[score < y[1] & score >= y[2]] <- "B"
roster$grade[score < y[2] & score >= y[3]] <- "C"
roster$grade[score < y[3] & score >= y[4]] <- "D"
roster$grade[score < y[4]] <- "F"
roster
name <- strsplit((roster$Student), " ")
Lastname <- sapply(name, "[", 2)
Firstname <- sapply(name, "[", 1)
roster <- cbind(Firstname, Lastname, roster[,-1])
roster
roster <- roster[order(Lastname, Firstname), ]
roster
? options
name
attach(iris)
search()
detach(iris)
search()

options(digits = 3)
attach(mtcars)
aggdata <-
  aggregate(mtcars,
            by = list(cyl, gear),
            FUN = mean,
            na.rm = TRUE)
aggregate(mtcars,
          by = list(cyl, gear),
          FUN = mean,
          na.rm = TRUE)
aggdata
aggregate(mtcars,
          by = list(cyl, gear),
          FUN = mean)
? aggregate
list(cyl, gear)


id <- c(1, 1, 2, 2)
Time <- c(1, 2, 1, 2)
X1 <- c(5, 3, 6, 2)
X2 <- c(6, 5, 1, 4)
mydata <- data.frame(id, Time, X1, X2)
mydata
install.packages("reshape2")
library(reshape2)
md <- melt(mydata, id = c("id", "Time"))
md
dc <- dcast(md, Time ~ variable, sum)
dc
dc <- dcast(md, id ~ variable, sum)
dc
dc <- dcast(md, id ~ Time, sum)
dc
dc <- dcast(md, id + Time ~ variable)
dc
dc <- dcast(md, id + variable ~ Time)
dc
dc <- dcast(md, id ~ variable + Time)
dc

? mad
cars
plot(cars)

dev.copy(pdf, "SampleFile.pdf")
dev.off()


op <- par(no.readonly = TRUE)
par(mar = c(0, 2, 3, 2))
lty1 <- c("blank",
          "solid",
          "dashed",
          "dotted",
          "dotdash",
          "longdash",
          "twodash")
lty2 <- c("33", "24", "F2", "2F", "3313", "F252", "FF29")
plot(
  0:6,
  0:6,
  type = "n",
  ylim = c(0, 20),
  xlab = "",
  ylab = "",
  main = "lines"
)
lines(c(1, 3), c(20, 20), lty = 1)
text(4, 20, "1")
lines(c(1, 3), c(19, 19), lty = 2)
text(4, 19, "2")
lines(c(1, 3), c(18, 18), lty = 3)
text(4, 18, "3")
lines(c(1, 3), c(17, 17), lty = 4)
text(4, 17, "4")
lines(c(1, 3), c(16, 16), lty = 5)
text(4, 16, "5")
lines(c(1, 3), c(15, 15), lty = 6)
text(4, 15, "6")

lines(c(1, 3), c(14, 14), lty = lty1[1])
text(4, 14, lty1[1])
lines(c(1, 3), c(13, 13), lty = lty1[2])
text(4, 13, lty1[2])
lines(c(1, 3), c(12, 12), lty = lty1[3])
text(4, 12, lty1[3])
lines(c(1, 3), c(11, 11), lty = lty1[4])
text(4, 11, lty1[4])
lines(c(1, 3), c(10, 10), lty = lty1[5])
text(4, 10, lty1[5])
lines(c(1, 3), c(9, 9), lty = lty1[6])
text(4, 9, lty1[6])
lines(c(1, 3), c(8, 8), lty = lty1[7])
text(4, 8, lty1[7])
lines(c(1, 3), c(7, 7), lty = lty2[1])
text(4, 7, lty2[1])
lines(c(1, 3), c(6, 6), lty = lty2[2])
text(4, 6, lty2[2])
lines(c(1, 3), c(5, 5), lty = lty2[3])
text(4, 5, lty2[3])
lines(c(1, 3), c(4, 4), lty = lty2[4])
text(4, 4, lty2[4])
lines(c(1, 3), c(3, 3), lty = lty2[5])
text(4, 3, lty2[5])
lines(c(1, 3), c(2, 2), lty = lty2[6])
text(4, 2, lty2[6])
lines(c(1, 3), c(1, 1), lty = lty2[7])
text(4, 1, lty2[7])
par(op)

op <- par(no.readonly = TRUE)
par(mar = c(0, 0, 2, 0))
plot(
  1:9,
  type = "n",
  axes = FALSE,
  xlab = "",
  ylab = "",
  main = "arrows"
)
arrows(1,
       9,
       4,
       9,
       angle = 30,
       length = 0.25,
       code = 2)
text(4.5, 9, adj = 0, "angle=30, length=0.25, code=2(default)")
arrows(1, 8, 4, 8, length = 0.5)
text(4.5, 8, adj = 0, "length=0.5")
arrows(1, 7, 4, 7, length = 0.1)
text(4.5, 7, adj = 0, "length=0.1")
arrows(1, 6, 4, 6, angle = 60)
text(4.5, 6, adj = 0, "angle=60")
arrows(1, 5, 4, 5, angle = 90)
text(4.5, 5, adj = 0, "angle=90")
arrows(1, 4, 4, 4, angle = 120)
text(4.5, 4, adj = 0, "angle=120")
arrows(1, 3, 4, 3, code = 0)
text(4.5, 3, adj = 0, "code=0")
arrows(1, 2, 4, 2, code = 1)
text(4.5, 2, adj = 0, "code=1")
arrows(1, 1, 4, 1, code = 3)
text(4.5, 1, adj = 0, "code=3")
par(op)

#일양난수와 정규난수를 각각 12개씩 생성한 후 segments()함수로 그룹화된 꺾은선 그래프 작성
op <- par(no.readonly = TRUE)
par(mar = c(4, 4, 3, 2), mfrow = c(2, 1))
set.seed(3)
x <- runif(12)
set.seed(4)
y <- rnorm(12)
i <- order(x)
x <- x[i]
y <- y[i]
plot(x, y, main = "2 segments by segments function")
s <- seq(length(x) - 1)
segments(x[s], y[s], x[s + 2], y[s + 2], lty = 1:2)
plot(x, y, main = "3 segments by segments function")
s <- seq(length(x) - 2)
segments(x[s], y[s], x[s + 3], y[s + 3], lty = 1:3)
box(which = "outer")
par(op)
install.packages("vcd")
library(vcd)
counts <- table(Arthritis$Improved)
barplot(counts,
        main = "Simple Bar Plot",
        xlab = "Improvement",
        ylab = "Frequency")
barplot(
  counts,
  main = "Simple Bar Plot",
  xlab = "Frequency",
  ylab = "Improvement",
  horiz = TRUE
)

plot(Arthritis$Improved,
     main = "Simple Bar Plot",
     xlab = "Improvement",
     ylab = "Frequency")
plot(
  Arthritis$Improved,
  main = "Simple Bar Plot",
  xlab = "Frequency",
  ylab = "Improvement",
  horiz = TRUE
)
counts <- table(Arthritis$Improved, Arthritis$Treatment)
barplot(
  counts,
  main = "Stacked Bar Plot",
  xlab = "Treatment",
  ylab = "Frequency",
  col = c("red", "yellow", "green"),
  legend = rownames(counts)
)
counts <- table(Arthritis$Improved, Arthritis$Treatment)
barplot(
  counts,
  main = "Grouped Bar Plot",
  xlab = "Treatment",
  ylab = "Frequency",
  col = c("red", "yellow", "green"),
  legend = rownames(counts),
  beside = TRUE
)


states <- data.frame(state.region, state.x77)
means <-
  aggregate(states$Illiteracy,
            by = list(state.region),
            FUN = mean)
means
means <- means[order(means$x), ]
barplot(means$x, names.arg = means$Group.1)
title("Mean Illiteracy Rate")

par(mar = c(5, 8, 4, 2))
par(las = 2) # 축 라벨 스타일
counts <- table(Arthritis$Improved)
barplot(
  counts,
  main = "Treatment Outcome",
  horiz = TRUE,
  cex.names = 0.8,
  names.arg = c("No Improvement", "Some Improvement",
                "Marked Improvement")
)

par(mar = c(5, 8, 4, 2))
par(las = 3) # 축 라벨 스타일
counts <- table(Arthritis$Improved)
barplot(
  counts,
  main = "Treatment Outcome",
  horiz = TRUE,
  cex.names = 0.8,
  names.arg = c("No Improvement", "Some Improvement",
                "Marked Improvement")
)

library(vcd)
attach(Arthritis)
counts <- table(Treatment, Improved)
spine(counts, main = "Spinogram Example")
detach(Arthritis)

slices <- c(10, 12.4, 16, 8)
lbls <- c("US", "UK", "Australia", "Germany", "France")
pie(slices, labels = lbls, main = "Simple Pie Chart")

pct <- round(slices / sum(slices) * 100)
lbls2 <- paste(lbls, " ", pct, "%", sep = "")
pie(slices,
    labels = lbls2,
    col = rainbow(length(lbls2)),
    main = "Pie Chart with Percentages")

mytable <- table(state.region)
lbls3 <- paste(names(mytable), "\n", mytable, sep = "")
pie(mytable, labels = lbls3,
    main = "Pie Chart from a Table\n (with sample sizes)")

install.packages("plotrix")
library(plotrix)
pie3D(slices,
      labels = lbls,
      explode = 0.1,
      main = "3D Pie Chart")
par(mfrow = c(2, 2))
par(mfrow = c(1, 1))
library(plotrix)
slices <- c(10, 12.4, 16, 8)
lbls <- c("US", "UK", "Australia", "Germany", "France")
fan.plot(slices, labels = lbls, main = "Fan Plot")
hist(mtcars$mpg)

hist(
  mtcars$mpg,
  breaks = 12,
  col = "red",
  xlab = "Miles Per Gallon",
  main =  "Colored histogram with 12 bins"
)

hist(
  mtcars$mpg,
  freq = FALSE,
  breaks = 12,
  col = "red",
  xlab = "Miles Per Gallon",
  main = " Histogram, rug plot, density curve "
)
rug(jitter(mtcars$mpg))
lines(density(mtcars$mpg), col = "blue", lwd = 2)

h <- hist(
  x,
  breaks = 12,
  col = "red",
  xlab = "Miles Per Gallon",
  main = "Histogram with normal curve and box"
)
xfit <- seq(min(x), max(x), length = 40)
yfit <- dnorm(xfit, mean = mean(x), sd = sd(x))
yfit <- yfit * diff(h$mids[1:2]) * length(x)
lines(xfit, yfit, col = "blue", lwd = 2)
box()

d <- density(mtcars$mpg)
plot(d)

d <- density(mtcars$mpg)
plot(d, main = "Kernel Density of Miles Per Gallon")
polygon(d, col = "red", border = "blue")
rug(mtcars$mpg, col = "brown")
install.packages("sm")
library(sm)
attach(mtcars)
cyl.f <- factor(
  cyl,
  levels = c(4, 6, 8),
  labels = c("4 cylinder", "6 cylinder", "8 cylinder")
)
sm.density.compare(mpg, cyl, xlab = "Miles Per Gallon")
title(main = "MPG Distribution by Car Cylinders")
colfill <- c(2:(1 + length(levels(cyl.f))))
legend(locator(1), levels(cyl.f), fill = colfill)
detach(mtcars)

boxplot(mtcars$mpg, main = "Box plot", ylab = "Miles per Gallon")

boxplot(
  mpg ~ cyl,
  data = mtcars,
  main = "Car Mileage Data",
  xlab = "Number of Cylinders",
  ylab = "Miles Per Gallon"
)
boxplot(
  mpg ~ cyl,
  data = mtcars,
  notch = TRUE,
  varwidth = TRUE,
  col = "red",
  main = "Car Mileage Data",
  xlab = "Number of Cylinders",
  ylab = "Miles Per Gallon"
)
mtcars$cyl.f <- factor(mtcars$cyl,
                       levels = c(4, 6, 8),
                       labels = c("4", "6", "8"))
mtcars$am.f <- factor(mtcars$am,
                      levels = c(0, 1),
                      labels = c("auto", "standard"))
boxplot(
  mpg ~ am.f * cyl.f,
  data = mtcars,
  varwidth = TRUE,
  col = c("gold", "darkgreen"),
  main = "MPG Distrbution by Auto Type",
  xlab = "Auto Type",
  ylab = "Miles Per Gallon"
)

install.packages("vioplot")
library(vioplot)
x1 <- mtcars$mpg[mtcars$cyl == 4]
x2 <- mtcars$mpg[mtcars$cyl == 6]
x3 <- mtcars$mpg[mtcars$cyl == 8]
vioplot(x1,
        x2,
        x3,
        names = c("4 cyl", "6 cyl", "8 cyl"),
        col = "gold")
title("Violin Plots of Miles Per Gallon")

dotchart(
  mtcars$mpg,
  labels = row.names(mtcars),
  cex = .7,
  main = "Gas Mileage for Car Models",
  xlab = "Miles Per Gallon"
)

x <- mtcars[order(mtcars$mpg), ]
x$cyl <- factor(x$cyl)
x$color[x$cyl == 4] <- "red"
x$color[x$cyl == 6] <- "blue"
x$color[x$cyl == 8] <- "darkgreen"
dotchart(
  x$mpg,
  labels = row.names(mtcars),
  cex = .7,
  groups = x$cyl,
  gcolor = "black",
  color = x$color,
  pch = 19,
  main = "Gas Mileage for Car Models
  \n grouped by cylinder",
  xlab = "Miles Per Gallon"
)

