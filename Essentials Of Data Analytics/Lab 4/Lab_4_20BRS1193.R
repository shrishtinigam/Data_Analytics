# Meher Shrishti Nigam
# 20BRS1193
# EDA Lab 4
options(prompt="MEHERSHRISHTI>", continue =" ")
# options(prompt=">", continue =" ")
# EDA-LAB-EXPERIMENT-4 (Date-20/1/2023) 

# A group of twelve children participated in a psychological study
# designed to assess the relationship, if any, between age, x years 
# and average total sleep time (ATST), y minutes. 
# To obtain a measure for ATST, recordings were taken on each child
# on five consecitive nights and then averaged. The results obtained
# are shown in the table.

# Calculate the value of the product moment correlation coefficient
# between x and y. Assess the statistical significance of your value
# and interpret your results.


df <- data.frame(age = c(4.4, 6.7, 10.5, 9.6, 12.4, 5.5, 11.1, 8.6, 14.0, 10.1, 7.2, 7.9), atst = c(586, 565, 515, 532, 478, 560, 493, 533, 575, 490, 530, 515))


# Using library functions
cor(df$age, df$atst)

# Using user defined functions
pmcc <- function(x, y, n){
  x_mean <- mean(x)
  y_mean <- mean(y)
  #print(x_mean)
  #print(y_mean)
  sum_x_sqr <- sum(x*x)
  sum_y_sqr <- sum(y*y)
  #print(sum_x_sqr)
  #print(sum_y_sqr)
  xy <- x*y
  #print(xy)
  sum_xy <- sum(xy)
  #print(sum_xy)
  sxy <- (sum_xy / n) - (x_mean * y_mean)
  #print(sxy)
  sx <- sqrt(((sum_x_sqr/n) - (x_mean*x_mean)))
  sy <- sqrt(((sum_y_sqr/n) - (y_mean*y_mean)))
  #print(sx)
  #print(sy)
  return (sxy / (sx*sy))
}

pmcc(df$age, df$atst, 12)

