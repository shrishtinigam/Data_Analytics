# Lab 2
# L7+L8
# Meher Shrishti Nigam
# CSE AI + Robotics
# 20BRS1193

# LAB 1 Understanding Basic Data Types in R

rm(list=ls())

# Ram went to a shop to buy chocolates. He carried Rs. A in his pocket 
# where ‘A’ is a real number (For eg., 10.5 means 10 Rupees 50 paise). 
# He bought ‘B’ chocolates for the Rupee part of the money he had.  
# where ‘B’ is an integer value (for eg., 5 means 5 chocolates). 
# Compute the cost of a chocolate.

# Q1 Let the money be denoted as variable A. Assign a decimal value to it and display it.
# Ans1 
A <- 10.5
print(A) # or
A

# Q2 Print the class name of the variable A.
# Ans2
class(A)

# Q3 Check whether the variable A is of type ‘numeric’.
# Ans3
is.numeric(A)

# Q4 Let the number of chocolates be denoted as variable B. Assign an integer value to it and display it.
# Ans4
B <- 5L
B

# Q5 Check whether the variable B is of type ‘integer’.
# Ans5
is.integer(B)

# Q6 Create a variable C which stores the rupee part of the money he carried.
# Ans6
C <- floor(A) # as.integer(A)
C

# Q7 Compute the cost of a chocolate.
# Ans7 Let the variable costOfChocolate contain the cost of 1 chocolate
costOfChocolate <- C/B
costOfChocolate

# Q8 Represent the money as character string.
# Ans8
money <- as.character(A)
money

# Q9 Store the first name and last name of the kid.
# Ans9
firstName <- "Ram"
lastName <- "Khanna"
firstName
lastName

# Q10 Display the message “<firstname lastname> bought <B> chocolates”
# Ans10
paste(firstName , " ", lastName, " bought ", B, " chocolates.") # or
print(sprintf("%s bought %d chocolates.", paste(firstName, lastName), B))

# Consider the kids rhymes “Twinkle Twinkle Little Star”

rhyme = "Twinkle Twinkle Little Star"

# Q11 Extract the substring “Little ” from the rhymes.
# Ans11
rhymeSubstring = substring(rhyme, 17, 22) # or
rhymeSubstring 
rhymeSubstring = substr(rhyme, start=17, stop=22)
rhymeSubstring 

# Q12 Replace “Little” as “Big”.
# Ans12
rhyme = sub("Little", "Big", rhyme)
rhyme

# Babu wanted to know about complex number. Help him to understand
# the real and imaginary part of the complex number. Show him that 
# square root of a negative value can be computed by converting it 
# into a complex number.

# Q13 Assign a complex number to a variable X.
# Ans13
X = 5 + 8i
X
# Q14 Display the real part of X.
# Ans14
Re(X)

# Q15 Display the imaginary part of X.
# Ans15
Im(X)

# Q16 Compute square root of a negative number.
# Ans16
sqrt(as.complex(-236))

# Q17 Check whether real part of X is greater than its imaginary part.
# Ans17
if(Re(X) > Im(X)){
  print("Yes, the real part of X is greater than the imaginary part.")
}else{
  print("No, the real part of X is not greater than the imaginary part.")
}

# or

check <- Re(X) > Im(X)
check

# Q18 Write a R program to take input from a user. Input must be 
# name, age, registration number and subject name. Display the 
# information on the console. Display the version of R you're using.

name1 <- readline()

age <- readline()
age = as.integer(age)

regno <- readline()

subject <- readline()

paste("Name: ", name1)
paste("Age: ", age)
paste("Registration No.: ", regno)
paste("Subject: ", subject)

print(R.version.string)