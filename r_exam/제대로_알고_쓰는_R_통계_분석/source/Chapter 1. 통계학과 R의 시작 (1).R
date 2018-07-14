# 자료 구분
# Quantitative Variable
# 양적 변수는 이산형 자료 자료의 평태에 따라 셀수 있는 값 (Discrete data) / 측정 대상의 변화가 연속적인 연속형 자료(Continuous Data)

# Qualitative Variable
# 분류를 목적으로 할 경우 명목형 자료 (Nominal Data) / 순서로 분류하기 위한 경우는 순위형 자료 (ordinal data)

census <- read.csv("data/2010년_인구주택총조사_예.csv")
str(census)
# 질적변수-명목형 자료: 성별, 배우자와의 관계 (예: 거주지역, 혈액형 등)
# 질적변수-순서형 자료: 학력 (예: 학점, 설문문항 등)
# 양적변수-이산형 자료: 출생아 수 (예: 형제 수, 수강과목 수 등)
# 양적변수-연속형 자료: 연령 (예: 키, 몸무게 등)

# R 기초, 연산자
3+2
3-2
3*2
3/2
3^2
3%%2
3%/%2

# R 기초, logical 연산자
5<5
5<=5
5>5
5>=5
5==5
5!=5
!TRUE
TRUE | FALSE
TRUE & FALSE

# 결합연산자
((3+4) * 2 <= 3) | (3-2) * 4 > 5

# <- 대입연산자 할당 연산자 
x <- 3
x
x <- 5
x
y <- 3
temp <- y
y

y <- x
y

x

x <- temp

x
y

# 변수의 초기화
x2 <- NULL

# 기본자료형
