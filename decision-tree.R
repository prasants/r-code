#Decision Trees in R
library(party)
str(iris)
#Decision Trees are created using the ctree function
iris_ctree <- ctree(Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width, data = iris)
print(iris_ctree)
plot(iris_ctree)
