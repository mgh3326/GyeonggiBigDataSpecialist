var1 <- seq(1, 70, by = 2)
var1

a <- 1
a
b <- 2
c <- 3
d <- 3.5
a + b
a + b + c
4 / b
5 * b

install.packages("ggplot2")
library(ggplot2)
x <- c("a", "a", "b", "c")
x
qplot(x)
qplot(data = mpg, x = hwy)
mpg
mpg$hwy


qplot(data = mpg, x = cty)
qplot(data = mpg, x = drv, y = hwy)
qplot(data = mpg,
      x = drv,
      y = hwy,
      geom = "line")
qplot(data = mpg,
      x = drv,
      y = hwy,
      geom = "boxplot")
qplot(
  data = mpg,
  x = drv,
  y = hwy,
  geom = "boxplot",
  colour = drv
)
? qplot

# Q1

subject <- c(80, 60, 70, 50, 90)
#Q2
sum(subject) / length(subject)
mean(subject)
#Q3
average <- sum(subject) / length(subject)
average <- mean(subject)
average

english <- c(90, 80, 60, 70)
math <- c(50, 60, 100, 20)

df_midterm <- data.frame(english, math)
df_midterm
class <- c(1, 1, 2, 2)
df_midterm <- data.frame(english, math, class)
df_midterm
mean(df_midterm$english)
mean(df_midterm$math)
df_midterm <- data.frame(
  english = c(90, 80, 60, 70),
  math = c(50, 60, 100, 20),
  class = c(1, 1, 2, 2)
)
df_midterm
## 여기는 왜 = 을 써야되는거지
#q1
df_q <- data.frame(
  fruit   = c("사과", "딸기", "수박"),
  price   = c(1800, 1500, 3000),
  volume   = c(24, 38, 13)
)
#q2
df_q
mean(df_q$price)

mean(df_q$volume)
install.packages("readxl")
library(readxl)

df_exam <- read_excel("./data/excel_exam.xlsx")
df_exam
str(df_exam)
mean(df_exam$english)
mean(df_exam$science)
df_exam_novar <- read_excel("./data/excel_exam_novar.xlsx")
df_exam_novar
df_exam_novar <-
  read_excel("./data/excel_exam_novar.xlsx", col_name = F)
df_exam_novar
df_exam_sheet <-
  read_excel("./data/excel_exam_sheet.xlsx", sheet = 3)
df_exam_sheet

df_csv_exam <- read.csv("./data/csv_exam.csv")
df_csv_exam
df_csv_exam <- read.csv("./data/csv_exam.csv", stringsAsFactors = F)
df_csv_exam

df_midterm
write.csv(df_midterm, file = "df_midterm.csv")
save(df_midterm, file = "df_midterm.rda")
rm(df_midterm)
df_midterm
load("df_midterm.rda")
df_midterm

exam <- read.csv("./data/csv_exam.csv")
exam
head(exam)
head(exam, 10)
tail(exam)
tail(exam, 10)
View(exam)
dim(exam) # 행, 열 출력
str(exam)
summary(exam)
mpg <- as.data.frame(ggplot2::mpg)
head(mpg)
tail(mpg)
View(mpg)
dim(mpg)
str(mpg)
summary(mpg)

df_raw <- data.frame(var1 = c(1, 2, 1), var2 = c(2, 3, 2))
df_raw
install.packages("dplyr")
library(dplyr)
df_new <- rename(df_raw, v2 = var2) # 여기 오타인가보당
df_new
mpg1 <- as.data.frame(ggplot2::mpg)
mpg1 <- rename(mpg1, city = cty, highway = hwy)
head(mpg1)

df <- data.frame(var1 = c(4, 3, 8), var2 = c(2, 6, 1))
df
df$var_sum <- df$var1 + df$var2
df$var_sum
df
df$var_mean <- (df$var1 + df$var2) / 2
df

mpg$total <- (mpg$cty + mpg$hwy) / 2
mpg$total
head(mpg)
summary(mpg$total)
hist(mpg$total)
mpg$test <- ifelse(mpg$total >= 20, "pass", "fail")
head(mpg, 20)

table(mpg$test)

##분석도전

midwest <- as.data.frame(ggplot2::midwest)
midwest
midwest <- rename(midwest, total = poptotal, asian = popasian)
head(midwest)
total <- midwest$total
asian <- midwest$asian
midwest$ratio <- midwest$asian / midwest$total * 100
hist(midwest$ratio)
mean(midwest$ratio)
head(asian)
mean <- mean(asian)
midwest$group <-
  ifelse(midwest$ratio > mean(midwest$ratio), "large", "small")
midwest$group
table(midwest$group)
qplot(midwest$group)





library(ggplot2)
qplot(mpg$test)

mpg$grade <-
  ifelse(mpg$total >= 30, "A", ifelse(mpg$total >= 20, "B", "C"))
head(mpg, 20)

table(mpg$grade)

qplot(mpg$grade)
mpg$grade2 <-
  ifelse(mpg$total >= 30, "A", ifelse(mpg$total >= 25, "B" , ifelse(mpg$total >=
                                                                      20, "C", "D")))
library(dplyr)
exam <- read.csv("./data/csv_exam.csv")
exam
exam %>% filter(class == 1)
exam %>% filter(class == 2)
exam %>% filter(class != 1)
exam %>% filter(class != 3)
exam %>% filter(math > 50)
exam %>% filter(math < 50)
exam %>% filter(math >= 80)
exam %>% filter(math <= 80)
exam %>% filter(class == 1 & math >= 50)
exam %>% filter(class == 2 & math >= 80)
exam %>% filter(math >= 90 | english >= 90)
exam %>% filter(math < 90 | english < 50)
exam %>% filter(class == 1 | class == 3 | class == 5)
exam %>% filter(class %in% c(1, 3, 5))
class1 <- exam %>% filter(class == 1)
class2 <- exam %>% filter(class == 2)
mean(class1$math)
mean(class2$math)

head(mpg)
q1_1 <- (mpg %>% filter(displ <= 4))
q1_2 <- (mpg %>% filter(displ >= 5))
mean(q1_1$hwy)
mean(q1_2$hwy)

q2_1 <- (mpg %>% filter(manufacturer == "audi"))
q2_2 <- (mpg %>% filter(manufacturer == "toyota"))
mean(q2_1$cty)
mean(q2_2$cty)


q3 <-
  mpg %>% filter(manufacturer %in% c("chevrolet", "ford", "honda"))
mean(q3$hwy)

exam %>% select(english)
exam %>% select(class, math, english)
exam %>% select(-math)
exam %>% select(-math, -english)
exam %>% filter(class == 1) %>% select(english)
exam %>% select(id, math) %>% head
exam %>% select(id, math) %>% head(10)


##
mpg  %>% select(class, cty)
mean((mpg %>% filter(class == "suv") %>% select(cty))$cty)
mean((mpg %>% filter(class == "compact") %>% select(cty))$cty)

exam %>% arrange(math)
exam %>% arrange(desc(math))
exam %>% arrange(class, math)

mpg %>% filter(manufacturer == "audi") %>% arrange(hwy) %>% head(5)

exam %>% mutate(total = math + english + science) %>% head
exam %>% mutate(total = math + english + science,
                mean = (math + english + science) / 3) %>% head
exam %>% mutate(test = ifelse(science >= 60, "pass", "fail")) %>% head

exam %>% mutate(total = math + english + science) %>% arrange(total) %>% head

mpg <- mpg %>% mutate(total = cty + hwy)
mpg %>% head
mpg <- mpg %>% mutate(average = (cty + hwy) / 2)
mpg %>% arrange(desc(average)) %>% head(3)
mpg <- as.data.frame(ggplot2::mpg)
mpg <-
  mpg %>% mutate(total = cty + hwy, average = (cty + hwy) / 2) %>% arrange(desc(average)) %>% head(3)
mpg
exam
exam %>% summarise(mean_math = mean(math))
exam %>% group_by(class) %>% summarise(mean_math = mean(math))
exam %>% group_by(class) %>% summarise(
  mean_math = mean(math),
  sum_math = sum(math),
  median = median(math),
  n = n()
)
mpg <- as.data.frame(ggplot2::mpg)
mpg %>% group_by(manufacturer, drv) %>% summarise(mean_cty = mean(cty)) %>%
  head(10)
mpg %>%
  group_by(manufacturer) %>%
  filter(class == "suv") %>%
  mutate(tot = (cty + hwy) / 2) %>%
  summarise(mean_tot = mean(tot)) %>% arrange(desc(mean_tot)) %>% head(5)

mpg <- as.data.frame(ggplot2::mpg)
mpg1 <- mpg

mpg1 %>% group_by(class) %>% summarise(mean_cty = mean(cty))
mpg1 %>% group_by(class) %>% summarise(mean_cty = mean(cty)) %>% arrange(desc(mean_cty))
mpg1 %>% group_by(manufacturer) %>%
  summarise(mean_hwy = mean(hwy)) %>% arrange(desc(mean_hwy)) %>%
  head(3)
mpg1  %>%
  filter(class == "compact") %>%
  group_by(manufacturer) %>%
  summarise(count = n()) %>% arrange(desc(count))

test1 <- data.frame(id = c(1, 2, 3, 4, 5),
                    midterm = c(60, 80, 70, 90, 85))
test2 <- data.frame(id = c(1, 2, 3, 4, 5),
                    final = c(70, 83, 65, 95, 80))
test1
test2
total <- left_join(test1, test2, by = "id")
total
name <-
  data.frame(
    class = c(1, 2, 3, 4, 5),
    teacher = c("kim", "lee", "park", "choi", "jung")
  )
name
exam_new <- left_join(exam, name, by = "class")
exam_new

group_a <- data.frame(id = c(1, 2, 3, 4, 5),
                      test = c(60, 80, 70, 90, 85))
group_b <- data.frame(id = c(6, 7, 8, 9, 10),
                      test = c(70, 83, 65, 95, 80))
group_all <- bind_rows(group_a, group_b)
group_all

fuel <-
  data.frame(
    fl = c("c", "d", "e", "p", "r"),
    price_fl = c(2.35, 2.38, 2.11, 2.76, 2.22),
    stringsAsFactors = F
  )
fuel
mpg
mpg_new <- left_join(mpg, fuel, by = "fl")
mpg_new %>% select(model, fl, price_fl) %>% head(5)
midwest <- as.data.frame(ggplot2::midwest)
str(midwest)
midwest %>% select(poptotal, popadults) %>% head
midwest %>% head
(midwest$poptotal - midwest$popadults) / midwest$poptotal
midwest1 <- midwest

midwest1 <-
  midwest1 %>% mutate(under_aged_population = (midwest$poptotal - midwest$popadults) /
                        midwest$poptotal * 100)
midwest1 %>% arrange(desc(under_aged_population)) %>% head(5) %>% select(county, under_aged_population)
midwest1$classification <-
  ifelse(
    midwest1$under_aged_population >= 40,
    "large",
    ifelse(midwest1$under_aged_population >= 30,
           "middle", "small")
  )
midwest1   %>%
  group_by(classification) %>%
  summarise(count = n()) %>% arrange(desc(count))
table(midwest1$classification)
midwest1$popasian

midwest1 <-
  midwest1 %>% mutate(popasian_percent = midwest$popasian /
                        midwest$poptotal * 100)
midwest1$popasian_percent

midwest1 %>% select(popasian, poptotal, popasian_percent)
str(midwest1)
midwest1 %>% arrange(popasian_percent) %>% select(state, county, popasian_percent) %>%
  head(10)


df <- data.frame(sex = c("M", "F", NA, "M", "F"),
                 score = c(5, 4, 3, 4, NA))
df

is.na(df)
table(is.na(df))
table(is.na(df$sex))
table(is.na(df$score))
remove.packages("dplyr")
install.packages("dplyr")
library(dplyr)
stats::filter
filter(1:10, rep(1, 3))
dplyr::filter
? filter
df %>% filter(is.na(score))
df %>% filter(!is.na(score))

df_nomiss <- df %>% filter(!is.na(score))
mean(df_nomiss$score)
sum(df_nomiss$score)
df_nomiss <- df %>% filter(!is.na(score) & !is.na(sex))
df_nomiss
df_nomiss2 <- na.omit(df)
df_nomiss2
mean(df$score, na.rm = T)
sum(df$score, na.rm = T)

exam <- read.csv("./data/csv_exam.csv")

exam[c(3, 8, 15), "math"] <- NA
exam
exam %>% summarise(mean_math = mean(math))

exam %>% summarise(mean_math = mean(math, na.rm = T))
exam %>% summarise(
  mean_math = mean(math, na.rm = T),
  sum_math = sum(math, na.rm = T),
  median_math = median(math, na.rm = T)
)

mean(exam$math, na.rm = T)

exam$math <- ifelse(is.na(exam$math), 55, exam$math)
table(is.na(exam$math))

exam
mean(exam$math)

mpg <- as.data.frame(ggplot2::mpg)
mpg[c(65, 124, 131, 153, 212), "hwy"] <- NA
table(mpg)
table(is.na(mpg))
table(mpg$drv)
table(is.na(mpg$drv))
table(mpg$hwy)
table(is.na(mpg$hwy))

mpg %>% filter(!is.na(hwy)) %>% group_by(drv) %>% summarise(mean_hwy =
                                                              mean(hwy))
outlier <-
  data.frame(sex = c(1, 2, 1, 3, 2, 1), score = c(5, 4, 3, 4, 2, 6))
outlier

table(outlier$sex)
table(outlier$score)

outlier$sex <- ifelse(outlier$sex == 3, NA, outlier$sex)
outlier
outlier$score <- ifelse(outlier$score > 5, NA, outlier$score)
outlier

outlier %>% filter(!is.na(sex) &
                     !is.na(score)) %>% group_by(sex) %>% summarise(mean_score = mean(score))
boxplot(mpg$hwy)
boxplot(mpg$hwy)$stats
