# Meher Shrishti Nigam
# 20BRS1193
# EDA Lab 1
options(prompt="MEHERSHRISHTI>", continue =" ")
options(prompt=">", continue =" ")
# EDA-LAB-EXPERIMENT-1 (Date-16/12/2022) 
library(ISLR)
# This question involves the use of simple linear regression on the Auto data set.
# Perform a simple linear regression with mpg as the response and horsepower as the predictor. 
# Print the summery of the dataset. Comment on the output.
df <- Auto
df <- na.omit(df)
mpgY <- df$mpg
hpX <- df$horsepower

# (a) Is there a relationship between the predictor and the response?
relation <- lm(mpgY~hpX)
relation
summary(relation)

correlation <- cor(hpX, mpgY, method = "pearson")
correlation

# Yes, as there is a moderately strong correlation of -0.7784268 between mpg and horsepower.
# Thus, there is a relationship between the predictor and the response.

# (b) How strong is the relationship between the predictor and the response?
correlation <- cor(hpX, mpgY, method = "pearson")
correlation
# An absolute correlation greater than 0.7 shows that there is a significant relationship between the predictor and the response.

# (c) Is the relationship between the predictor and the response positive or negative?
# The relationship is negative, i.e, miles per gallon (mpg) increases when horsepower decreases, and vice versa.

# (d) What is the predicted mpg associated with a horsepower of 98? What are the associated 95 % confidence and prediction intervals?
testData <- data.frame(hpX = 98)
confidenceMpg <- predict(relation, testData, interval = "confidence") 
confidenceMpg
predictedMpg <- predict(relation, testData, interval = "prediction") 
predictedMpg
# Thus, this shows that we can predict the mpg of a car with horsepower of 98 to be between 14.81 to 34.12 with 95% confidence.

# (e) Plot the response and the predictor. Display the least squares regression line.
plot(hpX, mpgY)
abline(relation)

# (f) Use the plot() function to produce diagnostic plots of the least squares regression fit. Comment on any problems you see with the fit.
par(mfrow=c(2,2))
plot(relation)

# We observe that there is non-linearity in the data from the plot of residuals v. fitted values.
# Thus, fitting a linear equation is not the best solution for this problem.
# A few outliers can be noticed in the plot of standardized residuals versus leverage, as they are higher than 2 or lower than -2.

