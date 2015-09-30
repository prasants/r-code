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
