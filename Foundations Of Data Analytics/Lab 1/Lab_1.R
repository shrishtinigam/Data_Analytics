# CTRL + L -> clear screen
# CTRL + SHIFT + ENTER -> Run All
# https://www.roelpeters.be/the-difference-between-arrow-and-equals-assignment-in-r/

# Numeric
x<-1
print(x)
x

# Character
msg = "hello"
print(msg)
msg

# Vector
x <- 1:20
print(x)
x

rollNumbers <- 1:70
rollNumbers


x <- c(0.5, 0.6) # numeric
x
x <- c(TRUE, FALSE) # logical
x
x <- c(T, F) # logical
x
x <- c("a", "b", "c") # character
x
x <- 9:29 # integer
x
x <- c(1+0i, 2+4i) # complex
x

y <- c(1.7, "a")
y
class(y)
y <-c(1.7, 1.8)
y
class(y)
y <- c(TRUE, 2)
y
class(y)
y <- c(TRUE, FALSE)
y
class(y)
y <- c("a", TRUE)
y
class(y)
# help()

x <- 0:6
class(x)
y <- as.numeric(x)
y
class(y)
y <- as.logical(x)
y
class(y)
y <- as.character(x)
y
class(y)
y <- as.complex(x)
y
class(y)