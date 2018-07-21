format(Sys.Date(), '%a')
format(Sys.Date(), '%b')
format(Sys.Date(), '%B')
format(Sys.Date(), '%z')

#### 시각화 ####
#### 3D ####
attach(mtcars)
install.packages("scatterplot3d")
library(scatterplot3d)
s3d <- scatterplot3d(wt,
                     disp,
                     mpg,
                     pch = 16,
                     highlight.3d = TRUE,
                     type = "h")
fit <- lm(mpg ~ wt + disp)
s3d$plane3d(fit)

install.packages("rgl")
library(rgl)
plot3d(wt, disp, mpg, col = "red", size = 5)

library(car)
scatter3d(wt, disp, mpg, surface = FALSE)

#### bubble plot ####
r <- sqrt(disp / pi)
symbols(wt,
        mpg,
        r,
        inches = 0.3,
        fg = "white",
        bg = "lightblue")
text(wt, mpg, rownames(mtcars), cex = 0.6)

#### 상관도(corrgrams) ####
library(corrgram)
corrgram(
  mtcars,
  order = TRUE,
  lower.panel = panel.shade,
  upper.panel = panel.pie,
  text.panel = panel.txt
)

library(ggplot2)

df2 = data.frame(
  supp = rep(c("VC", "OJ"), each = 3),
  dose = rep(c("D0.5", "D1", "D2"), 2),
  len = c(6.8, 15, 33, 4.2, 10, 29.5)
)
install.packages("ggplot2")
library(ggplot2)
p = ggplot(data = df2, aes(x = dose, y = len, fill = supp)) + geom_bar(stat =
                                                                         "identity",
                                                                       color = "black",
                                                                       position = position_dodge()) + theme_minimal() + geom_text(
                                                                         aes(label = len),
                                                                         color = "red",
                                                                         position = position_dodge(0.9),
                                                                         size = 3.5
                                                                       )
p + scale_fill_brewer(palette = "Blues")

