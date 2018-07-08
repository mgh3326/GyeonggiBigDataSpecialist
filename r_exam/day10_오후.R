df_1 <- data.frame(cus_ids = c("A001",
                              "A002",
                              "A003"),
                   name = c("홍길동",
                            "이순신",
                            "김철수"))

df_2 <- data.frame(cus_id = c("A001",
                              "A002",
                              "A003"),
                   buy = c("책",
                            "A4용지",
                            "지우개"))

merge(df_1, df_2, by.x = "cus_ids", 
      by.y = "cus_id")
## 만약 기준이되는 변수명이 cus_id로 같은 경우##
merge(df_1, df_2, by = "cus_id")



#### 네이버 뉴스속보 크롤링 ######

install.packages("httr")
install.packages("rvest")
library(httr)
library(rvest)

total_article <-c()
url <-"https://news.naver.com/main/list.nhn?mode=LSD&mid=sec&sid1=101&date=20180706&page="
for(j in 1:10){
  base_url <- paste0(url, j)
  print(j)  ## 반복시 페이지 번호 확인
  # http  + r = httr
  # harvest + r = rvest
  http_naver <- GET(base_url)
  html_naver <- read_html(http_naver) 
  
  ## class = ., id = # 
  links_area <- html_nodes(html_naver, "div.list_body a") 
  links_area2 <- unique(html_attr(links_area, "href"))
  links_area3 <- grep("news.naver.com", links_area2, value = T)
  
  for(i in 1:length(links_area3)){
    http_news <- GET(links_area3[i])
    html_news <- read_html(http_news)
    contents_area <- html_nodes(html_news, "div#articleBodyContents")
    article <- html_text(contents_area)
    total_article <- c(article, total_article)
  }
  Sys.sleep(2)  
}

## 정규표현식은 패턴을 찾아주는 것
## 목표: 치환\
set.seed(1234)
test <- total_article[sample(200,3)]

clz_data <- gsub("^.+\\{\\}", " ", total_article)
clz_data <- gsub("[0-9a-zA-Z]",   " ",    clz_data)
clz_data <- gsub("[[:punct:]▶◆∙ⓒ]",   " ", clz_data)
clz_data <- gsub("[[:space:]]+", " ", clz_data)

## 정제 결과 확인
set.seed(5678)
clz_data[sample(200,3)]

## 단어 추출
library(KoNLP)
useNIADic()

## 패키지 저장 경로
.libPaths()

### 단어추출 함수 정의 ###
text <- "사과와 바나나는 맛있다."
extractNoun(text)

SimplePos09(text)

library(stringr)

ko_word <- function(x){
  d <- as.character(x)
  pos <- paste(SimplePos22(d))
  extract <- str_match(pos, "([가-힣]+)/NC")
  keyword <- extract[,2]
  keyword[!is.na(keyword)]
}

## 텍스트 마이닝 #####
install.packages("tm")
library(tm)
getSources()

cps <- VCorpus(VectorSource(clz_data))
dtm <- DocumentTermMatrix(cps, control = list(
  tokenize = ko_word,
  stopwords = c("바로가기", "뉴스", "기자"),
  wordLengths = c(2 , 7)
  ))

dtm.mat<- as.matrix(dtm)
word.freq <- colSums(dtm.mat)
df_word <- data.frame(word = names(word.freq),
                      freq = word.freq)


#### 워드클라우드 그리기 ####
install.packages("wordcloud2")
install.packages("htmlwidgets")
library(wordcloud2)
library(htmlwidgets)

wc2 <- wordcloud2(data = df_word,
           color = "random-dark")
saveWidget(wc2, "tmp.html", selfcontained = F)


dtm2 <- DocumentTermMatrix(cps, control = list(
  tokenize = ko_word,
  stopwords = c("바로가기", "뉴스", "기자"),
  wordLengths = c(2 , 7),
  weighting = weightBin,
  dictionary= c("무단전재", "재배포")
))

dtm.mat2<- as.matrix(dtm2)
word.freq2 <- colSums(dtm.mat2)
word.order2<- order(word.freq2, decreasing = T)[1:50]

word_50th <- dtm.mat2[, word.order2]

occur <- t(word_50th) %*% word_50th
dim(occur)

##### 연관 그래프 그리기 #####
install.packages("qgraph")
library(qgraph)

repair_name <-repair_encoding(colnames(occur))

png('result.png', 
    width = 1500,
    height = 1500)
qgraph(occur,
       layout = "spring",
       color = "skyblue",
       vsize = sqrt(diag(occur))/2,
       labels = repair_name,
       diag = F
       )
dev.off()

#### dictionary 사용해서 dtm 매트릭스 만들기 ####

dtm2 <- DocumentTermMatrix(cps, control = list(
  tokenize = ko_word,
  stopwords = c("바로가기", "뉴스", "기자"),
  wordLengths = c(2 , 7),
  weighting = weightBin,
  dictionary= c("무단전재", "재배포")
))

dtm.mat2<- as.matrix(dtm2)






