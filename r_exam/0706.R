df_1 <-
  data.frame(cus_id = c("A001", "A002", "A003"),
             name = c("홍길동", "이순신", "김철수"))
df_2 <-
  data.frame(cus_id = c("A001", "A002", "A003"),
             buy = c("책", "A4용지", "지우개"))
merge(df_1, df_2, by = "cus_id")


### 네이버 뉴스 속보 크롤링 ###


url

#httr
#revest
install.packages("httr")
install.packages("rvest")
library(httr)
library(rvest)
url <-
  "http://news.naver.com/main/list.nhn?mode=LSD&mid=sec&sid1=100&date=20180706&page="
total_article <- c()
for (j in 1:10)
{
  baseurl = paste0(url, j)
  http_naver <- GET(baseurl)
  html_naver <- read_html(http_naver)
  links_area <- html_nodes(html_naver, "div.list_body a")
  links_area2 <- unique(html_attr(links_area, "href"))
  
  links_area3 <- grep("news.naver.com", links_area2, value = T)
  links_area3
  length(links_area3)
  
  for (i in 1:length(links_area3))
  {
    http_news <- GET(links_area3[i])
    html_news <- read_html(http_news)
    contents_area <-
      html_nodes(html_news, "div#articleBodyContents")
    contents_area
    article <- html_text(contents_area)
    total_article <- c(article, total_article)
  }
  Sys.sleep(2)
}

str(total_article)

#### 네이버 뉴스속보 크롤링 ######

install.packages("httr")
install.packages("rvest")
library(httr)
library(rvest)

total_article <- c()
url <-
  "https://news.naver.com/main/list.nhn?mode=LSD&mid=sec&sid1=101&date=20180706&page="
for (j in 1:10) {
  base_url <- paste0(url, j)
  
  # http  + r = httr
  # harvest + r = rvest
  http_naver <- GET(base_url)
  html_naver <- read_html(http_naver)
  
  ## class = ., id = #
  links_area <- html_nodes(html_naver, "div.list_body a")
  links_area2 <- unique(html_attr(links_area, "href"))
  links_area3 <- grep("news.naver.com", links_area2, value = T)
  
  for (i in 1:length(links_area3)) {
    http_news <- GET(links_area3[i])
    html_news <- read_html(http_news)
    contents_area <-
      html_nodes(html_news, "div#articleBodyContents")
    article <- html_text(contents_area)
    total_article <- c(article, total_article)
  }
  Sys.sleep(2)
  
}

str(total_article)

## 정규표현식은 패턴을 찾아주는 것
## 목표: 치환
set.seed(5678)
test <- total_article[sample(200, 3)]
clz_data <- gsub(pattern = "^.+\\{\\}",
                 replacement = " " ,
                 x = total_article)
clz_data <- gsub("[0-9a-zA-Z]",
                 " " ,
                 clz_data)
clz_data <- gsub("[[:punct:]▶▼ⓒ]",
                 " " ,
                 clz_data)
clz_data <- gsub("[[:space:]]+",
                 " " ,
                 clz_data)
clz_data
install.packages("KoNLP")
library(KoNLP)
useNIADic()
text <- "사과와 바나나는 맛있다"
.libPaths()
extractNoun(text)

library(stringr)
ko_word <- function(x) {
  d <- as.character(x)
}

pos <- paste(SimplePos22(text))
str_match(pos, "([가-힣]+)/NC")

install.packages("tm")
library(tm)
getSources()

cps <- VCorpus(VectorSource(clz_data))
dtm <- DocumentTermMatrix(cps,
                          control = list(
                            tokenzie = ko_word,
                            stopwords = c("바로가기", "뉴스", "기자"),
                            wordLengths = c(2, 7),
                            weights = weightBin
                          ))
dtm.mat <- as.matrix(dtm)
word.freq <- colSums(dtm.mat)
df_word <- data.frame(word = names(word.freq), freq = word.freq)

install.packages("wordcloud2")
install.packages("htmlwidgets")
library(wordcloud2)
library(htmlwidgets)

wc2 <- wordcloud2(data = df_word, color = "random-dark")
saveWidget(wc2, "tmp.html", selfcontained = F)
word.order <- order(word.freq, decreasing = T)[1:50]
dtm2 <- DocumentTermMatrix(cps,
                           control = list(
                             tokenzie = ko_word,
                             stopwords = c("바로가기", "뉴스", "기자"),
                             wordLengths = c(2, 7),
                             weighting = weightBin
                           ))
dtm.mat2 <- as.matrix(dtm2)
word.freq2 <- colSums(dtm.mat2)
word.order2 <- order(word.freq2, decreasing = T)[1:50]

word_50th <- dtm.mat2[, word.order2]
dim(word_50th)
occur <- t(word_50th) %*% word_50th
dim(occur)
View(occur)

install.packages("qgraph")
library(qgraph)
png('result.png', width = 1500, height = 1500)
qgraph(
  occur,
  layout = "spring",
  color = "skyblue",
  vsize = sqrt(diag(occur)),
  labels = colnames(occur),
  diag = F
)
dev.off()


dtm2 <- DocumentTermMatrix(
  cps,
  control = list(
    tokenzie = ko_word,
    stopwords = c("바로가기", "뉴스", "기자"),
    wordLengths = c(2, 7),
    weighting = weightBin,
    dictionary = c("무단전재", "재배포")
  )
)
dtm.mat2 <- as.matrix(dtm2)

fb_ouath = "EAAHnGEpl5kYBAGMPclYHlxiJASQES6ovcf7EZB0KF8Pfp2bWHG5DNVQYX6yiKIuBvomn8r3ZAwIDJdfZAyZBoezZB9M2CIx3Put28EMMqdvaSyemAGBbhY0kyehz7dNXU62F1015WFqRzKOdTGH507GnCVcQgfOBrLNFrbzm19ZClL3pODE7C7WYcVLvqntEWhwf4MR2pAewZDZD"
pac = c("Rfacebook", "base64enc", "ROAuth")
install.packages(pac)

library(Rfacebook)
library(base64enc)
library(ROAuth)

getUsers("FacebookKorea", fb_ouath, private_info = T)
getPage("FacebookKorea", token = fb_ouath)
