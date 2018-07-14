# 1, 2, 3, 4, 5의 다섯개로 구성된 vector 생성
1:5 	
# 5, 4, 3, 2, 1 의 다섯개로 구성된 vector 생성
5:1 	


# 1, 2, 3의 세 개의 자료로 구성된 vector 생성
c(1, 2, 3) 	

# c() 함수 안에 사용된 c(6, 7, 8)의 원소를 갖는 vector로 4, 5, 6, 7, 8 의 다섯 개의 자료로 구성된 vector 생성
c(4, 5, c(6, 7, 8))  	

# 변수 x는 1, 2, 3의 세 개의 원소를 갖는 vector를 저장합니다.
x <- c(1, 2, 3) 


# 1부터 5까지 2씩 증가하는 vector를 생성합니다.
seq(from=1, to=5, by=2)	

# 위의 예와 동일, from은 첫 번째, to는 두 번째 위치합니다.
seq(1, 5, by=2)	

# 0부터 1까지 0.001씩 증가하며 생성된 자료는 1001개입니다.
seq(0, 1, by=0.001)	

# 0부터 1까지 1000개가 되는 벡터를 생성합니다. 위의 seq()와 비교해 보세요
seq(0, 1, length.out=1000)	



# vector 1, 2, 3을 두 번 반복한 vector를 반환합니다.
# 결과 : 1, 2, 3, 1, 2, 3
rep(c(1, 2, 3), times=2)	

# vector의 개별 원소 1, 2, 3을 두 번씩 반복한 vector를 반환합니다.
# 결과 : 1, 1, 2, 2, 3, 3
rep(c(1, 2, 3), each=2)	



x <- c(5, 4, 3, 2, 1)
# 벡터 x 의 원소의 갯수를 알려고 할 때 length() 함수를 사용합니다.
length(x)

# 벡터 x 의 첫번째 원소를 가져옵니다.
x[1]

# 여러 위치의 원소를 가져오려 할 때 다음과 같이 하면 오류가 발생합니다.
x[1, 2, 3]

# 여러 위치의 원소를 가져오려면 원하는 인덱스로 구성된 벡터를 전달합니다.
x[c(1, 2, 3)]

# 음수를 전달하면 해당 위치의 값을 제외하고 가져옵니다.
x[-c(1, 2, 3)]

# 새로운 벡터 ex를 만듭니다.
ex <- c(1, 3, 7, NA, 12)

# 벡터 ex에서 10보다 작으면 TRUE를 그렇지 않으면 FALSE인 벡터를 구합니다.
ex < 10

# ex 에서 값이 10보다 작은 원소를 추출합니다.
# ex < 10에서 참인 값만 추출합니다. NA는 판별되지 않아 그대로 나옵니다.
# 결측을 나타내는 NA에 대해서는 제 7장 “8장을 위한 준비”를 참고해 주세요
ex[ex < 10]

# ex에서 2로 나누어 나머지가 0인 즉, 짝수를 추출합니다.
ex[ex %%  2 == 0]

# ex에서 값이 NA 인 값을 추출합니다.
ex[is.na(ex)]

# 두 조건을 “&”로 연결하여 ex에서 짝수이며 NA가 아닌 원소를 추출합니다. 
ex[ex %%  2 == 0 & !is.na(ex)]



x <- c(1, 2, 3, 4, 5)
# levels를 통해 자료중 1, 2, 3, 4을 factor의 수준으로 사용합니다.
factor(x, levels=c(1, 2, 3, 4))

# labels를 통해 각 값을 1, 2, 3, 4를 "a", "b", "c", "d"로 변경합니다.
factor(x, levels=c(1, 2, 3, 4), labels=c("a", "b", "c", "d"))

# ordered에 TRUE를 주어 leveles에 나열된 순서대로 순위형 자료로 만듭니다.
factor(x, levels=c(1, 2, 3, 4), ordered=TRUE)



name <- c("철수", "영희", "길동")
age <- c(21, 20, 31)
gender <- factor(c("M", "F", "M"))

# data frame을 구성할 속성은 name, age, gender입니다.
character <- data.frame(name, age, gender)
character

# 생성한 데이터프레임 character에서 name 속성의 값을 가져옵니다.
character$name

# 첫번째 행에 해당하는 값을 가져옵니다. (세 속성 모두 포함)
character[1, ]

# 두번째 열에 해당하는 자료를 가져옵니다.
# 즉, 모든 행의 두번째 열의 값을 가져오는 경우로 character$age와 동일합니다.
character[ , 2]

# 세번째 행의 첫번째 열의 값을 가져 옵니다.
character[3, 1]



# 벡터 (1, 2, 3)으로 2행 4열의 배열을 만듭니다. 
# 지정한 크기의 배열을 채우는데 부족할 경우 벡터가 반복합니다.
arr <- array(1:3, c(2, 4))
arr

# 배열 arr의 1행의 원소를 반환합니다.
arr[1,]

# 배열 arr의 3열의 원소를 반환합니다.
arr[,3]

# 배열의 행과 열에 이름을 지정합니다.
# list(c(), c(), c(), …)의 형태로 
# 첫번째 전달된 벡터가 행의 이름 두번째 전달된 벡터가 열의 이름이 됩니다.
dimnamearr = list(c("1st", "2nd"), c("1st", "2nd", "3rd", "4th"))
arr2 <- array(1:3, c(2, 4), dimnames=dimnamearr)

# 행과 열에 이름을 준 경우 이름을 통해 접근할 수 있습니다.
arr2["1st", ]
arr2[ ,"3rd"]



# 행렬에 배치할 벡터를 생성합니다.
tmp <- 1:12
tmp

# 위에서 만든 벡터를 행의 개수가 3인 행렬에 재배치합니다.
# byrow 전달인자를 지정하지 않을 경우 
# 만들 행렬의 1열부터 벡터 tmp의 값을 채웁니다.
matrix(tmp, nrow=3)

# byrow=TRUE로 전달할 경우 1행부터 자료를 채웁니다.
matrix(tmp, nrow=3, byrow=TRUE)



v1 <- c(1, 2, 3, 4)
v2 <- c(5, 6, 7, 8)
v3 <- c(9, 10, 11, 12)

# v1, v2, v3 를 열로 묶어 4행 3열짜리 행렬을 생성합니다.
cbind(v1, v2, v3)

# v1, v2, v3 를 행으로 묶어 3행 4열짜리 행렬을 생성합니다.
rbind(v1, v2, v3)



title <- "My List"
ages <- c(31, 41, 21)
numbers <- matrix(1:9, nrow=3)
names <- c("Baby", "Gentle", "none")
# 순서대로 title, ages, numbers, names를 원소로 하는 리스트를 생성합니다.
listEx <- list(title,     ages, numbers, names)

# 리스트에 포함된 하위 요소들이 순서대로 저장됩니다. 
# 순서는 대괄호 두개([[) 사이에 숫자로 나타납니다.
listEx

# 해당 리스트의 첫번째 요소를 가져옵니다.
listEx[[1]]

# 리스트를 구성하는 자료구조에 이름을 주어 배치합니다. 순서는 앞선 예제와 똑같지만 실제 사용에 있어 이름을 지정하면 순서보다 이름을 통해 값을 가져오는 것이 일반적입니다. 이 경우 data frame 과 비슷하게 처리할 수 있습니다.
listEx2 <- list(title=title, age=ages, number=numbers, name=names)

# 리스트를 구성하는 자료구조에 이름을 주어 배치합니다. 
# 순서는 앞선 예제와 똑같지만 실제 사용에 있어 이름을 지정하여 처리하는 것이 
# 일반적이며, 이 경우 data frame 과 비슷하게 처리할 수 있습니다.
listEx2 <- list(title=title, age=ages, number=numbers, name=names)
listEx2

# 첫번째 요소의 값을 가져오는 방식을 비교해 봅시다.
listEx2[[1]]

# 이름을 지정한 경우 데이터 프레임처럼 달러표시($)를 이용하여 가져옵니다.
listEx2$title