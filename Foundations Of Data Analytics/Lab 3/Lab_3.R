# 1. Create vector 'class' to store the class names 'class1','class2',.,'class5'
class<-c("class1","class2","class3","class4","class5")
print(class)

# 2. Use assign() function to create a vector 'avg' to store the average marks.
assign("avg",c(89, 87, 67, 94, 85))
print(avg)

# 3. Display the average mark of class2.
x = cbind(class, avg)
data = data.frame(class, avg)
data
data$avg[which(data$class=="class2")]

# 4. Display all the average marks except class 2.
data$avg[which(data$class!="class2")]

# 5. Access the average mark of class4 by its name.
data$avg[which(data$class=="class4")]

# 6. Find the minimum average mark and print the class which scored it.
minAvgMark = min(data$avg)
minAvgMark
data$class[which(data$avg == minAvgMark)]

# 7. Find the maximum average mark and print the class which scored it.
maxAvgMark = max(data$avg)
maxAvgMark
data$class[which(data$avg == maxAvgMark)]

# 8. Find the total of average marks scored by all classes.
totalMarks = sum(data$avg)
totalMarks

# 9. Find the mean of the average marks scored by all classes.
avgMarks = mean(data$avg)
avgMarks

# 10. Find the standard deviation of the average marks scored by all classes.
sd(data$avg)

# 11. Arrange the average marks in ascending order.
sort(x=data$avg,decreasing=FALSE)

# 12. Create a vector classes by repeat the vector class twice.
classes = c(class,class)
classes

# 13. Create a vector marks by repeating each average mark twice.
marks = c(avg,avg)
marks


# 14. Create a vector 'report' by adding the vector 'avg' with a sequence of 10 to 1 and find 
# its length.
report = avg+seq(10:1)
report
length(report)

# 15. Identify the classes for which average marks>70
data$class[which(data$avg>70)]
