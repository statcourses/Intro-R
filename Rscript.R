###############################################################
######                  Introduction to R                ######
#########    Osama Mahmoud (o.mahmoud@bristol.ac.uk)   ########
##############     Website: www.osmahmoud.com    ##############
#################       19 OCTOBER 2019       #################

######################################
# Slide 8 - Help

help.search("sum")                  # search by topic
help(sum)                           # search for usage function
?sum                                # alternative for previous line
example(sum)                        # show examples for a function
demo()                              # show demos for all functions
demo(topic = "lm.glm", package = "stats") # show demo for a specific topic
help.start()                        # search web browser

######################################
# Slide 9 - Simple operations

5 + 3; 13 - 7; 3 * 4; 20 / 4; 2 ^ 3 # Arithmetic operations (the ';' allows writing multiple expressions on same line)
3 == 5; !(2 > 3); TRUE | FALSE; T & F        # Boolean operations
exp(1)                              # exponential function
log(100, base = 10)                 # logarithmic function
sqrt(16)                            # square root

######################################
# Slide 10 - Assign values

w <- 100                            # assign weight value
h <- 1.75                           # assign height value
BMI <- w/(h^2)                      # calculate BMI
BMI

######################################
# Slide 11 - Vectors

x <- c(2,4,6)
x

days <- c("Monday", "Thursday")
days

x <- 3:5
x

x <- seq(from=10, to=20, by=2)
x

x <- rep(5, times=3)
x

x <- rep(c(1,2,3), each=2)
x

######################################
# Slide 12 - Arithmetic operations using vectors

x <- c(5, 10, 15); y <- 1:3
A <- sqrt(7)*((x^2)+y)
A

round(A, digits = 2)

length(x)

######################################
# Slide 13 - Indexing vector elements

x <- 11 : 20
x
x [3]

x <- seq(0, 1, by=0.1)
x
x [c(1, 2, 5)]

x <- 1 : 5
x [-2]

x <- c(1, 3, 5, 7, 11, 13)
x [-(1 : 3)]

######################################
# Slide 14 - Vectors with different lengths

c(1,2) + c(1,2,3,4)             # equivalent to c(1,2,1,2) + c(1,2,3,4)
c(1,2) + c(1,2,3,4,5)           # equivalent to c(1,2,1,2,1) + c(1,2,3,4,5)

######################################
# Slide 16 - Logical values
3 <= 5
TRUE + TRUE + FALSE
x <- c(1,2,3,4,5); x < 4
sum(x < 4)
any(x < 4)                         # Is there 'any' of the x elements < 4?
all(x < 4)                         # Are 'all' of the x elements < 4?
which(x < 4)                       # Which indices of the x elements whose value is satisfying the given boolean statement?

######################################
# Slide 17 - Missing values

x <- c(2, -1, NA, 5, 0); any(is.na(x))
x[10]

sum(x)
NA & TRUE
NA | TRUE

sum(x, na.rm = TRUE)
na.omit(x)

######################################
# Slide 18 - Matrices

(M <- matrix(1:6, ncol=3, byrow=FALSE))
(M <- matrix(c(1,2,3,4,5,6), ncol=3, byrow=TRUE))

######################################
# Slide 19 - Matrix Arithmetics

(M1 <- matrix(c(2,1,5,-1), ncol=2)); (M2 <- matrix(1:4, 2))
3 * M
M1 + M2
M1 - M2
# Matrix multiplication: row vector * column vector
# 2*1 + 5*2      2*3 + 5*4
# 1*1 + (-1*2)   1*3 + (-1*4)
M1 %*% M2

# Practical Example: Element-wise multiplication
M1 * M2

######################################
# Slide 20 - Indexing matrix elements

(M <- matrix(1:10, ncol=5, byrow=TRUE))
M [2,]                               # index by row
M [,4]                               # index by column
M [1,5]                              # index by cell

# Practical Example: extract sub-matrix from M
M [, 2:4]

######################################
# Slide 22 - Objects

objects()
ls()
mode(M); mode(days); mode (c(TRUE, FALSE, FALSE))
attributes(M)
str(M)

######################################
# Slide 23 - Atomic data types

x <- c(1,2); y <- c(2i, 3); gender <- c("male", "female")
typeof(x); typeof(y); typeof(gender); typeof(x==2)
is.numeric(x); is.numeric(y)

(x <- as.character(1:10))             # this function changes inputs to strings
as.numeric(x)                         # this function changes inputs to numeric

######################################
# Slide 24 - factor class

Groups <- factor(c("Treatment", "Control", "Treatment",
                   "Control", "Control"))
Groups

# Practical Example: check mode, class, and convert Groups to numerical form
mode(Groups)
class(Groups)
as.numeric(Groups)

######################################
# Slide 26 - Concatenation of structures

Patient <- c(102, 105); gender <- factor(c("F", "M"))
Heart.R <- c(83, 78)
(Rates <- cbind(Patient, Heart.R))
class(Rates)

HeartData <- as.data.frame(Rates)
class(HeartData)

# add the vector gender to data frame Rates
cbind(Rates, gender)
cbind(HeartData, gender)

######################################
# Slide 27 - Data frames

participant <- c(1:4); group <- c("T", "C", "C", "T")
age <- c(22, 18, 33, 45); BMI <- c(25, 18, 32, 36)
(MyData <- data.frame(participant, group, age, BMI))

# Practical Example: structure and attributes of a data frame
str(MyData)
attributes(MyData)

######################################
# Slide 28 - Data frames

MyData$participant <- MyData$participant + 100
MyData

colnames(MyData) <- c("Patient", "Treat.", "Age", "BMI")
MyData[1:2,]

rownames(MyData) <- c("P1", "P2", "P3", "P4")
MyData

######################################
# Slide 29 - Merging of data frames

merge(MyData, HeartData)
merge(MyData, HeartData, all = TRUE)

# Practical Example: merge data frames: (a) with 'all.x=TRUE'; (b) with 'all.y=TRUE'
merge(MyData, HeartData, all.x = TRUE) # extra rows are added to the output, one for each row in x ('MyData' in this example) that has no matching row in y
merge(MyData, HeartData, all.y = TRUE) # extra rows are added to the output, one for each row in y that has no matching row in x

######################################
# Slide 30 - Import data sets

data(iris); head(iris)
iris[c(7,11),]
iris[,3:5]

getwd()                      # Show current working directory
setwd("YOUR_DESIRED_PATH")   # change working directory

######################################
# Slide 31 - Import & export data sets

list.files(getwd())          # List all files in a given path (here, the current working directory is given - however, any other path can be used)

write.csv(iris, "Mydata.csv", row.names = FALSE)        # export data sets to csv
write.table(iris, "Mydata.txt", row.names = FALSE)      # export data sets to txt

Im.data1 = read.csv(file = "Mydata.csv", header = TRUE) # import data from csv file
Im.data2 = read.table("Mydata.txt", header = TRUE)      # import data from txt file

attributes(iris); str(iris)                             # Get more information on a dataset
sapply(iris, class); lapply(iris, class)                # Show class of each variable

######################################
# Slide 34 - R functions

mean(x = c(2,5,8,11))
?mean

######################################
# Slide 35 - Creating functions

BMI <- function(h, w){
  Index <- w/(h^2)
  return(Index)
}
  
BMI(h=1.75, w=100)
BMI(h=1.80, w=62)

######################################
# Slide 36 - Usage of functions

# with explicit assignment
BMI(w=94, h=1.70)

# without explicit assignment
BMI(1.70, 94)

######################################
# Slide 38 - Conditional execution

# BMI - conditional execution: the if block
BMI <- function(h, w){
  if (h <= 0 | w <= 0){
    cat('warning: non-positive height or weight\n')
    h <- abs(h); w <- abs(w)
  }
  Index <- w/(h^2)
  return(Index)
}

BMI(-1.7,80)   # gives warning

######################################
# Slide 39 - Conditional execution

# BMI - conditional branching: the if-else block
BMI <- function(h, w){
  if (h > 0 & w > 0){
    Index <- w/(h^2)
    return(Index)
  } else {
    stop('non-positive height or weight\n')
  }
}

BMI(-1.7,80)   # gives error

######################################
# Slide 40 - Conditional execution

x <- 1:5
ifelse(x %% 2 == 0, "even", x)

######################################
# Slide 41 - FOR-loop

h <- c(1,3,5)
for (i in h){
  print(i)
}

show = c()
for (i in 1:3){
  show[i] <- ifelse(i %% 2 == 0, "E", "O")
}

######################################
# Slide 42 - REPEAT-loop

show <- 0
repeat{
  show <- show + 1
  if(show == 4){break}
}
show

######################################
# Slide 42 - WHILE-loop

set.seed(1234) # to get as same outputs as here
show <- c()
while(length(show) < 3){
  show[length(show)+1] <- rnorm(1)
}
show
