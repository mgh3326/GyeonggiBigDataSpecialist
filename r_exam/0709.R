for(i in (2:100))
{
  if (i %% 2 == 0) {
    print(i)
  }
}

y <- matrix(c(2,-1, -1, 5,-1, 4, 5, 0, 3), nrow = 3)
solve(y)

data.frame(
  id = c("id1", "id2", "id3", "id4"),
  이름                      = c("유관순", "이순신", "강감찬", "안창호"),
  학번                      = c(0761004, 0761008, 0761020, 0761034)
)
c(46, 35, 52, 38, 39, 51, 49, 47, 45, 50, 48, 52)
TRUE + 1
FALSE + 1

x <- c(1, 4, 6, 8, 9)

y <- replace(x, c(2, 4), c(32, 24))

w <- append(x, y)
z <- append(x, y, after = 2)

x <- runif(5)
(0.4 <= x) & (x <= 0.7)
any(x > 0.9)
all(x < 0.9)
is.vector(x)
vec1 <- c(1, 2, 3)
vec2 <- c(4, 5, 6)
vec3 <- c(7, 8, 9)
mat1 <- rbind(vec1, vec2, vec3)
mat2 <- cbind(vec1, vec2, vec3)

? apply
mtcars
str(mtcars)

manager <- c(1, 2, 3, 4, 5)
date <- c("10/24/08", "10/28/08", "10/1/08", "10/12/08", "5/1/09")
country <- c("US", "US", "UK", "UK", "UK")
gender <- c("M", "F", "F", "M", "F")
age <- c(32, 45, 25, 39, 99)
q1 <- c(5, 3, 3, 3, 2)
q2 <- c(4, 5, 5, 3, 2)
q3 <- c(5, 2, 5, 4, 1)
q4 <- c(5, 5, 5, NA, 2)
q5 <- c(5, 5, 2, NA, 1)
leadership <-
  data.frame(manager,
             date,
             country,
             gender,
             age,
             q1,
             q2,
             q3,
             q4,
             q5,
             stringsAsFactors = FALSE)
leadership$age[leadership$age == 99] <- NA

leadership

Sys.Date()
