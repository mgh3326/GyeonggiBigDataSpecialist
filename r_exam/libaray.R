libcsv <- read.csv(
  "./data/libSrch_utf-8.csv",
  header = TRUE,
  stringsAsFactors = FALSE,
  fileEncoding = "utf-8"
)
#View(libcsv)

str(libcsv)

# "("를 가지고 있는 역이름을 ()와 분리 : 리스트로 반환
tmp <-
  sapply(libcsv[, "주소"], strsplit, "\\ ", USE.NAMES = FALSE)
# sapply list 형태로 반환됨
#View(tmp)

lib_do <- sapply(tmp, function(x)
  x[1])
lib_city <- sapply(tmp, function(x)
  x[2])
lib_remaining <- sapply(tmp, function(x)
  x[c(-1,-2)])
class(lib_do)
class(lib_remaining)
class(lib_remaining[1])
#paste(unlist(lib_remaining[]), collapse=' ')
lib_remaining <- sapply(lib_remaining, paste0, collapse = " ")
libcsv <- cbind(libcsv, lib_do, lib_city)
libcsv <- cbind(libcsv, lib_remaining)
View(libcsv)

write.csv(libcsv,              # 파일에 저장할 데이터 프레임 또는 행렬
          file = "out.csv",        # 데이터를 저장할 파일명
          row.names = TRUE)  # TRUE면 행 이름을 CSV 파일에 포함하여 저장한다.)

libcsv$lib_do[libcsv$lib_do == "경기"] <- "경기도"
libcsv$lib_do[libcsv$lib_do == "서울"] <- "서울특별시"
libcsv$lib_do[libcsv$lib_do == "충북"] <- "충청북도"
libcsv$lib_do
unique(libcsv$lib_do)
libcsv$lib_do[libcsv$lib_do == "경기도"]
libcsv[libcsv$lib_do[libcsv$lib_do == "경기도"]]
#왜 전화번호 밖에 안나오냐
libcsv[libcsv$lib_do == "경기도"]
# library(dplyr)
# var <- libcsv %>% group_by(lib_do)
# View(var)
