#Data Mining with R by Luis Torgo
#Prasant Sudhakaran####

#Chapter 1####

install.packages("RMySQL")
install.packages("DMwR")

installed.packages()
library()
#To check if there are newer versions of installed packages at CRAN
old.packages()
update.packages()
#To search the r-project site
#Format : RSiteSearch('Search term')
RSiteSearch('neural networks')

#R Objects

#Assigning values
x <- 945
x

#To list the current objects in memory
ls()
#Or alternatively:
objects()

#Vectors
#Vectors are used to store a set of elements of the same atomic data type
x <- 45.3 #Example of a single element vector
length(x) #To check the length of the vector

#Using the c() function to create vectors
v <- c(4,7, 23.5, 76.2, 90)
v
length(v)
mode(v) #Get or set the type or storage mode of an object.
#All elements of a vector must belong to the same mode, else R will coerce the type
#For example:
v <- c(4,7, 23.5, 76.2, 90, "rrt")
v
mode(v)

u <- c(4, 6, NA, 2) #All vectors may contain NA values
u

k <- c(T, F, NA, TRUE)
k

#Accessing a specific element of a vector
v[2] #Calling the second element of the vector v

#Changing the value of a particular vector
v[1] <- "hello"
v

#Creating an empty vector
x <- vector()
x
length(x)
#Add a value to a specific index, to alter the length of the vector
x[3] <- 45
x

#Assignment Operations are destructive (or can be destructive)
v <- c(45, 243, 78, 343, 445, 44, 56, 77)
v
v <- c(v[5], v[7])
v # v now consists of 2 elements

#Vectorisation
v <- c(4,7, 23.5, 76.2, 80)
x <- sqrt(v)
x
#Vector Arithmetic
v1 <- c(4, 6, 87)
v2 <- c(34, 32.4, 12)
v1 + v2

#If the vector isn't of sufficient length, R will use a recycling rule by repeating the
#shorter vector until it fills in the size of the larger vector
v1 <- c(4, 6, 8, 24)
v2 <- c(10, 2)
v1+v2

#If the lengths are not multiples, then a warning will be issued:
v1 <- c(4, 6, 8, 24)
v2 <- c(10, 2, 4)
v1+v2
#Single numbers are represented in R as vectors of length 1
v1 <- c(4,6,8,24)
2*v1 #The vector 2 is being multiplied with each element of v1

#Factors
#Easy and compact form of handling categorical (nominal) data

#Factors have levels that are the possible values they can take.
g <- c("f", "m", "m", "m", "f", "m", "f", "m", "f", "f")
g
#Transform vector g into a factor
g <- factor(g)
g

#Defining factor levels even when data consists of only one factor (at the moment)
other.g <- factor(c("m", "m", "m", "m", "m"))
other.g
other.g <- factor(c("m", "m", "m", "m", "m"), levels= c("f", "m"))
other.g #Now has two levels

#Counting the occurrence of each possible value, using the table function
table(g)
table(other.g)

#The table function can also be used for cross tabulation of several factors
a <- factor(c("adult", "adult", "juvenile", "juvenile", "adult", "adult", 
              "adult", "juvenile", "adult", "juvenile"))
table(a)
table(a,g)

#Calculate marginal and relative frequencies of contingency tables
t <- table(a,g)
margin.table(t,1) # 1 represents the first dimension of the table
margin.table(t,2) # 2 represents the second dimension of the table

#For relative frequencies
prop.table(t,1)
prop.table(t,2)*100 #Multiplied by 100 to get percentage figures instead of decimals

#Generating Sequences
#To create a vector containing integers between 1 and 100
c <- 1:100
c
#Decreasing sequences
5:0

#To generate sequences of real numbers, use the function seq()
seq(-4, 1, 0.5) #A sequene of real numbers between -4 and 1, with increments of 0.5
#More example of the use of seq()
seq(from=1, to=5, length=4)

#Repeating a sequence of characters
rep(5,10) #Repeats the number 5, ten times
rep("hi", 3) #Repeats the string 'hi' three times
rep(1:2, 3) #Repeats the sequence 1:2 three times
rep(1:2, each =3) #Repeats the numbers 1 and 2, each of the three times

#The gl() function:
#Used to generate sequences involving factors
#Syntax of the function is gl(k,n), where k is the number of levels of the factor, 
#n is the number of repetitions of each level.

gl(3,5)
gl(2,5, labels=c("female", "male"))

#Generating random numbers
#Ten randomly generated numbers from a normal distribution with zero mean
#and unit standard deviation
a <- rnorm(10)
plot (a)
#Randomly genarated numbers with a mean of 10 and SD of 3
a <- rnorm(10, mean = 10, sd = 3)
a
plot(a)
#Five numbers drawn randomly from a student t distribution with 10 degrees of freedom
rt(5, df = 10)

#Sub-setting
#Logical index vectors: Extract elements corresponding to true values
x <- c(0,-3, 4, -1, 45, 90, -5)
x>0 #Only the values greater than 0 will return TRUE
x[x>0] #Give me the values of x, for which the following logical expression is true
#More complex logical operators
x[x<=-2 | x>5]
x[x>40 & x<100]
#Extracting several elements from a vector
x[c(4,6)]
x[1:3]
y <- c(1,4)
x[y]
#Use a vector with negative indices to indicate which elements are to be excluded from selection
x[-1]
x[-(1:3)]

pH <- c(4.5, 7, 7.3, 8.2, 6.3)
names(pH) <- c("area 1", "area 2", "mud", "dam", "middle")
pH
#If you already know the names of the vectors:
ph <- c(area1=4.5, area2=7, mud=7.3, dam=8.2, middle=6.3)
ph
ph["mud"] #Indexing of the name
ph[c("area1", "mud", "middle")]

#Empty Index
#Represents absense of a restriction on the selection process
ph[] <- 0 #Assigns 0 as the value for all vectors in "ph"
ph[]

#Matrices and Arrays
#Matrices are a special case of arrays with two single dimensions
m <- c(45, 23, 66, 77, 33, 44, 56, 12, 78, 23)
m
dim(m) <- c(2,5) #Specifying the dimensions of the matrix - 2 rows, 5 columns
m
#Alternate way to create the same matrix
m <- matrix(c(45, 23, 66, 77, 33, 44, 56, 12, 78, 23),2,5)
m #Matrix, filled by column

m <- matrix(c(45, 23, 66, 77, 33, 44, 56, 12, 78, 23), 2,
            5, byrow=T)
m #Matrix, by row

m[2,3] #2nd row, 3rd column

m[-2,1] 
m[1,] #Obtain the entire first row
m[,4] #Obtain the entire fourth column
m[,90] #Will give an 'Out of Bounds' error if you specify column that doesn't exist 

#Using the cbind/rbind function to join two or more matrices by columns or rows respectively
m1 <- matrix(c(45, 23, 66, 77, 33, 44, 56, 12, 78, 23), 2, 5)
m1
cbind(c(4,76), m1[,4])

m2 <- matrix(rep(10,20), 4,5) #Repeat the number '10', twenty times, arrange into a 4X5 matrix
m2

m3 <- rbind(m[1,],m2[3,]) #combine the 1st row of m1, and 3rd row of m2
m3

#Column and Row Name
results <- matrix(c(10,30,40,50,43,56,21,30),2,4,
                   byrow=T)
colnames(results) <- c("1qrt", "2qrt", "3qrt", "4qrt")
rownames(results) <- c("store1", "store2")
results
results["store1",]

results["store2", c("1qrt", "4qrt")]

#Arrays
#Arrays are extesnions of matrices to more than 2 dimensions
#Initiated by using the array() function
a <- array(1:24, dim = c(4, 3, 2))
a
a[1,3,2] #First row, third column, 2nd matrix
a[1,,2] #First row, 2nd matrix
a[4,3,] #Selects the elements at 4th row, 3rd column from both matrices 
a[c(2,3),,-2]

m <- matrix(c(45, 23, 66, 77, 33, 44, 56, 12, 78, 23),2,5)
m
m <- matrix(c(45, 23, 66, 77, 33, 44, 56, 12, 78, 23), 2, 5, byrow=T) #Same as the previous matrix, but arranged by row
m
m*3

m1 <- matrix(c(45, 23, 66, 77, 33, 44), 2,3)
m1
m2 <- matrix(c(12,65,32,7,4,78),2,3)
m2
m1+m2

#Lists
#List components need not be of the same type, mode or length
my.list <- list(stud.id=34453,stud.name="John",
                stud.marks=c(14.3,12,15,19))
my.list
my.list[1]
my.list[[1]] #Compare the difference between the two notations

mode(my.list[1])
mode(my.list[[1]])

#Alternate way of extracting values from a list
my.list$stud.id

names(my.list)
names(my.list) <- c("id", "name", "marks")
my.list
#Adding extra components
my.list$parents.names <- c("Anna", "Mahesh")
my.list
length(my.list)
#Removing components
my.list <- my.list[-3]
my.list
other <- list(age=19, sex = "male")
lst <- c(my.list, other) #Combining two lists
lst
#Using unlist() function to unflatten all data in a list
unlist(my.list) #Coerces everything into a character string

#Data Frames
#In R, Dataframes are a special class of lists
#Each row of the dataframe can be seen as an observation, described by a set of variables

my.dataset <- data.frame(site=c("A", "B", "A", "A", "B"), 
                         season=c("Winter", "Summer", "Summer", "Spring", "Fall"),
                         pH = c(7.4, 6.3, 8.6, 7.2, 8.9))
my.dataset
my.dataset[3,2] #Accessing elements of a data frame
my.dataset$pH
my.dataset[my.dataset$pH >8.2,] #Querying a specific column of the dataframe
my.dataset[my.dataset$site =="A", "pH"] #Extracting pH values of sites with value "A"

my.dataset[my.dataset$season == "Summer", c("site", "pH")]

#The attach() function simplifies these queries by allowing to access the columns of a 
#dataframe directly without having to use the name of the respective data frame
attach(my.dataset)
my.dataset[site=="B",]
season
#Inverse of attach() is detach()
detach(my.dataset)
season #Give the following error: "Error: object 'season' not found"

#attaching again
attach(my.dataset)
season

#Use the subset() function when only querying the dataframe
subset(my.dataset, pH>8)
subset(my.dataset, season=="Summer", season:pH)
#Adding 1 to all observations in pH column for the season Summer
my.dataset[my.dataset$season=="Summer", "pH"] <- my.dataset[my.dataset$season =="Summer",'pH']+1
my.dataset

#Add a new column to the dataframe, i.e. a new set of observations for each row
my.dataset$NO3 <- c(234.5, 256.6, 654.1, 356.7, 776.4)
my.dataset
nrow(my.dataset)
ncol(my.dataset)
my.dataset <- edit(my.dataset)
names(my.dataset)[4] <- "PO4" #Changing the name of the 4th column to PO4
my.dataset

#Creating New Functions

