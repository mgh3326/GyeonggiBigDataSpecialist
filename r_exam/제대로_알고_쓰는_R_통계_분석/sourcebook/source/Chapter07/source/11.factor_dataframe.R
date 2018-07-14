names <- c("고길동", "둘리", "영희")
gender <- c("2", "2", "1")

characters <- data.frame(name=names, gender=gender)
str(characters)

characters <- data.frame(name=names, gender=gender, 
                         stringsAsFactors=FALSE)
str(characters)
characters <- transform(
                characters, 
                f.gender=factor(gender, 
                         levels=c("1", "2"), labels=c("여자", "남자")))
str(characters)
characters


sns <- read.csv("./data/snsbyage.csv", header=T)
str( sns )

sns.c <- read.csv("./data/snsbyage.csv", header=T, stringsAsFactors=FALSE)
str( sns.c )

sns.c <- transform(sns.c, age.c = 
                     factor(age, levels=c(1, 2, 3), 
                            labels=c("20대", "30대", "40대")))

sns.c <- transform(sns.c, service.c = 
                     factor(service, levels=c("F", "T", "K", "C", "E"), 
                            ordered=TRUE))

str(sns.c)
