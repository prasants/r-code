#Prasant Sudhakaran
#Exercise 4 - Foundations of Statistics Using R

library(psych)
View(attitude)
sapply(attitude[1:7], mean)
sapply(attitude[1:7], median)
sapply(attitude[1:7], mode)
sapply(attitude[1:7], max)
sapply(attitude[1:7], min)
sapply(attitude[1:7], range)
sapply(attitude[1:7], quantile)
sapply(attitude[1:7], IQR)
sapply(attitude[1:7], var)
sapply(attitude[1:7], sd)
cor(attitude[sapply(attitude, is.numeric)])

summary(attitude)
describe(attitude)
