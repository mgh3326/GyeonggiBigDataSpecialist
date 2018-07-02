[2018 - 06 - 29 -  금]

-R책 추천
http://r4pda.co.kr/

-wikidocs.net : 무료책(이거보고 혼자 공부 좀 해라)

내pc-속성-고급설정-환경변수에서 추가하기
JAVA_HOME
C:\Program Files\Java\jdk1.8.0_172

PATH
%JAVA_HOME%\bin

javac : (자바 컴파일러)

rstudio - tools - global option - code - saving - utf-8

대소문자 구분
--------------------------------------------------------------------------------
Rstudio

KoNLP: 자바를 요청함


install.packages('KoNLP', dependencies = T) // 한국어 자연어 패키지 설치

KoNLP::extractNoun

SimplePos22(" ") //간단한 품사찾기

.에 따라 정수형, 실수형 나뉨(1, 1.5, 1.)
r은 자료형 안씀

TRUE = T
FALSE = F
NA 결측치(상수, 스칼라)

=, <-, ->  : 지역변수?연산자?
<<-, ->>, %>%
꺽새 방향으로 향한다

rep(x, ...)
rep.int(x, times)
rep_len(x, length.out)

---------------------------------------------------------------------------------
install.packages('KoNLP', dependencies = T)
KoNLP::extractNoun("아버지가 방에 들어가신다")

library(KoNLP)
extractNoun("아버지가 방에 들어가신다")
SimplePos22("아버지가 방에 들어가신다")

#점에 따라서 정수형인지 실수형인지 달라짐
1
1.
1.5
"문자열 입력"
TRUE
T
FALSE
F
NA
# =, <-, ->, <<-, ->>, %>%
X1 = 1
X2 = "abc"

#vector 여러개의 값을 가지고 있다
x3=1:5 # :는 범위
x3
print(x3) #x3 화면에 보여줘라
x3[3]#3번째에 잇는값 호출 []는 인덱스
x3[-3]#-를 붙이면 이걸 제외한다는 뜻
(x4=c(1, 5, 9, 2, 6)) #내가 원하는것 마구잡이로, 단 한종류의 데이터타입을 넣어줘야함
#전체를 괄호에 넣는건 print랑 같은뜻
#[]는 인덱스
x4[-c(2, 5)]
#vector를 만드는 함수드
rep(3, 5) #repeat 3을 5번 찍어라
?rep #? help
?sample
rep(1:3, 5)
rep(1:3, each=5, length.out=10) #each 각각, length.out 내가 원하는 길이만큼 제한
rep(c(1, 4, 2), c(3, 2, 5)) #c는 셋트...?

seq(1, 45, 5) #sequence(시작, 끝, 간격) : 1부터 45까지 5간격

#sample(범위, 추출수) 무작위 //replace 복원추출하면 원래보다 더 큰수를 추출가능(t=o, f=x)
sample(x4, 10, replace = T)
sample(x4, 10, relace=T, prob=c(1, 5, 1, 7, 1))  #prob =가중치 : x4의 1 5 9 2 6중에 5는 가중치5, 2는 가중치 7 준다.




#iris : 행, 열이 있는 구조(데이터프레임), 대괄호 이요 /변수가 미리 만들어져 있어야  가능
str(iris)
View(iris)
edit(iris)
length(x4) #데이터 길이
length(iris)#열 개수
nrow(iris)#행 개수
ncol(iris)#열 개수
names(x4)
names(iris)#vector
names(iris)[2]
rownames()
paste('x', 1:length(x4), sep='') #연결해서 하나로
names(x4)=paste('x', 1:length(x4), sep='')
names(x4)
x4['x3']
iris[2:5, 2]
iris[, 'Sepal.Length']#, 모든행
iris$Sepal.Length
iris[2]

#행 :  벡터// 열 :

mode(iris[2])

mean(iris[1:4])

as.array() #인지 아닌지 확인하는 함수
class(iris[2])

x5<-iris[, 1:4]
x5<-as.matrix(x5)
mode(x5)
class(x5)
mean(x5)

ind1=sample(1:nrow(iris), nrow(iris)*0.7, replace = F)

train=iris[ind1,]
test=iris[-ind1,]

nrow(train)
nrow(test)


is #형바꾸는 함수

#matrix 2차우
x7=matrix(nrow=10 , ncol=5)
x7
x8=matrix(1:45, nrow=5)#이미지....뭐할때 쓰임짐, 숫자 다 들어갈때까지 열이 만들어짐
x8
x8=matrix(1:45, nrow=5, byrow=T)#byrow 행기준
x8

dim(x8) #dimesion
dim(x8)[1]
x9=array(1:60, dim=c(4, 5, 3))#3차원데이터원(행,열,면)
x9[, , 1]
read
write#내보낼때?
load #데이터셋 읽어올때




install.packages('readbitmap')#jpg, png설치
library(jpeg)
img1=readJPEG('img1.jpg')
class(img1)
dim(img1)

1:5 +3

img2=img1
img2[, , 1]=img2[, , 1]*0.7 #색 농도낮추기
img3=img2[100:300, 100:400,]#자르기

writeJPEG(img3, 'img3.jpg')

img4=matrix(img1, nrow=1, byrow=T)
dim(img4)




data1=data.frame(a=1:3, b=c(1.5, 2.2, 3.4), c=letters[1:3]) #letters 문자

colnames(data1)[2]="xx"
data1[2, 'a']
data1$a #객체타입 $를 써서 검색할 수 있음

c(x4, 4, 5)
y1=matrix(1:15, nrow=3)
y2=matrix(31:45, nrow=3)

rbind(y1, y2)#행 합치기, 위아래로, 열의 수 동일해야함(항을 더하는 것 아님, 이어붙이기)
cbind(y1, y2)#열 합치기, 좌우로, 행의 수 동일해야함

y3=list(a=1, b=1:3, c=y1, d=data1) #list 각기 다른 구조를 가질 수 있다
y3[[3]][2, 3] #list 값 가지고 오기 대괄호2번, 뒤에 원하는 행과 열
y3[[2]][2]
y4=list(a=y3, b=y3)
str(y4) #데이터구조, 변수개수, 변수명 등 미리보기
y4[[1]][[3]]#list안에 list이므로 대괄호 2번 사용
y4[[1]][[3]][2, 3]
y4$a$c #list안의 list, 위의 것과 같은 얘기, 이게 쓰기 더 편함



txt1=readLines('txt1.txt', encoding = 'UTF-8') #vetor의 원소로 배당
class(txt1) #데이터 객체 구성요소의 속성
str(txt1)
nchar(txt1)

x5=c(7, 6, 3, 5)
x5>=6 #결과로 true, false

x5[x5>=6]#결과로 값

txt2=txt1[nchar(txt1)>0]
length(txt1)
length(txt2)

library(KoNLP)
txt3=extractNoun(txt2)
class(txt3)
txt3

txt4=unlist(txt3)

txt4=table(unlist(txt3)) #단어들빈도
txt4


install.packages("wordcloud2")
library(wordcloud2)
txt5=as.data.frame(txt4)

wordcloud2(txt5)
