# Meher Shrishti Nigam 20BRS1193
# F2
# LAB 10 – GGPLOT2
# 1. Install the package ggplot2 and import it.
rm(list=ls())
install.packages('ggplot2')
library(ggplot2)
library(MASS)
library(dplyr)
df <- na.omit(survey)
# 2. Plot a bar graph for the number of male and female participants in the survey. Provide
# the title as â€œMale and Female participantsâ€• and specify the colours for the bars.
ggplot(df, aes(x=Sex)) + geom_bar(fill=c("blue","red"), color = "#55FF66") + ggtitle("Male and Female 
Participants")
# 3. Plot a bar graph for the number of left handers and right handers in the survey.
# Provide the title as â€œLeft Handers and Right Handersâ€• and specify the colours for the
# bars.
ggplot(df, aes(x=W.Hnd)) + geom_bar(fill=c("blue","red"), color = "#55FF66") + ggtitle("Left Handers and Right 
Handers")
# 4. Plot the distribution between male left handers and female left handers using bar
# chart. Provide the title as â€œFemale Left Handers and Male Left Handersâ€• and specify
# the colours for the bars.
lefthanded <- data.frame((filter(df, W.Hnd == 'Left'))$Sex)
colnames(lefthanded) <- c("Sex")
ggplot(lefthanded, aes(x=Sex)) + geom_bar(fill=c("blue","red"), color = "#55FF66") + ggtitle("Female Left Handers 
and Male Left Handers")
# 5. Draw the distribution of smoking habits of male left handers based on age using pie
# chart.
male.left.handers <- table((filter(df, W.Hnd == 'Left', Sex == 'Male'))$Smoke)
male.left.handers <- data.frame(male.left.handers)
male.left.handers
colnames(male.left.handers) <- c("group" , "value")
ggplot(male.left.handers, aes(x="", y=value, fill=group)) +
 geom_bar(stat="identity", width=1) +
 coord_polar("y", start=0)
 theme_void() + 
 theme(legend.position="none") +
 scale_fill_brewer(palette="Set1")
# 6. Draw the histogram of age distribution with the title as "Age distribution" and xlabel
# as "Age range" and ylabel as "frequency".
ggplot(df,aes(x=Age))+geom_histogram()+labs(title='Age distribution', x="Age range", y='frequency')
# 7. Reveal the relationship between the age and writing hand span using scatter plot.
ggplot(data = df, mapping = aes(x = Age, y = Wr.Hnd)) + geom_point()
# 8. Plot the distribution of writing hand span vs. pulse rate of left handers. Provide colour
# based on gender and vary the size of the point based on height of the student.
left.handed <- data.frame(filter(df, W.Hnd == 'Left'))
left.handed
ggplot(data = df, mapping = aes(x = Wr.Hnd, y = Pulse)) + geom_point()
# 9. Plot the distribution of height of the students with filled colour based on gender with
# facet based on left and right handers.
ggplot(df,aes(x=Height,fill=Sex))+
 geom_histogram(bins=50)+
 facet_wrap(df$W.Hnd,ncol=1)+
 labs(title='distribution of height of the students based on gender',y='frequency')
# 10. Plot the trend of span of writing hand vs. non-writing hand coloured and grouped
# based on left and right handers with facet label based on clap.
ggplot(df,aes(x=Wr.Hnd,y=NW.Hnd))+
 geom_line(size=1.5)+geom_point(size=1.5,color='red')+
 facet_wrap(df$Clap,ncol=1)+
 labs(title='span of writing hand vs. non-writing hand')
# 11. Plot the distribution of age of students based on categories under exercise with facet
# wrap based on gender.
ggplot(df,aes(x=Age,fill=Exer))+
 geom_histogram(bins=50)+
 facet_wrap(df$Sex,ncol=1)+
 labs(title='age of students based on categories under exercise',y='frequency')
# 12. Plot the box plot of writing hand span with respect to smoking habits of students.
ggplot(df,aes(x=Wr.Hnd,y=Smoke))+geom_boxplot()
