# Meher Shrishti Nigam
# 20BRS1193
# EDA Lab 1
options(prompt="MEHERSHRISHTI>", continue =" ")
# options(prompt=">", continue =" ")
# EDA-LAB-EXPERIMENT-1 (Date-16/12/2022) 
library(ISLR)
# Q1. This question involves the use of multiple linear regression on the Auto data set.
df <- Auto
df <- na.omit(df)
# (a) Produce a scatterplot matrix which includes all of the variables in the data set.
pairs(df)
# (b) Compute the matrix of correlations between the variables using the function cor().
df_num <- subset(df, select = -name)
cor(df_num)

# (c) Use the lm() function to perform a multiple linear regression with mpg as 
# the response and all other variables except name as the predictors.
# Use the summary() function to print the results.
# Comment on the output. For instance:
linear_model <- lm(mpg ~ ., data=df_num)
summary(linear_model) 

# i. Is there a relationship between the predictors and the response?

# We test whether the null hypothesis of all regression coefficients are zero. 
# This helps us test whether there is a relationship between predictors and response.
# P-value is low and F-statistic is not close to 1, thus we can refute the null hypothesis.


# ii. Which predictors appear to have a statistically significant relationship to the response?

# Displacement, Weight, Year, Origin have statistically significant relationships with the response.
# Whereas Cylinders, Horsepower, Acceleration do not have a statistically significant relationship.
# This can be determined using their p-values of a predictor's t-statistic. 

# iii. What does the coefficient for the year variable suggest?

# The coefficient for the year variable is 0.750773. 
# This tells us that every passing year, mpg (miles per gallon) increases by the coeffcient 0.75 approximately. 

# (d) Use the plot() function to produce diagnostic plots of the linear regression 
# fit. Comment on any problems you see with the fit.
# Do the residual plots suggest any unusually large outliers? 
# Does the leverage plot identifies any observations with unusually high leverage?
par(mfrow = c(2, 2))
plot(linear_model)

# The Residuals vs Fitted Plot suggests that a linear model is not the best fit for the given dataset.
# The Residuals vs Fitted Plot does not suggest any unusually large outliers.
# The Residuals vs Leverage plot shows data point 14 has a unusually high leverage. It's residual value is low however.

plot(predict(linear_model), rstudent(linear_model))

# (e) Use the * and : symbols to fit linear regression models with interaction effects. 
# Do any interactions appear to be statistically significant?
linear_model_2 <- lm(mpg ~ weight * cylinders + weight * displacement, data = Auto)
summary(linear_model_2)
# Interaction between weight and displacement is statistically significant, while the interaction between cylinders and weight is not.

#  (f) Try a few different transformations of the variables, such as log(X), √X, X2. Comment on your findings.
linear_model_3 <- lm(mpg ~ log2(weight) * cylinders + sqrt(weight) * displacement, data = Auto)
summary(linear_model_3)
# Interaction between sqrt(weight) and displacement is statistically significant, while the interaction between cylinders and log2(weight) is not.

linear_model_4 <- lm(mpg ~ weight * displacement + sqrt(cylinders) * weight, data = Auto)
summary(linear_model_4)
# Interaction between weight and displacement is statistically significant, while the interaction between sqrt(cylinders) and weight is not.

