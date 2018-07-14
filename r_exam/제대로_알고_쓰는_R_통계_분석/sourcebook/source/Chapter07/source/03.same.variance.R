data <- read.table("./data/chapter7.txt", header=T)
var.test(data$weight ~ data$gender)
qf(0.975, df1=17, df2=25)

t.test(data$weight ~ data$gender, mu=0, alternative="less", var.equal=TRUE)

qt(0.05, df=42)

length( data$weight[data$gender==1] )
mean( data$weight[data$gender==1] )
sd( data$weight[data$gender==1] )

length( data$weight[data$gender==2] )
mean( data$weight[data$gender==2] )
sd( data$weight[data$gender==2] )

t.test(data$weight ~ data$gender, mu=0, alternative="less", var.equal=FALSE)
