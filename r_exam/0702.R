install.packages("RMySQL")
library(RMySQL)

con = dbConnect(
  drv = MySQL(),
  dbname = "sakila",
  user = "root",
  password = "1234",
  host = "localhost",
  port = 3306
)
#install.packages("rvest")
#library(rvest)
#repair_encoding(dbListTables(conn = con))
tables = dbListTables(conn = con)
dbListFields(con, tables[1])
## cmd 창에 입력(비밀번호 재설정) ##
#mysql> ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '1234';
#Query OK, 0 rows affected (0.21 sec)
table1 = paste("select * from", tables[1])
dbGetQuery(con, table1)
dbListFields(con, "film")
sakila_film = dbGetQuery(con, "select * from film")

str(sakila_film)
dbDisconnect(con)


install.packages("vcd")
library(vcd)

# png, jpeg, pdf
counts <- table(Arthritis$Improved)
counts

barplot(counts,
        main = "Simple Bar Plot",
        xlab = "Improvement",
        ylab = "Frequency")
barplot(
  counts,
  main = "Horizontal Bar Plot",
  xlab = "Improvement",
  ylab = "Frequency",
  horiz = TRUE
)
png(filename = "simple_bar_plot.png",
    height = 400,
    width = 400)
barplot(counts,
        main = "Simple Bar Plot",
        xlab = "Improvement",
        ylab = "Frequency")
dev.off()

plot(Arthritis$Improved,
     main = "Simple Bar Plot",
     xlab = "Improvement",
     ylab = "Frequency")
methods("plot")

counts1 <- table(Arthritis$Improved, Arthritis$Treatment)
counts1
barplot(
  counts,
  main = "Stack Bar Plot",
  xlab = "Treatment",
  ylab = "Frequency",
  col = c("red", "yellow", "green"),
  legend = rownames(counts1),
  beside = F # 누적형
)
spine(t(counts1))
par(mfrow = c(1, 2))
pie(counts)

install.packages("plotrix")
library(plotrix)
pie3D(counts, labels = rownames(counts))

### 히스토그램 ###

mtcars$mpg

hist(mtcars$mpg, breaks = 12, freq = F)
lines(density(mtcars$mpg), col = "blue", lwd = 2)
install.packages('sm')
library(sm)

mtcars$cyl
mtcars$mpg


cyl.f <- factor(
  mtcars$cyl,
  levels = c(4, 6, 8),
  labels = c("4cylinder",
             "6cylinder",
             "8cylinder")
)
str(cyl.f)
sm.density.compare(mtcars$mpg,
                   mtcars$cyl,
                   xlab = "miles per gallon")

title(main = "MPG.")
colfill <- c(2:(1 + length(levels(cyl.f))))
legend(locator(1), levels(cyl.f), fill = colfill)

boxplot(mtcars$mpg, main = "Box Plot", ylab = "Miles per Gallon")

mtcars$mpg
median(mtcars$mpg)
median(c(1, 2, 3, 4, 5, 6)) # 짝수라면 중간 값이 호출 되게 되어 있다.

stat$out
boxplot(mpg ~ cyl, data = mtcars)

dotchart(mtcars$mpg, labels = rownames(mtcars), cex = .8)

myvars <- c("mpg", "hp", "wt")

summary(mtcars[myvars])
var(mtcars$mpg)
sd(mtcars$mpg)
boxplot(mtcars$mpg)

sd(mtcars$hp)
boxplot(mtcars$hp)
sd(mtcars$disp)
boxplot(mtcars$disp)
hist(mtcars$disp)
