data <- read.csv("./data/ch02.csv", header=F, na.strings=c("."))
str(data)

data$V1 <- factor(data$V1, levels=c(1, 2), labels=c("남자", "여자"))

data$V3 <- factor(
  data$V3, 
  levels=1:14, 
  labels=c("가구주",  "가구주의 배우자",  "자녀",  "자녀의 배우자",  "가구주의 부모",  "배우자의 부모",  "손자녀, 그 배우자",  "증손자녀, 그 배우자",  "조부모",  "형제자매, 그 배우자",  "형제자매의 자녀, 그 배우자",  "부모의 형제자매, 그 배우자",  "기타 친인척",  "그외같이사는사람")
)

data$V4 <- factor(
  data$V4,
  levels=1:8,
  labels=c("안 받았음", "초등학교", "중학교", "고등학교", "대학-4년제 미만", "대학-4년제 이상", "석사과정", "박사과정")
)
str( data )
save.image("data.rda")
