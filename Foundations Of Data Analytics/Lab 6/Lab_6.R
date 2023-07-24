# Lab 6
# L7+L8
# Meher Shrishti Nigam
# CSE AI + Robotics
# 20BRS1193

# LAB 6 Statistical Analysis of Qualitative Data


# 1. Import the pacakge MASS
library(MASS);
data(survey);
survey

# 2. List the rows of data that has missing values
new_DF <- survey[rowSums(is.na(survey)) > 0,]
new_DF

# 3. Create a data frame 'newsurvey' that contains the survey data after removing the na values. Use it for answering further queries
newsurvey <- survey[rowSums(is.na(survey)) <= 0,]
newsurvey

# 4. How many male and female students participated in the survey?
sum(newsurvey$Sex=='Female')
sum(newsurvey$Sex=='Male')

# 5. How many left and right handers are there?
sum(newsurvey$W.Hnd=='Left')
sum(newsurvey$W.Hnd=='Right')

# 6. Find the relative frequency distribution of left and right handers and display them with the precision of two decimal places. 
rfd_handedness <- round(table(newsurvey$W.Hnd)/length(newsurvey$W.Hnd), 2)
rfd_handedness

# 7. Display the male left hander and female left hander in the column format
install.packages("dplyr")
newsurvey <- data.frame(newsurvey)
newsurvey
library(dplyr)
filter(newsurvey, Sex == 'Male', W.Hnd == 'Left')
filter(newsurvey, Sex == 'Female', W.Hnd == 'Left')

# 8. What percentage of male left handers never smokes?
Male_Left_SmokeYes <- filter(newsurvey, Sex == 'Male', W.Hnd == 'Left', Smoke != 'Never')
Male_Left_SmokeNo <- filter(newsurvey, Sex == 'Male', W.Hnd == 'Left', Smoke == 'Never')

Male_Left_SmokeYes
Male_Left_SmokeNo

RequiredPercentage <- (nrow(Male_Left_SmokeNo) / (nrow(Male_Left_SmokeNo) + nrow(Male_Left_SmokeYes))) * 100
RequiredPercentage
