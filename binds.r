library(dplyr)
#Create two data frames
df1 = data.frame(name = c("Rahul","joe","Adam","Brendon"), married_year = c(2016,2015,2016,2008))
df2 = data.frame(Birth_place = c("Delhi","Seattle","London","Moscow"), Birth_year = c(1988,1990,1989,1984))

# cbind in R: column binds the data frames.
cbinded_df<-cbind(df1,df2)
cbinded_df

df3=read.table(file.choose(),header = "TRUE", sep = ",")
df4 = data.frame(average_cost = c(120,345,321))

cbinded_df<-cbind(df3,df4)
cbinded_df


rdf1 = data.frame(CustomerId = c(1:6), Product = c(rep("Oven", 3), rep("Television", 3)))
rdf2 = data.frame(CustomerId = c(4:7), Product = c(rep("Television", 2), rep("Air conditioner", 2)))

rbinded_df<-rbind(rdf1,rdf2)
rbinded_df

StudentData=read.csv(file.choose(),header = TRUE)
attach(StudentData)
StudentData.sub<-subset(StudentData, gender=="female")
head(StudentData.sub)

eligible.students<-subset(StudentData, reading.score>75 | writing.score>75)
head(eligible.students)
