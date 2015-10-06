#More R Practice Code####
setwd("~/Documents/r-code")
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
library(scales) #For better axis formatting

# The foundation of the plot
g <- ggplot(econ2000, aes(x=month, y=pop))
# add lines colour coded and grouped by year
g <- g + geom_line(aes(color=factor(year), group=year))
# Name the legend "Year"
g <- g+ scale_color_discrete(name="Year")
# Format the y-axis
g <- g + scale_y_continuous(labels=comma)
g <- g + labs(title="Population Growth", x="Month", y="Population")
# Plot the graph
g
g + theme_few()

# Themes - Exploring a few theme packs

g2 <- ggplot(diamonds, aes(x=carat, y=price)) + geom_point(aes(color=color))
g2
# Applying themes
g2 + theme_economist() + scale_colour_economist()
g2 + theme_excel() + scale_colour_excel()
g2 + theme_tufte()
g2 + theme_wsj()
g2 + theme_few()

# Writing R Functions ####
## A hello world function

say.hello <- function ()
{ 
  print("Hello World!")
}
say.hello()

## Function Arguments

# One Substitution
sprintf("Hello %s", "Prasant")

# Two substitutions
sprintf("Hello %s! Today is %s.", "Prasant", "Friday")

# Using sprintf to build a string to print based on function's argument
hello.person <- function(name)
{
  print(sprintf("Hello %s!", name))
}
hello.person("Prasant")
hello.person("Chuck")
hello.person("Bruce")

hello.person <- function(first, last)
{
  print(sprintf("Hello %s %s!", first, last))
}
hello.person("Prasant", "Sudhakaran")
hello.person("Prasant", last="Sudhakaran")
hello.person(last="Sudhakaran", first="Prasant")

## Extra Arguments
# The (...) dot-dot-dot argument allows functions to take an arbitrary number of arguments
# that do not need to be specified in the function definition

# Call hello.person with an extra argument
hello.person("Prasant", extra="Goodbye") #Will give an error
# Call hello.person with 2 valid arguments and an extra argument
hello.person("Prasant", "Sudhakaran", extra="Goodbye")

# Build hello.person with the (...) so that it absorbs extra arguments
hello.person <- function (first, last = "Doe", ...)
{ 
  print(sprintf("Hello %s %s", first, last))
}
# Call again with two valid arguments and a third
hello.person("Prasant", "Sudhakaran", "Goodbye")
hello.person("Prasant")
hello.person("Prasant",extra="Goodbye")

## Return Values
# A mechanism to supply a value to the calling function

# first build a function without an explicit return
double.num <- function(x)
{
  x*2
}
double.num(5)

# Build with explicity return function
double.num <- function(x)
{
  return(x*2)
}
double.num(5)

# Build again, with another argument after explicit return
double.num <- function(x)
{
  return(x*2)
  # Any code below this will not be executed as the function has already exited
  print("Hello World!")
  return(20)
}
double.num(5)

## do.call
# Allowsus to specify the name of a function either as a character
# or as an object, and provide arguments as a list
do.call("hello.person", args = list(first="Prasant", last="Sudhakaran"))
do.call(hello.person, args = list(first = "Prasant", last = "Sudhakaran"))
run.this <- function(x, func=mean)
{
  do.call(func, args=list(x))
}
run.this(1:10)
run.this(1:10, mean)
run.this(1:10, sum)
run.this(1:10, sd)

# Control Statements####
## if and else

# if and else statements are essentially used as a test of conditions. 
# The set of tests below do not need an if/else though
as.numeric(TRUE)
as.numeric(FALSE)
1==1
1<1

#We can use the tests above to initiate an action inside an if/else statement though
toCheck <- 1
if (toCheck == 1)
{ 
  print ("Hello")
}

if (toCheck ==0)
{
  print ("Hello")
} #Nothing will be printed, since toCheck is not 0

#Initiate an action if something is FALSE
check.bool <- function(x)
{
  if (x==1)
  {
    print ("Hello")
  } else
  {
    print ("Goodbye")
  }
}
check.bool(1)
check.bool(0) #Any value that is not 1 will give the output "Goodbye"

#Testing more than 2 cases
check.bool <- function(x)
{
  if (x==1)
  { 
    print ("Hello")
    } else if (x==0)
    {
      print ("Goodbye")
    } else
    { print ("Confused")
      }
}
check.bool(1)
check.bool(0)
check.bool(10)

## switch 
use.switch <- function(x)
{
  switch(x,
         "a" = "first",
         "b" = "second",
         "z" = "last",
         "c" = "third",
         "other")
}
use.switch("a")
use.switch("x")
use.switch("b")
use.switch(1)
use.switch(6)
is.null(use.switch(6))

## ifelse
# ifelse is used very similar to the "if" statement in excel
# First argument is the condition to be tested, second argument is the return value 
# if test is and third argument is return value if test is false

ifelse(1==1, "Yes", "No")
ifelse(1==0, "Yes", "No")
# If testing just a single element, it is more efficient to use the if statement
# This is a good method to use when dealing with vectors

toTest <- c(1,0,1,0,1)
ifelse(toTest ==1, "Yes", "No")
# Referencing the testing element itself
ifelse(toTest==1, toTest*3, toTest)
ifelse(toTest==1, toTest*3, "Zero")
toTest[2] <- NA
ifelse(toTest==1, "Yes", "No")

## Compound Tests
# Checking more than relationship at a time
# || and && are used with if -> compares only one element from each side
# | and & are used with ifelse -> compares each element of each side
a <- c(1,1,0,1)
b <- c(2,1,0,1)
# Check each element of a and each element of b
ifelse(a==1 & b==1, "Yes", "No")
# Check only the first element of a and the first element of b, return only one result
ifelse(a == 1 && b ==1, "Yes", "No")

# Loops in R####

## for loops
# Iterates over an index
for (i in 1:10)
{ 
  print (i)
}
# The results are the same as the command below, although cosmetically it looks different
print (1:10)

# Another example
fruit <- c("apple", "banana", "mango")
fruitlen <- rep(NA, length(fruit))
fruitlen
names(fruitlen) <- fruit
fruitlen
for (a in fruit)
{
  fruitlen[a] <- nchar(a)
}
fruitlen

# It is less verbose to perform the same operation using R's built in vectorisation
fruitlength2 <- nchar(fruit)
names(fruitlength2) <- fruit
fruitlenght2

## while loops

x <- 1
while (x <=5)
{
  print(x)
  x <- x+1 #Without this statement, an infinite loop will be created
}

## Control within loops
## Using "next" and "break"

for (i in 1:10)
{
  if (i==3)
  {
    next #The loop skips over 3
  }
  print(i)
}

for (i in 1:10)
{
  if(i==4)
  {
    break # breaks the loop at 4
  }
  print (i)
}

# Group Manipulation ####
## The Apply Family - apply, tapply, lapply, mapply etc

## apply
# apply must be used on a matrix
# Therefore, all elements must be of the same type

theMatrix <- matrix(1:9, nrow=3)
theMatrix
apply(theMatrix, 1, sum) 
# apply(a,b,c) -> 1st argument = The object, 2nd argument = row/column, where 1 = row, 2 = col
# 3rd arg = function to be applied
apply(theMatrix, 2, sum)

# The same result can be acheived by using rowSums or colSums
rowSums(theMatrix)
colSums(theMatrix)

# Set an element of theMatrix to NA and see how missing data is handled
theMatrix[2,1] <- NA # 2nd row, first column
theMatrix

apply(theMatrix, 1, sum)
rowSums(theMatrix)
# Using na.rm = TRUE
rowSums(theMatrix, na.rm=TRUE)

## lapply and sapply
# lapply applies a function to each element of a list, and returns the results as a list
theList <- list(A=matrix(1:9, 3), B=1:5, C=matrix(1:4, 2), D=2)
theList
lapply(theList,sum)

# Since dealing with lists can be awkward at times, sapply can be used
# to deliver the results as a vector instead
sapply(theList,sum)
a1 <- sapply(theList,sum)
a1
a1[1]

## mapply: Applies a function to each element of multiple lists

# Build two lists
firstList <- list(A=matrix(1:16, 4), B=matrix(1:16, 2), C=1:5)
firstList

secondList <- list(A=matrix(1:16, 4), B=matrix(1:16, 8), C=15:1)
secondList

# Test element by element if they are identical
mapply(identical, firstList, secondList)

#Build a function that adds the number of rows (or length) of 
# each corresponding element
simpleFunc <- function(x,y)
{
  NROW(x) + NROW(y) #nrow will work on objects that have dimesnions (eg. arrays, matrices)
  #NROW works with vectors
}
mapply(simpleFunc, firstList, secondList)

# Aggregate####
library(ggplot2)
data(diamonds)
str(diamonds)
attach(diamonds)
head(diamonds)
# Calculate average price of each type of cut
# Aggregate price, by cut (2nd arg), with 'diamonds' as the dataset, and mean is function
# to be applied
aggregate(price ~cut, diamonds, mean)

#Similar as above, with an additonal layer of grouping
aggregate(price~ cut+color, diamonds, mean) 

# To aggregate two variables, use cbind
aggregate(cbind(price, carat) ~ cut, diamonds, mean) 
# Find the mean of both price and cut for each value of cut

# Only one function can be applied in the statement above - in this case it is the mean. 
# To use multiple arguments, we can use a package like plyr

aggregate(cbind(price, carat) ~ cut+color, diamonds, mean)

# plyr package####
## The plyr package has many functions such as ddply, llply, ldply etc

library(plyr)
data()
head(baseball)
str(baseball)
# subsetting the data
baseball$sf[baseball$year <1954] <- 0
any(is.na(baseball$sf))
str(baseball$hbp)
baseball$hbp[is.na(baseball$hbp)] <- 0
any(is.na(baseball$hbp))

# Only keep players with atleast 50 at bats in a season
baseball <- baseball[baseball$ab >= 50,]
# calculate on base percentage

## with function - allows us to specify the columns of a data.frame without having to specify
## the data.frame name each time
baseball$OBP <- with(baseball, (h+bb+hbp)/(ab+bb+hbp+sf))
tail(baseball)
