# Meher Shrishti Nigam
# 20BRS1193
# EDA Lab 6
options(prompt="MEHERSHRISHTI>", continue =" ")
# options(prompt=">", continue =" ")
# EDA-LAB-EXPERIMENT-6 (Date-10/2/2023)
library(ISLR)

# Q1
data <- Weekly
data
## (a)

# Correlation Matrix
install.packages('corrplot')
df <- subset(data, select = -c(Direction) )
library(corrplot)
corr<-cor(df)
corrplot(corr, method="circle")
corr
# Pairplot
df2 <- subset(data, select = c(Year, Lag1, Lag2, Direction))
df2_head <- head(df2, 50)
pairs(df2_head)

## (b)
logistic_model <- glm(Direction ~ Lag1 + Lag2 + Lag3 + Lag4 + Lag5 + Volume,
                      data = data, family="binomial")
logistic_model
## (c)

prediction <- predict(logistic_model,
                      data, type = "response")
cf <- rep("Down", length(prediction))
cf[prediction>0.5] = "Up" # Up
cf[prediction<=0.5] = "Down" # Down
table(cf, data$Direction)

## (d)
logistic_model <- glm(Direction ~ Lag2,
                      data = data, family="binomial")
logistic_model

prediction <- predict(logistic_model,
                      data, type = "response")
cf <- rep("Down", length(prediction))
cf[prediction>0.5] = "Up" # Up
cf[prediction<=0.5] = "Down" # Down
table(cf, data$Direction)

# Q2

## (a)
attach(Auto)
summary(Auto)
mpg01 <- rep(0, length(mpg))
mpg01[mpg > median(mpg)] <- 1
Auto = data.frame(Auto, mpg01)
Auto
## (b)
corrplot(cor(Auto[,-9]), method="square")

# The variables that appear to correlate strongly with mpg01 are Cylinders,Displacement, and Weight; these variables appear to correlate negatively with this variable. Also Horsepower and Origin appear to correlate moderately with mpg01.
## (c)
train <- (year %% 2 == 0)
train.auto <- Auto[train,]
test.auto <- Auto[-train,]
auto.fit<-glm(mpg01~displacement+horsepower+weight+year+cylinders+origin, data=train.auto,family=binomial)
auto.fit
auto.probs = predict(auto.fit, test.auto, type = "response")
auto.pred = rep(0, length(auto.probs))
auto.pred[auto.probs > 0.5] = 1
table(auto.pred, test.auto$mpg01)












