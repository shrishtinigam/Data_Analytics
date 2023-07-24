# Meher Shrishti Nigam
# 20BRS1193
# EDA Lab 9
options(prompt="MEHERSHRISHTI>", continue =" ")
# options(prompt=">", continue =" ")
# EDA-LAB-EXPERIMENT-9 (Date-10/3/2023)
library(dplyr)
library(ggplot2)

# Q1)
# In this problem, you will perform K-means clustering, with K = 2, on a small 
# example with n = 6 observations and p = 2 features. The observations are as 
# follows.

# (a) Plot the observations.

n = 6
X = matrix(c(1, 4, 1, 3, 0, 4, 5, 1, 6, 2, 4, 0),
           nrow = n, byrow = T)
plot(X)

# (b)  Randomly assign a cluster label to each observation. You can use the 
# sample() command in R to do this. Report the cluster labels for each observation.

set.seed(2^17 - 1)
clusters = sample(1:2, n, replace = T)
clusters
col = rep("red", n)
col[clusters == 2] = "blue"
pch = rep(16, n)
pch[clusters == 2] = 17
plot(X, col = col, pch = pch)

# (c) Compute the centroid for each cluster.
centroids = aggregate(X, list(Cluster = clusters), mean)
centroids
plot(X, col = col, pch = pch)
points(centroids[1,2:3], col = "red", pch = 8)
points(centroids[2,2:3], col = "blue", pch = 8)

# (d) Assign each observation to the centroid to which it is closest, in terms of
# Euclidean distance. Report the cluster labels for each observation.
# Create a function to get the closest centroid
library(class)
clusters = knn(centroids[,2:3], X, factor(centroids[,1]))
clusters

col = rep("red", n)
col[clusters == 2] = "blue"
pch = rep(16, n)
pch[clusters == 2] = 17
plot(X, col = col, pch = pch)

# (e) Repeat (c) and (d) until the answers obtained stop changing.
centroids = aggregate(X, list(Cluster = clusters), mean)
centroids
plot(X, col = col, pch = pch)
points(centroids[1,2:3], col = "red", pch = 8)
points(centroids[2,2:3], col = "blue", pch = 8)
clusters = knn(centroids[,2:3], X, factor(centroids[,1]))
clusters
centroids = aggregate(X, list(Cluster = clusters), mean)
centroids

# (f) In your plot from (a), color the observations according to the cluster labels 
# obtained.
col = rep("red", n)
col[clusters == 2] = "blue"
pch = rep(16, n)
pch[clusters == 2] = 17
plot(X, col = col, pch = pch)
points(centroids[1,2:3], col = "red", pch = 8)
points(centroids[2,2:3], col = "blue", pch = 8)


# Q2)

# Consider the USArrests data. We will now perform hierarchal clustering on the states.
library(ISLR)
data("USArrests")

# (a) Using hierarchical clustering with complete linkage and Euclidean distance, 
# cluster the states.
set.seed(702)
hclust.mod <- hclust(dist(USArrests), method='complete')

plot(hclust.mod, main='Hierarchical clustering with complete linkage and Euclidean distance')

# install.packages("ggdendro")
library(ggdendro)
library(tidyverse)

ggdendrogram(hclust.mod, segements=TRUE, labels=TRUE, leaf_labels = TRUE, rotate=FALSE, theme_dendro = TRUE) + 
  labs(title='Hierarchical clustering with complete linkage and Euclidean distance')

# (b) Cut the dendrogram at a height that results in three distinct clusters. Which 
# states belong to which clusters?
set.seed(702)
cut3 <- cutree(hclust.mod, 3)
table(cut3)
cut3
plot(cut3)


# (c) Hierarchically cluster the states using complete linkage and Euclidean distance, 
# after scaling the variables to have standard deviation one.
hclust.scale <- scale(USArrests)
set.seed(702)
hclust.scale.mod <- hclust(dist(hclust.scale),method='complete')

plot(hclust.scale.mod, main='Hierarchical cluster After scaling variables to 1 SD')
ggdendrogram(hclust.scale.mod, segements=TRUE, labels=TRUE, leaf_labels = TRUE, rotate=FALSE, theme_dendro = TRUE) + 
  labs(title='Hierarchical cluster After scaling variables to 1 SD')

# (d) What effect does scaling the variables have on the hierarchical clustering 
# obtained? In your opinion, should the variables be scaled before the interobservation dissimilarities are computed?
set.seed(702)
cut.hclust.scale.mod <- cutree(hclust.scale.mod,3)

table(cut.hclust.scale.mod)
cut.hclust.scale.mod
Non.SD <- cut3
SD.1 <- cut.hclust.scale.mod

tab <- table(Non.SD, SD.1)
tab
same <- (tab[1,1] + tab[2,2] + tab[3,3]) / sum(tab)
cat('It appears that ', same*100,'% of the observations are assigned to the same clusters')

# Provide a justification for your answer.
# We experiment above with results for non scaled. Scaling should be done because the units of measure are very different.

# Q3)

# In this problem, you will generate simulated data, and then perform K-means 
# clustering on the data.

# (a) Generate a simulated data set with 20 observations in each of three classes (i.e. 
# 60 observations total), and 50 variables.
# Hint: There are a number of functions in R that you can use to generate data. One 
# example is the rnorm() function; runif() is another option. Be sure to add a mean 
# shift to the observations in each class so that there are three distinct classes.
X <- rbind(matrix(rnorm(20*50, mean = 0), nrow = 20),
           matrix(rnorm(20*50, mean=0.7), nrow = 20),
           matrix(rnorm(20*50, mean=1.4), nrow = 20))

# (b) Perform K-means clustering of the observations with K = 3.
# How well do the clusters that you obtained in K-means clustering compare to the 
# true class labels?

# Hint: You can use the table() function in R to compare the true class labels to the 
# class labels obtained by clustering. Be careful how you interpret the results: 
# Kmeans clustering will arbitrarily number the clusters, so you cannot simply check 
# whether the true class labels and clustering labels are the same.
res = kmeans(X, centers = 3)
true_class = c(rep(1,20), rep(2,20), rep(3,20))
table(res$cluster, true_class)
# They are all precisely clustered

# (c) Perform K-means clustering with K = 2. Describe your results.
res = kmeans(X, centers = 2)
true = c(rep(1,20), rep(2,20), rep(3,20))
table(res$cluster, true_class)
# An incorrect class is assigned to the middle class. The classification of the extreme classes is accurate.

# (d) Now perform K-means clustering with K = 4, and describe your results.
res = kmeans(X, centers = 4)
true = c(rep(1,20), rep(2,20), rep(3,20))
table(res$cluster, true_class)
# Two classes have been created out of one class.

