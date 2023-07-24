# Lab 5
# L7+L8
# Meher Shrishti Nigam
# CSE AI + Robotics
# 20BRS1193

# FDA Lab Experiment-5(9/9/2022)

# Q1. Create a data frame for the sports day events as shown in Table 1. It records the points
# scored by three teams namely â Orange, Yellow and Blue Teams in various sports day events. 
sport <- c("Football", "Cricket", "Throw Ball", "Badminton", "Track and Field")
orange <- c(50, 25, 19, 30, 23)
yellow <- c(0, 20, 25, 43, 21)
blue <- c(20, 45, 26, 21, 0)
sports_teams <- data.frame(orange, yellow, blue)
row.names(sports_teams) <- sport
sports_teams

# a) Include a new team âGreenâ with the score (10,10,30,30,40) 

sports_teams$green <- c(10, 10, 30, 30, 40)

# b)  Display the scores of Football and Throw ball events.

selection <- c("Football", "Throw Ball")
sports_teams[selection,]

selection <- c(1, 3)
sports_teams[selection,]

# c) Find the total points scored by each team and bind the total score with the data set.

# t<-colSums(match[,2:5])
total_points <- colSums(sports_teams)
total <- c(total_points)
sports_teams <- rbind(sports_teams, total)
sport <- c(sport, "Total Points")
row.names(sports_teams) <- sport
View(sports_teams)
sports_teams

# d) Display the name of the winning team.

which.max(sports_teams[c("Total Points"),])

# e) Find the least points scored by Orange Team and Blue Team.

min(sports_teams$orange)
min(sports_teams$blue)

# f) Display the favourable game of Yellow Team and Green Team.

max(sports_teams$orange)
max(sports_teams$blue)

# g) Display the average score of each event with the corresponding sports name.
 
average_points <- rowMeans(sports_teams)
sports_teams$average <- average_points
sports_teams


# Q2. Assume that a Fall semester registration report contains various fields such as registration no.,
# name of the student, course code, course name, credits, faculty name and slot.

# A) Identify a suitable data structure to store the names of the courses offered in the Fall semester
# and justify your choice.
# We use a vector to store the names of courses


# B) Write an R code to do the following

# i) Create the identified data structure with a sample set of courses.
course_name <- c("C++", "Python", "Java", "OOPS", "R", "HTML/CSS", "JavaScript")

# ii) Extract the course names in the data structure stored at locations 2, 5 and 7.
course_name[c(2,5,7)]

# iii) Extract all the course names except at locations 1, 2 and 3.
selection <- 4:7
course_name[selection]

# C) Suggest a suitable data structure to store the values of all fields for a 
# student and justify your choice.

# We use a data frame as our data set has varied datatypes and contains necessary fields

# D) Write an R code to do the following: [4 marks]

# I) Create the identified data structure with a sample values.
reg_no <- c("101","102","103","104","105","106","107")
names <- c("John", "Jake", "Jackson", "Jeff", "James", "Jessie", "Jack")
course_code <- c("CSE101","CSE102","CSE103","CSE104","CSE105","CSE106","CSE107")
course_name <- c("C++", "Python", "Java", "OOPS", "R", "HTML/CSS", "JavaScript")
credits <- c(4,2,3,3,4,3,2)
faculty_name <- c("Dr. Samuel", "Dr. Sandrah", "Dr. Sanjay", "Dr. Shashwat", "Dr. Sean", "Dr. Sebastien", "Dr. Saif")
slot <- c("L33 + 34", "L11 + 12", "A2 + TA2", "B1", "C2", "E1 + TE1", "F2")

registration_report <- data.frame(reg_no, names, course_code, course_name, credits, faculty_name, slot)
registration_report

# II) Assign names to all the values stored in the data structure.
rownames <- c("Student 1", "Student 2", "Student 3", "Student 4", "Student 5", "Student 6", "Student 7")
row.names(registration_report) <- rownames
# Columns are already named

# III) Extract the name of the student, course name, credits and slot in any 2 ways. 

registration_report[c("names", "course_name", "credits", "slot")]

subset(registration_report, select = c("names", "course_name", "credits", "slot"))

# Q3) Write a R code snippet to do the following
# i) Create the above Matrix and display the matrix

stars <- matrix(c("Satchin", "Virat", "Rohit", "Dhoni","Amitab","Amir","Akhya","Salman","Modi","Amit","Rahul","Neheru","Delhi","Chennai","Kolkata","Mumbai"), nrow = 4)
stars

# ii) Define the column names as Players, Actors, Politicians, Metro city
column_names <- c("Players", "Actors", "Politicians", "Metro Cities")
colnames(stars) <- column_names
stars

# iii) Define the row names as Record1, Record2, Record3, Record4
row_names <- c("Record1", "Record2", "Record3", "Record4")
rownames(stars) <- row_names
stars

# iv) Display only the names of cricket players and Politicians
stars[,c("Players", "Politicians")]

# v) Display the records that contain Kolkata and Mumbai 
stars[c(3,4),]

# Q4. As a data analyst, you have been asked to retrieve the following information from the given 
#string 8/08/2022. Write an R code snippet to do the following (5x1=5 Marks)

#i) Display the given string in date format 
date <- "08/08/2022"
date <- as.Date(date, format ="%d/%m/%Y")
date

#ii) As a data analyst extract from the date object, the day number in that year, for example, 
#8/25/2022 is 237th day in this year. 
day_no <- format(date, format = "%j")
day_no

#iii) As a data analyst extract from the date object, the month number in that year. For example, 
#08/25/2022 has the month number 08. 
month <- format(date, format = "%m")
month

#iv) Convert the following dates which are in string format to date format 
#12/11/2010, 13/12/1990,30/1/2001 and 15/08/2022 and display the dates on the 
#console. 
date1 <- "12/11/2010"
date1 <- as.Date(date1, format ="%d/%m/%Y")
date1

date2 <- "13/12/1990"
date2 <- as.Date(date2, format ="%d/%m/%Y")
date2

date3 <- "30/1/2001"
date3 <- as.Date(date3, format ="%d/%m/%Y")
date3

date4 <- "15/08/2022"
date4 <- as.Date(date3, format ="%d/%m/%Y")
date4



#v) Extract two dates 30/01/2001 and 12/11/2010 from the above created object and 
#calculate the difference between the given dates in terms of days and months and display 
#the results.

daysdiff <- difftime(date3, date1, units="days")
daysdiff

monthsdiff <- as.numeric(daysdiff/30, units="days")
monthsdiff
