# Lab 7
# L7+L8
# Meher Shrishti Nigam
# CSE AI + Robotics
# 20BRS1193

# Exp-7 Statistical Analysis of quantitative data
library("MASS")
newsurvey <- survey[rowSums(is.na(survey)) <= 0,]
# newsurvey

#1. Find the range of students age participated in the survey.
age_range <- array(range(newsurvey$Age))
age_range


#2. Break the age range into non-overlapping sub-intervals by defining a sequence of
#equal distance break points of 10 by rounding the range to nearest integer.
ll <- floor(seq(age_range[1], age_range[2], by=10))
ul <- floor(seq(age_range[1]+10, age_range[2]+10, by=10))
sub_intervals <- data.frame(ll, ul)
sub_intervals
# OR
age_range <- floor(age_range)
age_range
age_range_sub_intervals <- cut(newsurvey$Age, seq(age_range[1], age_range[2]+10, by=10), right=FALSE)
age_range_sub_intervals

#3. Find the distribution of the age range according to the sub-intervals with cut with its
#right boundary opened. Display it in column form.

age_range_sub_intervals_freq <- table(age_range_sub_intervals)
age_range_sub_intervals_freq
freq_age <- cbind(age_range_sub_intervals_freq)
freq_age 

#4. Which age range of students has mostly participated in the survey.
freq_age <- cbind(age_range_sub_intervals_freq)
which.max(age_range_sub_intervals_freq)

#5. Similarly, find the frequency distribution of Wr.Hnd span and display it in column
#format.
Wr.Hnd_range <- array(range(newsurvey$Wr.Hnd))
Wr.Hnd_range
Wr.Hnd_range <- floor(Wr.Hnd_range)
Wr.Hnd_range

Wr.Hnd_range_sub_intervals <- cut(newsurvey$Wr.Hnd, seq(Wr.Hnd_range[1], Wr.Hnd_range[2]+2, by=2), right=FALSE)
Wr.Hnd_range_sub_intervals

Wr.Hnd_range_sub_intervals_freq <- table(Wr.Hnd_range_sub_intervals)
Wr.Hnd_range_sub_intervals_freq

which.max(Wr.Hnd_range_sub_intervals_freq)

freq_Wr.Hnd <- cbind(Wr.Hnd_range_sub_intervals_freq)

freq_Wr.Hnd

#6. Find the relative frequency of Wr.Hnd and display it by correcting to 3 decimal
#places.
Wr.Hnd_range_sub_intervals_rel_freq <- Wr.Hnd_range_sub_intervals_freq/(length(Wr.Hnd_range_sub_intervals))
Wr.Hnd_range_sub_intervals_rel_freq
