# Meher Shrishti Nigam
# 20BRS1193
# EDA Lab 10
options(prompt="MEHERSHRISHTI>", continue =" ")
# options(prompt=">", continue =" ")
# EDA-LAB-EXPERIMENT-10 (Date-25/3/2023)
library(dplyr)
library(ggplot2)
# Q1) You have been given a gene expression data set (Ch10Ex11.csv) that 
consists of 40 tissue samples with
# measurements on 1,000 genes. The first 20 samples are from healthy patients, 
while the second 20 are 
# from a diseased group.
# (a) Load in the data using read.csv(). You will need to select header=F.
setwd("C:/Users/meher/Documents/6th sem courses/EDA/Lab/Lab 10")
df <- read.csv("geneData.csv", header = FALSE)
# (b) Apply hierarchical clustering to the samples using correlationbased 
distance, and plot the dendrogram. 
# Do the genes separate the samples into the two groups? Do your results depend 
on the type of linkage 
# used?
dists <- dist(cor(df))
methods <- c('centroid', 'average', 'single', 'complete')
par(mfrow = c(2,2))
for (method in methods) {
 clusts <- hclust(dists, method = method)
 
 plot(clusts, 
 col = "#487AA1", col.main = "#45ADA8", 
 col.lab = "#7C8071", col.axis = "#F38630", 
 lwd = 3, lty = 1, 
 sub = "", hang = -1, 
 axes = FALSE,
 main = paste0('Cluster Dendrogram using ', method, ' metric'))
}
require(corrplot)
corrplot(cor(df), method = 'color', 
 order = 'hclust', hclust.method = 'complete', 
 tl.col = 'black', tl.cex = 0.7)
patient_groups <- cutree(clusts, k = 2)
patient_groups
# (c) Your collaborator wants to know which genes differ the most across the two 
groups. Suggest a way to 
# answer this question,and apply it here.
set.seed(702)
gene <- read.csv("geneData.csv", header = FALSE)
pr.gene <- prcomp(t(gene), scale=T)
plot(pr.gene)
summary(pr.gene)
set.seed(702)
gl <- apply(pr.gene$rotation, 1, sum)
gl.dif <- order(abs(gl), decreasing=T)
top15 <-gl.dif[1:15]
top15
# Q2. The Wage data set contains a number of other features, such as marital 
status (maritl), job class 
#(jobclass),and others. Explore the relationships between some of these other 
predictors and wage, and 
# use non-linear fitting techniques in order to fit flexible models to the data. 
Create plots of the results 
# obtained, and write a summary of your findings.
library(ISLR)
library(boot)
set.seed(1)
summary(Wage$maritl)
# table(Wage$maritl) the same with `summary`
summary(Wage$jobclass)
par(mfrow = c(1, 2))
plot(Wage$maritl, Wage$wage)
plot(Wage$jobclass, Wage$wage)
install.packages("gam")
library(gam)
fit1 <- gam(wage ~ lo(year, span = 0.7) + s(age, 5) + education, data = Wage)
fit2 <- gam(wage ~ lo(year, span = 0.7) + s(age, 5) + education + jobclass, data = 
Wage)
fit3 <- gam(wage ~ lo(year, span = 0.7) + s(age, 5) + education + maritl, data = 
Wage)
fit4 <- gam(wage ~ lo(year, span = 0.7) + s(age, 5) + education + jobclass + 
maritl, data = Wage)
anova(fit1, fit2, fit3, fit4)
par(mfrow = c(2, 3))
plot(fit4, se = T, col = "blue")
# Q3. Fit some of the non-linear models to the Auto data set. Is there evidence 
for non-linear relationships in 
# this data set? Create some informative plots to justify your answer
set.seed(1)
pairs(Auto)
fit <- lm(mpg ~ poly(cylinders, 2) + poly(displacement, 5) + poly(horsepower, 5) 
+ poly(weight, 5), data = Auto)
summary(fit)
anv1 <- gam(mpg ~ displacement + horsepower + weight, data = Auto)
anv2 <- gam(mpg ~ displacement + s(horsepower, 2) + weight, data = Auto)
anv3 <- gam(mpg ~ s(displacement, 5) + s(horsepower, 5) + s(weight, 5), data = 
Auto)
anova(anv1, anv2, anv3, test = 'F')
summary(anv3)
par(mfrow=c(1,3))
plot.Gam(anv3, se=TRUE, col="red")
anv4 <- gam(mpg ~ s(displacement, 3) + s(horsepower, 3) + weight, data = Auto)
anova(anv4, anv3, test = 'F')
par(mfrow=c(1,3))
plot(anv4, se=TRUE, col="red")
lm1 <- glm(mpg ~ displacement + horsepower + weight, data = Auto)
lm2 <- glm(mpg ~ poly(displacement, 3) + poly(horsepower, 3) + weight, data = 
Auto)
lm3 <- glm(mpg ~ poly(displacement, 5) + poly(horsepower, 5) + poly(weight, 
5), data = Auto)
cv.glm(Auto, lm1, K = 10)$delta[1]
cv.glm(Auto, lm2, K = 10)$delta[1]
cv.glm(Auto, lm3, K = 10)$delta[1]






