library1 <-
  c("plyr", "ggplot2", "stringr", "zoo", "corrplot", "RColorBrewer")
unlist(lapply(library1, require, character.only = TRUE))

product <-
  read.csv("./data/product.csv",
           header = T,
           fileEncoding = "euc-kr")
code <-
  read.csv("./data/code.csv",
           header = T,
           fileEncoding = "euc-kr")
colnames(product) <-
  c('date', 'category', 'item', 'region', 'mart', 'price')

category <- subset(code, code$구분코드설명     == "품목코드")
category

colnames(category) <- c('code', 'exp', 'item', 'name')

region <- subset(code, code$구분코드설명   == "지역코드")
region

colnames(region) <- c('code', 'exp', 'region', 'name')

day.pig <- merge(total.pig, region, by = "region", all = T)
head(day.pig, n = 10)
