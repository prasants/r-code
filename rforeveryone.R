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
