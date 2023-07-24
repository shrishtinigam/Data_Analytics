# Lab 4b
# L7+L8
# Meher Shrishti Nigam
# CSE AI + Robotics
# 20BRS1193
# LAB 4 FDA Lab Experiment-4-b
# 1. Install the package MASS.
is_installed <- function(mypkg) is.element(mypkg, installed.packages()[,1])
# 2. Import the package MASS.
library(MASS)
# 3. Display the structure of the data survey.
data("survey")
survey
# 4. Check the class and type of the data set survey in MASS.
class(survey)
typeof(survey)
# 5. Get the number of rows and columns of the survey data frame.
ncol(survey)
nrow(survey)
# 6. Get the dimension of the survey data frame.
dim(survey)
# 7. Provide the statistical summary of the data frame.
summary(survey)
# 8. Display the column names of the survey data frame
names(survey)
# 9. Retrieve the top 3 rows from the data frame.
head(survey, 3)
# 10. Extract the bottom 2 rows from the data frame.
tail(survey, 2)