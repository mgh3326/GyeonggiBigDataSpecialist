names <- c("고길동", "둘리", "영희")
gender <- c("2", "2", "1")


( names <- c(names, "희동이") )
( gender <- c(gender, "남자") )


gender
str(gender)
gender[5] <- "여자"
gender
f.gender <- factor(gender)
f.gender
str(f.gender)
levels(f.gender)
f.gender[6] <- "여"
f.gender



answer <- c(2, 2, 3, 2, 3, 4, 4, 4, 3, 4)
f.answer <- factor(answer)
str( f.answer )

f.answer <- factor(answer, levels=c(1, 2, 3, 4, 5))
str(f.answer)

o.f.answer <- factor(answer, levels=c(1, 2, 3, 4, 5), ordered=TRUE)
str(o.f.answer)
o.f.answer


o.f.answer <- factor(answer, levels=c(1, 2, 3, 4, 5), ordered=TRUE,
                     labels=c("매우 불만족", "불만족", "보통이다", "만족", "매우만족"))
str(o.f.answer)
o.f.answer
                   


