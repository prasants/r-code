#More R Practice Code####

#Variables####
x <- 2
x

y=5
y
#Multiple variable assignment
a <- b <- 7
a
b

#Alternate way to assign value - although more time consuming
assign("j", 4)
j

#Removing Variables
j
rm(j)
j #Will now return the error message "object 'j' not found"
 #Data Types####
class(x)
x
is.numeric(x)

#To set an integer, the number has to be appended with the character "L". For example:
i <- 5L
i
class(i)
is.integer(i)
#Although 'i' is an integer, it will also pass the numeric check. 
#However, not all values that pass the numeric check will pass the integer test - QED

is.numeric(i)

#R will promote integers to numeric as and when required. 
#For example, when multiplying an integer by a numeric

class(4L)
class(2.8)
4L*2.8
class(4L*2.8)
#Character Data
#R has two ways to handle character data - 'character' and 'factor'
x <- "data"
x
y <- factor("data")
y

#To find the length of a character
nchar(x)
nchar("hello")
nchar(1)
nchar(42)
nchar(y) #This will give an error since nchar requires 'character', not a 'factor'

#Dates
#Multiple ways to store dates in R, but most common/useful tend to be 'Date' and 'POSIXct'
#Both objects represented as number of days or seconds since January 1, 1970

date1 <- as.Date("2012-06-28")
date1
class(date1)
as.numeric(date1)
date2 <- as.POSIXct("2015-10-30 19:42")
date2
class(date2)
as.numeric(date2)

#Logical
#Way of representing data that can either be TRUE or FALSE
#Numerically, TRUE = 1, FALSE = 0
TRUE*5
FALSE*5

k <- TRUE
class(k)

is.logical(k)
#Logical as a result of comparing two or more values
2==3
2!=3

#Vectors####
#A vector is a collection of elements, all of the same type
#Vectors are important in R, because R is a vectorised language.
#Operations are applied through each element of R, without the need for looping
x <- c(1,2,3,4,5,6,7,8,9,10)
x
#Vector Operations
x*3
x+2
x/4
sqrt(x)

#Shortcut to creating a series of vectors, instead of manually typing out c(1,2,3,4,....,n)
x <- 1:10
x
sqrt(x)
y <- -2:3
y
y^2
x <- 1:10
y <- 11:20
x^y
x*y
x/y
x-y
x+y
length(x)
length(x+y)

#Operating on vectors of unequal length
x + c(1,2)
x + c(1,2,3) #This will give an error since x has 10 elements, which is not a multple of 3    

#Comparison
x <= 5
x<y

#'any' and 'all' functions
x <- 10:1 
y <- -4:5
any(x<y) #Checks to see if any of the values in x is less than those in y
all(x<y) #Checks if all elements of x are less than the elements in y
q <- c( "Hockey", "Football", "Baseball", "Curling", "Rugby", 
        "Lacrosse", "Basketball", "Tennis", "Cricket", "Soccer")
q
nchar(q)
nchar(y)
x[1]
x[1:2]
x[c(1,4)]

#Naming elements of a vector
c(One="a", Two = "b", Three = "c")

#Create a vector
w <- 1:3
#Name the elements
names(w) <- c("a", "b", "c")
w

#Factor Vectors
q
q2 <- c("Hockey", "Lacrosse", "Hockey", "Water Polo", "Hockey", "Lacrosse")
q2
q2Factor <- as.factor(q2)
q2Factor
as.numeric(q2Factor)
#Ordered Factors can be important in some cases, such as education levels, or company heirarachy
factor(x=c("High School", "College", "Masters", "Doctorate"), 
       levels=c("High School", "College", "Masters", "Doctorate"),
       ordered=TRUE)
#Missing Data####
#NA
#NA is just missing data
z<- c(1,2,NA, 8,3,NA,3)
z
is.na(z)
zChar <- c("Hockey", NA, "Lacrosse")
zChar
is.na(zChar)
#NULL
#NULL is the absense of anything
z <- c(1, NULL, 3)
z #z will show the values 1 and 3, with no indication of 'NULL'
is.null(z)
d <- NULL
is.null(d)

#data.frames####
x <- 10:1
y <- -4:5
q <- c( "Hockey", "Football", "Baseball", "Curling", "Rugby", 
        "Lacrosse", "Basketball", "Tennis", "Cricket", "Soccer")
theDF <- data.frame(x,y,q) #Creates a 10X3 Dataframe consisting of 3 vectors
theDF
theDF <- data.frame(First=x, Second =y, Sport = q)
theDF

#Checking attributes of a Dataframe
nrow(theDF)
ncol(theDF)
dim(theDF)

names(theDF)  
names(theDF)[3]
rownames(theDF)
rownames(theDF) <- c("One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten")
theDF
#Set back the row name to original
rownames(theDF) <- NULL
theDF
head(theDF)
head(theDF, n=7)
tail(theDF)
tail(theDF, n=7)
class(theDF)
#Accessing specific columns of a data frame
theDF[3]
#Alternate way
theDF$Sport
#Accessing specific elements by their position
theDF[1,3] #1st row, 3rd column
theDF[2, 2:3] #Row 2, Columns 2 to 3
theDF[c("First", "Sport")]
theDF[,"Sport"]
class(theDF[,"Sport"])
class(theDF["Sport"])
#To ensure a single column data.frame, while using single-square brackets, use "drop=FALSE"
theDF[,"Sport", drop=FALSE]
newFactor <- factor(c("PA", "NY", "NJ", "NY", "TN", "MA", "PA", "NY"))
newFactor
model.matrix(~newFactor -1)

#Matrices####
#Create a 5X2 Matrix
A <- matrix(1:10, nrow=5)
#Create another 5X2 Matrix
B <- matrix(21:30, nrow=5)
#Create another 5X2 Matrix
C <- matrix(21:40, nrow=2)
A
B
C
nrow(A)
nrow(B)
nrow(C)
dim(A)
A+B
A*B
A==B

#Matrix Multiplication
#Before we multiple A and B, we need to transpose B, since no. of columns
#of A (left-hand matrix) should be equal to no. of rows of B (right-hand matrix)
A %*% t(B)

colnames(A)
rownames(A)
colnames(A) <- c("First", "Second")
rownames(A) <- c("1st", "2nd", "3rd", "4th", "5th")
colnames(B) <- c("First", "Second")
rownames(B) <- c("One", "Two", "Three", "Four", "Five")
A
B
colnames(C) <- LETTERS[1:10] 
#"LETTERS" and "letters" are special vectors, Upper-case/Lower-case resp 
rownames(C) <- c("Top", "Bottom")
C

t(A)
A
A %*% C

#Arrays####
#An array is a multi-dimensional vector
#All elements must be of the same type
theArray <- array(1:12, dim=c(2,3,2))
theArray
theArray[1,,] #The first row of each dimension
theArray[1,,1] #First row of the first dimension
theArray[,,1] #The first dimension
#Difference between an Array and a Matrix:
#Matrices are restricted to two dimensions, 
#Arrays can have an arbitray number of dimensions

#Reading Data Into R####
#Reading from CSV
theURL <- "http://www.jaredlander.com/data/Tomato%20First.csv"
tomato <- read.table(file=theURL, header=TRUE, sep = ",")
head(tomato)
#Reading from Databases####

#Statistical Graphics####

library(ggplot2)
library(ggthemes)
data(diamonds)
head(diamonds)
attach(diamonds)
#Base Histogram
hist(carat, main = "Carat Histogram", xlab="Carat")

#Base Scatterplot
plot(price~carat, data=diamonds, xlab = "Carat", ylab="Price")
#The ~ (tilda) separating price and carat indicates that we are viewing price against carat
plot(carat,price) #Simpler way to plot

#Boxplots
boxplot(carat)

#Using ggplot2####
#Histograms and Densities

ggplot(data=diamonds) + geom_histogram(aes(x=carat)) + theme_wsj()
#Density Plot
ggplot(data=diamonds) +geom_density(aes(x=carat), fill="grey50") + theme_wsj()

#ggplot2 Scatterplots
g <- ggplot(diamonds, aes(x=carat, y=price))+geom_point() + theme_wsj()
g
g+geom_point(aes(color=color))
g+geom_point(aes(color=color))+facet_wrap(~color)
g+geom_point(aes(color=color))+facet_grid(cut~clarity)

#ggplot2 Boxplots and Violin Plots
ggplot(diamonds, aes(y=carat, x=1)) + geom_boxplot() +theme_few()
#Since Boxplots are one-dimensional, we can use x=1 for aesthetic reasons

#Multiple Boxplots
ggplot(diamonds, aes(y = carat, x=cut)) + geom_tufteboxplot() #or use geom_boxplot()

#Violin Plot
ggplot(diamonds, aes(x=cut, y=carat)) + geom_violin() + theme_linedraw()

#Combining Aesthetics
ggplot(diamonds, aes(x=cut, y=carat)) +geom_point() + geom_violin() + theme_linedraw()

#Line Graphs
ggplot(data=economics, aes(x=date, y=pop)) + geom_line() + theme_linedraw()

#Using the lubridate package
library(lubridate)
## Create year and month variables
str(economics)
economics$year <- year(economics$date)
#We use label=TRUE to indicate that we want to see the name of the month
#instead of the number
economics$month <- month(economics$date, label=TRUE)

# Subset the data using the 'which' function
econ2000 <- economics[which(economics$year >= 2000), ]
str(econ2000)
