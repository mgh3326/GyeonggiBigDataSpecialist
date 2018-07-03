install.packages('KoNLP', dependencies = T)
KoNLP::extractNoun("아버지가 방에 들어가신다")
library(KoNLP)
extractNoun("아버지가 방에 들어가신다")
SimplePos09("아버지가 방에 들어가신다")


1
1.
1.5
"문자열 입력"
TRUE
T
FALSE
F
NA # 길이는 있으나 데이터가 없는 형태 sql에서의 null 값을 의미한다고 봐도 된다.
NULL # 길이도 없고 데이터가 없는 형태
NaN # 수치 연산이 일어났을때 표현 못하는거 ex ) 0/0
Inf - Inf# 양의 무한대와 음의 무한
# =, <-, ->, <<-, ->>, %>%
x1 = 1
x2 = "abc"
# Vector
x3 = 1:5
x3
print(x3)
x3[-3]
x3[c(2, 4)]
x3[c(T, F, T, F, T)]
x3[x3 > 3]
(x4 = c(1, 5, 9, 2, 6))
x4[-c(2, 5)]
c(1, "Go", 9, 2, 6)

rep(3, 5) # repeat
? rep
# 헬프 나오네 개죻다
rep(1:3, each = 5, length.out = 10)
rep(c(1, 4, 2), c(3, 2, 5))
seq(1, 45, 5)
sample(x4, 4)
sample(x4, 10, replace = T)
sample(x4, 10, replace = T)

sample(x4, 10, replace = T, prob = c(1, 5, 1, 7, 1))

str(iris)
View(iris)
edit(iris)
length(x4)
length(iris)
nrow(iris)
ncol(iris)
paste('x', 1:length(x4), sep = '')
names(x4) = paste('x', 1:length(x4), sep = '')
names(x4)
x4['x3']
names(iris)[2]
rownames()
iris[2:5, 2]
iris[, 'Sepal.Length']
iris$Sepal.Length
mode(iris[2])
mean(iris[, 1:4])
iris[, 1:4]
x5 <- iris[, 1:4]
mode(x5)
class(x5)
x5 <- as.matrix(x5)
mode(x5)
class(x5)
mean(x5)

ind1 = sample(1:nrow(iris), nrow(iris) * 0.7, replace = F)
train = iris[ind1, ]
test = iris[-ind1, ]

nrow(train)
nrow(test)

x7 = matrix(nrow = 10, ncol = 5)
x7
x8 = matrix(1:45, nrow = 5, byrow = T)

x8

dim(x8)[1]
dim(iris)
iris01 <- iris
colnames(iris01) <- c("1", "2", "3", "4", "5")
iris01
x9 = array(1:60, dim = c(4, 5, 3))
x9[, , 1]


read
write

install.packages('readbitmap')
library(jpeg)
img1 = readJPEG('img1.jpg')
class(img1)
dim(img1)
1:5 + 3
img2 = img1
img2[, , 1] = img2[, , 1] * 0.7
img3 = img2[100:300, 100:400, ]

writeJPEG(img3, 'img3.jpg')

img4 = matrix(img1, nrow = 1, byrow = T)
dim(img4)

data1 = data.frame(a = 1:3,
                   b = c(1.5, 2.2, 3.4),
                   c = letters[1:3])
data1
colnames(data1)[2] = "xx"
data1[2 , 'a']
data1$a
c(x4, 4, 5)
y1 = matrix(1:15, nrow = 3)
y2 = matrix(31:45, nrow = 3)

rbind(y1, y2)
cbind(y1, y2)

y3 = list(a = 1,
          b = 1:3,
          c = y1,
          d = data1)
y3$d
y3[2][[1]]
y3[[3]][2, 3]
y3[[2]][2]

y4 = list(a = y3, b = y3)
y4
str(y4)
y4[[1]][[3]][2, 3]
y4$a$c

txt1 = readLines("txt1.txt", encoding = 'UTF-8')
class(txt1)
str(txt1)
nchar(txt1)
txt1
x5 = c(7, 6, 3, 5)

x5 >= 6

x5[x5 >= 6]
txt2 = txt1[nchar(txt1) > 0]
length(txt1)
length(txt2)

library(KoNLP)
txt3 = extractNoun(txt2)
class(txt3)
txt3

txt4 = unlist(txt3)

txt4 = table(unlist(txt3)) #단어들빈도
txt4


install.packages("wordcloud2")
library(wordcloud2)
txt5 = as.data.frame(txt4)

wordcloud2(txt5)
