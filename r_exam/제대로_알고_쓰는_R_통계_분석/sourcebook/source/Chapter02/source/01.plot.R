str(cars)
plot(cars$speed, cars$dist, main="속도와 제동거리", xlab="속도(mph)", ylab="제동거리(ft)", pch=1, col="red")

Nile
str(Nile)
plot(Nile, main="Nile강의 연도별 유량 변화", xlab="연도", ylab="유량")
plot(Nile, type="p", main="Nile강의 연도별 유량 변화", xlab="연도", ylab="유량")