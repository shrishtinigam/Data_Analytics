# Lab 2
# L7+L8
# Meher Shrishti Nigam
# CSE AI + Robotics
# 20BRS1193

# Problem and Answer -> in comments

# Nonsensical coercion
x <- c("a", "b", "c")
# as.numeric(x)   => Warning message: In eval(ei, envir) : NAs introduced by coercion
class(x)

y <- c("1", "2", "3")
class(y)
y = as.numeric(y)
class(y)

# Matrices
m <- matrix(nrow = 2, ncol = 3)
m
dim(m)
attributes(m)

m <- matrix(nrow = 5, ncol = 6)
m
dim(m)

m <- matrix(1:6, nrow = 2, ncol = 3)
m

m <- 1:10
m
dim(m) <- c(2,5)
m
dim(m) <- c(5,2)
m
# dim(m) <- c(5,3)

x <- 1:3
y <- 10:12
cbind(x,y)
rbind(x,y)

