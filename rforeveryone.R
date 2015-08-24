#R for Everyone####
# Code from the book 'R for Everyone'

#Basic Math####
1+2+3

#Variables####

#Variable Assignment
x<-2
x
y = 5
y
a <-b <- 7
a
#The more laborious way to assign a value to a variable
assign("j", 4)
j

#Removing Variables
j
rm(j)
#Now it's gone

#Data Types####

#To find the type of data contained in a variable, use the class function
class(a)
#Numeric Data - To test if a variable is numeric, use the is.numeric function
is.numeric(a)
#integers - similarly use the is.integer function for integers
i <- 5L
i
is.integer(i)
#However, i will also pass a numeric test, since integers are numbers (but not all numbers are integers)
is.numeric(i)

#Character Data (Or Strings)
x <- "data"
x
y <- factor("data")
y
#To find the length of the character (or numeric), use nchar
nchar(x)
nchar("Hello")

#This will not work for factor data
nchar(y)

#Dates
#Two ways to store data - using the Date function, or the POSIXct fucntion.

date1 <- as.Date("2012-06-28")
date1
class(date1)
as.numeric(date1)

date2 <- as.POSIXct("2012-06-28 17:42")
date2
class(date2)
as.numeric(date2)

#Logical
#Way of representing data that can either be true or false

TRUE*5 #Since numerically, TRUE is equal to 1
FALSE*5 #Numerically, FALSE is equal to 0

k <- TRUE
class(k)
is.logical(k)
#logicals from comparing two numbers or characters
2==3
2!=3
2<=3
"data"=="stats"
"data" < "stats"

#Vectors####
#Collection of elements, all of the same type
x <- c(1,2,3,4,5)
x
#Vector Operations
x*3
x+2
x-3
x/4
x^2
sqrt(x)
y <- 1:10
y
sqrt(y)
y^2
x <- 1:10
y <- -5:4
x+y
x-y
x*y
x/y
x^y
length(x)
length(y)
length(x+y)
x+c(1,2)
x+c(1,2,3)
x<=5
x>y
x <- 10:1
y <- -4:5
any(x<y)
all(x<y)

q <- c("Hockey", "Football", "Baseball", "Curling", "Rugby", "Lacrosse", "Basketball", "Tennis", "Cricket", "Soccer")
nchar(q)
nchar(y)
x[1]
x[1:2]
x[c(1,4)]
#Naming a vector during or after creating it
c(One="a", Two="y", Last="r")
#create a vector
w <- 1:3
#name the elements
names(w) <- c("a", "b", "c")
w
q2 <- c(q, "Hockey", "Lacrosse", "Hockey", "Water Polo", "Hockey", "Lacrosse")
q2Factor <- as.factor(q2)
q2Factor
as.numeric(q2Factor)
#Order of a factor
#Generally it is not important, but in some cases, such as in education levels

factor(x=c("High School", "College", "Masters", "Doctorate"), levels=c("High School", "College", "Masters", "Doctorate"), ordered=TRUE)

#Calling Functions####
#For example, calling the 'mean' function
mean(x)
