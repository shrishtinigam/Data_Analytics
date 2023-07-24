# Meher Shrishti Nigam
# 20BRS1193
# EDA Lab 2
options(prompt="MEHERSHRISHTI>", continue =" ")
# options(prompt=">", continue =" ")
# EDA-LAB-EXPERIMENT-2 (Date-6/1/2023) 
library(ISLR)

# Q2. This question should be answered using the Carseats data set.
df <- Carseats
df <- na.omit(df)

# (a) Fit a multiple regression model to predict Sales using Price, Urban, and US.
summary(Carseats)
linear_model <-  lm(Sales ~ Price + Urban + US, data = df)
summary(linear_model)

# (b) Provide an interpretation of each coefficient in the model. Be careful—some of 
# the variables in the model are qualitative!
# USYes: Our linear model predicts that USYes and Sales are correlated. The coefficient is positive, thus, when USYes increases, Sales decreases.
# In the Price attribute, we observe a low p value of the t statistic. Thus, our linear model predicts that Price and Sales are correlated. 
# The coefficient is negative, thus, when Price increases, Sales decreases.
# We notice that UrbanYes, a variable that gives us information about the location of the store, has no relation with number of sales in our linear model.

# (c) Write out the model in equation form, being careful to handle
# the qualitative variables properly.
# Sales = 13.043469 -0.054459 Price -0.021916 UrbanYes + 1.200573 USYes  
# We can remove the UrbanYes function as well.

# (d) For which of the predictors can you reject the null hypothesis H0 : βj = 0?
# Price and USYes, based on the  p-value of F-statistic.

# (e) On the basis of your response to the previous question, fit a smaller model 
# that only uses the predictors for which there is evidence of association with the outcome.
linear_model <-  lm(Sales ~ Price + US, data = df)
summary(linear_model)

# (f) How well do the models in (a) and (e) fit the data?
# Both of the linear regressions fit the data similarly based on RSE and R2, with linear regression from (e) significantly doing very little better. 

# (g) Using the model from (e), obtain 95 % confidence intervals for the coefficient(s).
confint(linear_model)

# (h) Is there evidence of outliers or high leverage observations in the model from (e)?
plot(predict(linear_model), rstudent(linear_model))
# No probable outliers are inferred from the linear regression because all residuals are within the range of -3 to 3. 
par(mfrow = c(2, 2))
plot(linear_model)
