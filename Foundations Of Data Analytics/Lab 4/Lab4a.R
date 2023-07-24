# Lab 3
# L7+L8
# Meher Shrishti Nigam
# CSE AI + Robotics
# 20BRS1193

# LAB 4 FDA Lab Experiment-4-a

# 1. Create a list to maintain the details of a student such as 
# registration number, name, no. of courses registered and marks in 
# each subject.
regno <- c("101", "102", "103")
names <- c("john", "mary", "steve")
courses <- c(3,3,3)
m1 <- c(78,89,98)
m2 <- c(87,99,92)
m3 <- c(88,70,94)

list1 <- list(regno = regno, names = names, courses = courses, m1 = m1, m2 = m2, m3 = m3)

# 2. Retrieve the name of the students.
list1$names

# 3. Extract only the registration number and the marks of the students.
list2 <- list(list1$regno, list1$m1, list1$m2, list1$m3)
list2
# 4. Access the mark in the first course registered.
list1$m1

# 5. Modify the mark entry in the last course as 5 more than the existing mark.
list1$m3
list1$m3 <- list1$m3 + 5
list1$m3


# Q. A college has conducted technical events for the students. 
# It maintains the name of the  participant and the score obtained 
# in different events.

# 1. Create a data frame by considering 5 students and 4 events. 
# Each event has a maximum score of 10. If a student participates in 
# an event, its entry contains the score value and 0 otherwise.

df <- data.frame(e1 = c(4,7,9,0,4), e2 = c(8,4,8,2,8), e3 = c(0,0,3,10,4), e4 = c(9,4,2,0,2))
names <- c("John", "Jake", "Harry", "Tom", "Joe")
row.names(df) <- names

# 2. View the contents of the data frame.
df

# 3. Find the total score of each participant.
rowSums(df)

# 4. Append a column to include the total score of the participants and view the data frame.
df$total <- rowSums(df)
df

# 5. Find the maximum score and display the name of the participant who scored it.
which.max(df$total)

# 6. Compute the average score of each events and append it as a new row in the data frame.
df[nrow(df) + 1,] <- c(colSums(df)/nrow(df))
names <- c("John", "Jake", "Harry", "Tom", "Joe", "Average")
row.names(df) <- names
df

# 7. Store the details in a comma separated values (csv) file. Also suppress the row numbers.
write.csv(df, "events.csv", row.names = FALSE)

# 8. Read the content of ‘Events.csv’ in a data frame and view it.
df1 = read.csv("events.csv")

# 9. Access the scores of participants in event2 using the column name.
df1$e2

# 10. Use index number to retrieve the same data.
df1[[2]]

# 11. Extract the score of third participant in event3.
df1
df1$e3[3]

# 12. Extract the scores of the first and second participant in all the events.
df[c(1,2),]
df[1:2,]

# 13. Display the names and total scores of all participants.
df[,"total", drop=FALSE]

# 14. Make the column a name as the row index of the data frame.
names <- c("John", "Harry", "Jake", "Tom", "Joe", "Average")
row.names(df) <- names
df

# 15. Display the names of the students participated in event3.
e3students <- subset(df, e3>0)
row.names(e3students)

# 16. Obtain the names whose total score is above its average.
winners <- subset(df, total > df[6,5])
row.names(winners)






