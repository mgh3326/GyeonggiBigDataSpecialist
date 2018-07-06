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
}

str(total_article)







