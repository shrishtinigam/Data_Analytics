# Meher Shrishti Nigam
# 20BRS1193
# EDA Lab 3
options(prompt="MEHERSHRISHTI>", continue =" ")
# options(prompt=">", continue =" ")
# EDA-LAB-EXPERIMENT-3 (Date-13/1/2023) 

# Larger animals tend to have larger brains. But is the increase in brain size proportional to
# the increase in body size? A set of data on body and brain size of 62 mammal species was
# collated by Allison and Cicchetti (1976), and these data are in the data set “mammals.csv”.
# The file contains columns giving the species name, the average body mass (in kg) and
# average brain size (in g) for each species.
df <- read.csv("/home/ex1/Desktop/20brs1193/mammals.csv")

# a. Plot brain size against body size. Is the relationship linear?
plot(df$body_mass_kg, df$brain_mass_g)
cor(df$body_mass_kg, df$brain_mass_g)
# They are correlated but their relationship is not linear.

# b. Find a transformation (for either or both variables) that makes the relationship
# between these two variables linear.
plot(log(df$body_mass_kg), log(df$brain_mass_g))
linear_model <- lm(log(df$body_mass_kg) ~ log(df$brain_mass_g), data = df)
summary(linear_model)

# c. Is there statistical evidence that brain size is correlated with body size? Assume that
# the species data are independent.
cor(df$body_mass_kg, df$brain_mass_g)

# Brain size and body size are correlated but their relationship is not linear.

# d. What line best predicts (transformed) brain size from (transformed) body size?
  
# e. Based on your answer in (d), what is the predicted change in log-brain size
# accompanying an increase of 3 units of log- body size?
  
# f. Make a residual plot using the regression fitted to the transformed variables. Do the
# data look like they match the assumptions of linear regression?
  
# g. Which species has the highest brain size relative to that predicted by its body size?
# Which species has the smallest brain relative to that predicted by its body size?
