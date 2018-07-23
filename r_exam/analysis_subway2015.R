libs <- c("ggplot2", "ggmap", "jsonlite")
install.packages(libs)
unlist(lapply(libs, library, character.only = TRUE))

######################################################################
# 서울 도시철도공사 제공 2010~2013 지하철역별 승하차정보 데이터
# 탑승객수를 역, 노선, 연도, 월별로 자료 정리
# 탑승객 기준 상위 10개 역을 추출하여 시각화

# subway.csv : 2010.01~2014.07 서울지하철역 및 시간대별 승하차 인원수
# 변수명
#  station    : 역코드
#  stat_name  : 역명
#  income_data : 일자
#  on_tot      : 당일 해당역의 총탑승인원수
#  on_xx       : 당일해당역의 xx시간대의 탑승인원수 (xx는 05부터 24까지)
#  off_tot     : 당일 해당역의 총하차인원수
#  off_xx      : 당일해당역의 xx시간대의 하차인원수 (xx는 05부터 24까지)

# subway_latlong.csv : 지하철역의 위도와 경도 위치정보
# 변수명
#  STATION_CD   : 역코드
#  STATION_MM   : 역명
#  LINE_NUM     : 호선
#  FR_CODE      : 외부코드(외국인의 경우, 역명보다 역번호)
#  CYBER_ST_CODE: 사이버스테이션(환승역의 경우 마스터가 되는 노선의 전철역코드)
#  XPOINT       : X 좌표
#  YPOINT       : Y 좌표
#  XPOINT_WGS   : X 좌표(WGS)
#  YPOINT_WGS   : Y 좌표(WGS)

# 출처 : NIA
######################################################################

subway <- read.csv(
  "./data/subway.csv",
  header = TRUE,
  stringsAsFactors = FALSE,
  fileEncoding = "EUC-KR"
)

str(subway)

# income_date 자료형을 int형에서 character형으로 변환
class(subway[, "income_date"]) <- "character"

# 날짜형식을 YYYY-MM-DD 형식으로 변환
subway[, "income_date"] <-
  as.Date(subway[, "income_date"], format = "%Y%m%d")


# 자료의 연도가 무엇이 있는지 확인
unique(format(subway[, "income_date"], "%Y"))

# 2014년 데이터의 인덱스 저장
idx <- format(subway[, "income_date"], "%Y") == "2014"
idx

# 2014년 데이터들의 월 추출
unique(format(subway[idx, "income_date"], "%m"))

# 2014년 자료를 제외한 자료 subway2 생성
subway2 <-
  subset(subway, subset = format(income_date, "%Y") != "2014")

# 역명 확인 : 158개 (오름차순정렬)
sort(unique(subway[, 'stat_name']))

# 역명 중 (숫자)가 붙여있는 환승역을 찾아 해당하는 데이터의 인덱스(행)를 추출
idx <- grep("\\(" , subway2[, "stat_name"])

# (숫자)가 붙어있는 역명 확인
unique(subway2[idx, "stat_name"])

# 데이터의 "stat_name" 열 저장
stat_name <- subway2[, "stat_name"]

# "("를 가지고 있는 역이름을 ()와 분리 : 리스트로 반환
tmp <-
  sapply(subway2[idx, "stat_name"], strsplit, "\\(", USE.NAMES = FALSE)
# sapply list 형태로 반환됨

# 분리된 역이름 리스트에서 첫번째 이름만 추출
stat_renamed <- sapply(tmp, function(x)
  x[1])

# ()가 있는 역이름을 ()뺀이름으로 변경
subway2[idx, "stat_name"] <- stat_renamed

# 연도 변수 추가
year <- format(subway2[, "income_date"], "%Y")

# 월 변수 추가
month <- format(subway2[, "income_date"], "%m")

# 데이터 프레임에 year, month 변수 추가
subway2 <- cbind(subway2, year, month)

head(subway2)
######################################################################

subname <- read.csv(
  "./data/subway_latlong.csv",
  header = TRUE,
  stringsAsFactors = FALSE,
  skip = 1,
  fileEncoding = "utf-8"
)

library(readxl)
subname <- read_excel("e:/RinA/data/subway_latlong.xlsx")
? read_excel
str(subname)

head(sort(unique(subname[, "STATION_NM"])), 10)

Line <-
  tapply(subname[, "STATION_NM"], subname[, "LINE_NUM"], unique)
sapply(Line, head)


######################################################################

# 각 역마다 특정연도의 탑승객수를 젂체 합산하는 함수 agg_fun()를 정의
agg_fun <- function(vec, dat) {
  sub_Line <- dat[dat[, "stat_name"] %in% vec, ]
  tot <- aggregate(on_tot ~ year + stat_name, sub_Line, sum)
  return(tot)
}

total <- lapply(Line[1:8], FUN = agg_fun, dat = subway2)


# xtabs() 함수는 세로로 긴 데이터프레임 total을 가로에 stat_name,
# 세로에 year의 각 수준으로 나타내는 테이블을 맊들어 해당하는 on_tot값을 출력함

df1 <- lapply(total, xtabs, formula = on_tot ~ stat_name + year)

lapply(df1, head)


cum_total <- lapply(total, xtabs, formula = on_tot ~ stat_name)
cum_total_vec <- unlist(cum_total)
names(cum_total_vec) <-
  unlist(lapply(strsplit(names(cum_total_vec), "\\."),
                function(x)
                  x[2]))
line_num <- factor(rep(1:8, lapply(cum_total, length)),
                   labels = paste0(1:8, "호선"))
df2 <- data.frame(
  stat_name = names(cum_total_vec),
  line_num = line_num,
  on_tot = cum_total_vec,
  stringsAsFactors = FALSE
)
df2$stat_name <- factor(df2$stat_name, levels = df2$stat_name)


# 데이터프레임 df2를 막대그래프로 시각화하고
# 각 역의 색상을 노선별로 다르게하여 노선 및 역별 누적탑승객수를 비교
plt <- ggplot(df2, aes(x = stat_name, y = on_tot, fill = line_num))
plt + theme_bw() + geom_bar(stat = "identity", colour = "white") + scale_x_discrete("지하철역", labels =
                                                                                      NULL) + ylab("탑승객수") + scale_fill_discrete(name = c("노선"))

# 총누적탑승객수를 기준으로 지하철역을 순서화하여 상위 10개역을 추출
idx_top10 <-
  cum_total_vec >= sort(cum_total_vec, decreasing = TRUE)[10]
cum_total_vec[idx_top10]

df3 <- subset(df2, subset = idx_top10)
lim <- c(0, max(df2$on_tot))


# 막대그래프
plt <- ggplot(df3, aes(stat_name, y = on_tot, fill = line_num))
plt + geom_bar(stat = "identity", colour = "white") + xlab("상위 10개 지하철역") + scale_y_continuous("탑승객수", lim =
                                                                                                 lim) + scale_fill_discrete(name = c("노선"))

# 총누적탑승객수 기준 하위 10개역을 추춗하고 이를 막대그래프로 시각화
idx_bot10 <-
  cum_total_vec <= sort(cum_total_vec, decreasing = FALSE)[10]
cum_total_vec[idx_bot10]
df4 <- subset(df2, subset = idx_bot10)
plt <- ggplot(df4, aes(stat_name, y = on_tot, fill = line_num))
plt + geom_bar(stat = "identity", colour = "white") + xlab("하위 10개 지하철역") + scale_y_continuous("탑승객수", lim =lim) + scale_fill_discrete(name = c("노선"))


# 2013년 상위 10개역 월별 탑승객 추이
stat_top10_2013 <-
  subset(
    subway2,
    subset = stat_name %in% names(cum_total_vec[idx_top10]) &
      year == "2013",
    select = c("stat_name", "on_tot", "month")
  )
stat_top10_2013 <-
  aggregate(on_tot ~ month + stat_name, stat_top10_2013, sum)

plt <-
  ggplot(stat_top10_2013,
         aes(
           x = month,
           y = on_tot,
           colour = stat_name,
           group = stat_name
         ))
plt <-
  plt + theme_classic() + geom_line() + geom_point(size = 6,
                                                   shape = 19,
                                                   alpha = 0.5)
plt + scale_x_discrete("2013년", labels = paste0(unique(as.numeric(month)), "월")) + ylab("월별 탑승객수") + scale_colour_discrete(name =
                                                                                                                             c("지하철역"))

# 2013년 하위 10개역 월별 탑승객 추이
stat_bot10_2013 <-
  subset(
    subway2,
    subset = stat_name %in% names(cum_total_vec[idx_bot10]) &
      year == "2013",
    select = c("stat_name", "on_tot", "month")
  )
stat_bot10_2013 <-
  aggregate(on_tot ~ month + stat_name, stat_bot10_2013, sum)
plt <-
  ggplot(stat_bot10_2013,
         aes(
           x = month,
           y = on_tot,
           colour = stat_name,
           group = stat_name
         ))
plt <-
  plt + theme_classic() + geom_line() + geom_point(size = 6,
                                                   shape = 19,
                                                   alpha = 0.5)
plt + scale_x_discrete("2013년", labels = paste0(unique(as.numeric(month)), "월")) + ylab("월별 탑승객수") + scale_colour_discrete(name =
                                                                                                                             c("지하철역"))

# 노선별 역당 평균 탑승객수의 계산 및 비교
subway3 <-
  merge(subway2[, c("stat_name", "income_date", "on_tot", "year", "month")], subname[, c("STATION_NM", "LINE_NUM", "XPOINT_WGS", "YPOINT_WGS")], by.x =
          "stat_name", by.y = "STATION_NM")
tmp1 <-
  aggregate(on_tot ~ LINE_NUM + stat_name, subway3, sum, na.rm = TRUE)
tmp2 <- aggregate(on_tot ~ LINE_NUM, tmp1, mean, na.rm = TRUE)
tmp2

col <-
  c(
    "red",
    "springgreen2",
    "orange",
    "blue",
    "purple",
    "brown",
    "khaki",
    "deeppink",
    "yellow",
    "deepskyblue"
  )
pie(
  tmp2$on_tot,
  labels = paste0(unique(tmp2$LINE_NUM), "호선"),
  col = col,
  border = "lightgray",
  main = "노선별 평균 지하철 탑승객 수"
)
barplot(
  tmp2$on_tot,
  labels = paste0(unique(tmp2$LINE_NUM), "호선"),
  col = col,
  border = "lightgray",
  main = "노선별 평균 탑승객 수"
)

# 노선별 누적 승객수의 상대비교
yearmonth <- paste(subway3$year, subway3$month, "01", sep = "-")
yearmonth <- as.Date(yearmonth) tmp3 <- cbind(subway3, yearmonth)
tmp3$LINE_NUM <- paste0(tmp3$LINE_NUM, "호선")
tmp4 <-
  aggregate(on_tot ~ LINE_NUM + yearmonth, tmp3, sum, na.rm = TRUE)
plt <- ggplot(tmp4, aes(x = yearmonth, y = on_tot, fill = LINE_NUM))
plt <- plt + geom_area(colour = "white", size = 0.2)
plt <- plt + scale_fill_manual(name = "노선", values = col)
plt + theme_classic() + xlab("연") + ylab("누적승객수")

# 구글맵을 활용핚 지도맵핑
library(ggmap)
dat1 <-
  subset(
    subway3,
    income_date == "2012-05-08",
    select = c("XPOINT_WGS", "YPOINT_WGS", "on_tot", "stat_name", "LINE_NUM")
  )
Map_Seoul <-
  get_map(
    location = c(lat = 37.55, lon = 126.97),
    zoom = 11,
    maptype = "roadmap"
  )
# 서울역의 위도 경도


MM <- ggmap(Map_Seoul)
MM2 <-
  MM + geom_point(aes(
    x = YPOINT_WGS,
    y = XPOINT_WGS,
    size = on_tot,
    colour = as.factor(LINE_NUM)
  ),
  data = dat1)
MM2 + scale_size_area(name = c("탑승객수")) + scale_colour_discrete(name = c("노선")) + labs(x =
                                                                                         "경도", y = "위도")

# 2013년도 탑승객수 상위 10개역에 대핚 지도맵핑
#total <- lapply(Line[1:8], FUN=agg_fun, dat=subway2)
lapply(total, xtabs, formula = on_tot ~ stat_name + year)


idx <-
  which(cum_total_vec >= sort(cum_total_vec, decreasing = TRUE)[10])
# 상위 10 개역의 2013 년도 탑승객

stat_top10_2013 <-
  subset(subway2, subset = year == "2013" &
           stat_name %in% names(cum_total_vec[idx]))
dat2 <- aggregate(on_tot ~ stat_name, stat_top10_2013, sum)
dat2 <-
  merge(dat2, subname, by.x = "stat_name", by.y = "STATION_NM")
MM3 <-
  MM + geom_point(aes(x = YPOINT_WGS, y = XPOINT_WGS, size = on_tot),
                  alpha = 0.5,
                  data = dat2)

MM3 + scale_size_area(name = c("탑승객수"), max_size = 15) + geom_text(
  aes(x = YPOINT_WGS, y = XPOINT_WGS, label = stat_name),
  colour = "red",
  vjust = 3,
  size = 3.5,
  fontface = "bold",
  data = dat2
) + labs(x = "경도", y = "위도")
