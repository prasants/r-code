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
#Missing Data####
#Two types of missing data in R - NA and NULL

#To test for missing values, use is.na
z <- c(1,2,NA, 8, 3, NA, 3)
z
is.na(z)
zChar <- c("Hockey", NA, "Lacrosse")
zChar
is.na(zChar)

#NULL - absense of anything
#Null cannot be used inside a vector
#Test for null using is.null

d <- NULL
is.null(d)

#Data Frames####
#Each column in a Data Frame is a vector, each of which has the same length

#Constructing a Data Frame
x <- 10:1
y <- -4:5
q <- c("Hockey", "Football", "Baseball", "Curling", "Rugby", "Lacrosse", "Baksetball", "Tennis", "Cricket", "Soccer")
theDF <- data.frame(x,y,q)
theDF
#The above code created a 10X3 data frame

#Assigning names to the columns
theDF <- data.frame(First = x, Second = y, Sport = q )
theDF

nrow(theDF)
ncol(theDF)
dim(theDF)

#Checking the column names
names(theDF)
#Checking specific column name
names(theDF)[3]

#Check row names of a data frame
rownames(theDF)
#Assign row names of a data frame
rownames(theDF) <- c("One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten")
rownames(theDF)
#Set names back to generic index
rownames(theDF) <- NULL
rownames(theDF)

head(theDF)
head(theDF, n=7)
tail(theDF)
tail(theDF, n=7)
class(theDF)

#Accessing individual columns of a dataframe
theDF$Sport
#Individual elements can also be accessed 
theDF[3,2] #Accessing the item in the 3rd row, 2nd column
#Soecifying more than one row or column by using vector indices
theDF[3, 2:3] #Third row, columns 2 and 3
theDF[2, 1:3] #Second row, all three columns

theDF[c(3,5),2] #Row 3 and 5, column 2
theDF[c(3,5), 2:3] #Row 3 and 5, column 2 through 3

theDF[1,] #Accessing Row, but not mentioning any column. So it selects the entire row
theDF[,3] #Accessing entire column
theDF[,2:3] #Accessing columns 2 through 3
theDF[2:4,] #Accessing rows 2 through 4
theDF[c("First", "Sport")] #Accessing multiple columns by name
theDF[,"Sport"] #Accessing a column by name

class(theDF[,"Sport"])
theDF["Sport"]
class(theDF["Sport"])
class(theDF[["Sport"]])

#Model Matrix
newFactor <- factor(c("Pennsylvania", "New York", "New Jersey", "New York", "Tennessee", "Massachusetts", "Pennsylvania", "New York"))
model.matrix(~newFactor -1)

#Lists####
#A Container to hold arbitrary objects of either the same type of varying types
list(1,2,3)
list(c(1,2,3))
(list3 <- list(c(1,2,3), 3:7)) #Creates a two element list. First is a 3 vector element, second is a 5 vector element.

list(theDF, 1:10)
list5 <- list(theDF, 1:10, list3)
list5
names(list5)
names(list5) <- c("data.frame", "vector", "list")
names(list5)
list5

list6 = list(TheDataFrame = theDF, TheVector = 1:10, TheList = list3)
names(list6)
list6
(emptylist <- vector(mode="list", length=4))
list5[[1]]
list5[[1:3]]

list5[["data.frame"]]
#Nested indexing of documents
list5[[1]]$Sport
list5[[1]][,"Second"]
length(list5)
list5
#Add a 4th element to list5
list5[[4]] <- 2
list5
names(list5)

#Matrices####
#Similar to data.frame, but every single element in a Matrix must be of the same type.

#Create a 5X2 matrix
A <- matrix(1:10, nrow=5)
#Create another 5X2 matrix
B <- matrix(21:30, nrow=5)
#Create one more 5X2 matrix
C <- matrix(21:40, nrow=2)
A
B
C
nrow(A)
nrow(B)
nrow(C)
dim(A)
#Add A and B
A+B
#Multiply them
A*B
#Check if elements are equal
A==B
#Trasposing B
A %*% t(B)
colnames(A)
rownames(A)
colnames(A) <- c("Left", "Right")
rownames(A) <- c("1st", "2nd", "3rd", "4th", "5th")
colnames(A)
rownames(A)
#Transposing flips the row and column names
t(A)
colnames(C) <- LETTERS[1:10] #'letters' vs 'LETTERS' 
rownames(C) <- c("Top", "Bottom")
A%*%C

#Arrays####
# An array is a multi-dimensional vector
theArray <- array(1:12, dim=c(2,3,2)) #Dimensions - 2 rows, 3 columns, 2 "tables"
theArray

theArray[1,,]
