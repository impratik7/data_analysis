library(tidyverse) # metapackage with lots of helpful functions
library(dplyr)
library(ggplot2)

data <- read.csv(file.choose(),header=TRUE)
head(data)
tail(data)


#First, we must count the groups and start to analyze this. Group numbers may differ and could manuplate our results. That's why, the avarages could help us to analyze better.

data %>%
  group_by(race.ethnicity) %>%
  summarise(mathMean = mean(math.score),readingMean =  mean(reading.score),writingMean = mean(writing.score)) %>%
  ggplot(data = ., aes(x = race.ethnicity, y = mathMean, 
                       fill = race.ethnicity)) + geom_bar(stat = "identity")

total <- table(data$race.ethnicity)
plot(table(data$race.ethnicity))

x1 <- data %>% 
  group_by(race.ethnicity) %>%
  filter(math.score > 80) 
table(x1$race.ethnicity)
x1 %>% ggplot() + geom_bar(aes(x1$race.ethnicity,fill = x1$race.ethnicity))

num1 <- table(x1$race.ethnicity)
general1 <- data.frame(num1/total)
plot(general1)

x2 <- data %>% 
  group_by(race.ethnicity) %>%
  select(math.score,reading.score,writing.score) %>%
  filter(reading.score > 80) 
x2 %>% ggplot() + geom_bar(aes(x2$race.ethnicity,fill = x2$race.ethnicity))

num2 <- table(x2$race.ethnicity)
general2 <- data.frame(num2/total)
plot(general2)

x3 <- data %>% 
  group_by(race.ethnicity) %>%
  select(math.score,reading.score,writing.score) %>%
  filter(writing.score > 80) 
x3 %>% ggplot() + geom_bar(aes(x3$race.ethnicity,fill = x3$race.ethnicity))

num3 <- table(x3$race.ethnicity)
general3 <- data.frame(num3/total)
plot(general3)






totalGender <- table(data$gender)
plot(table(data$gender))
totalGender

data %>% 
  group_by(gender) %>%
  select(math.score,reading.score,writing.score) %>%
  filter(math.score > 80, reading.score > 80, writing.score > 80) %>%
  ggplot(data = ., aes(x = gender, y = math.score, 
                       fill = gender)) + geom_bar(stat = "identity")

data %>% 
  group_by(gender) %>%
  select(math.score,reading.score,writing.score) %>%
  filter(math.score > 80, reading.score > 80, writing.score > 80) %>%
  ggplot(data = ., aes(x = gender, y = reading.score, 
                       fill = gender)) + geom_bar(stat = "identity")

data %>% 
  group_by(gender) %>%
  select(math.score,reading.score,writing.score) %>%
  filter(math.score > 80, reading.score > 80, writing.score > 80) %>%
  ggplot(data = ., aes(x = gender, y = writing.score, 
                       fill = gender)) + geom_bar(stat = "identity")

totalLevel <- table(data$parental.level.of.education)
plot(table(data$parental.level.of.education))
totalLevel

level1 <- data %>% 
  group_by(parental.level.of.education) %>%
  summarise(mathTotal = sum(math.score))

level1 %>% ggplot(data = ., aes(x = parental.level.of.education, y = mathTotal, 
                                fill = parental.level.of.education)) + geom_bar(stat = "identity") + 
  labs(title="Education Level Chart",
       subtitle="Reading Scores") +
  theme(axis.text.x = element_text(angle=65, vjust=0.6))


#pie chart represnation

generalLevel = data.frame(level1$mathTotal / totalLevel)
lbls <- generalLevel1$Var1
pct <- round(generalLevel$Freq/sum(generalLevel$Freq)*100)
lbls <- paste(lbls, pct) # add percents to labels 
lbls <- paste(lbls,"%",sep="") # ad % to labels 
pie(generalLevel$Freq,labels = lbls, col=rainbow(length(lbls)),
    main="Pie Chart of Mathematical Education Level")

level2 <- data %>% 
  group_by(parental.level.of.education) %>%
  summarise(readingTotal =  sum(reading.score))
level2 %>%
  ggplot(data = ., aes(x = parental.level.of.education, y = readingTotal, 
                       fill = parental.level.of.education)) + geom_bar(stat = "identity") + 
  labs(title="Education Level Chart",
       subtitle="Reading Scores") +
  theme(axis.text.x = element_text(angle=65, vjust=0.6))
level2

generalLevel2 = data.frame(level2$readingTotal / totalLevel)
lbls <- generalLevel2$Var1
pct <- round(generalLevel2$Freq/sum(generalLevel2$Freq)*100)
lbls <- paste(lbls, pct) # add percents to labels 
lbls <- paste(lbls,"%",sep="") # ad % to labels 
pie(generalLevel2$Freq,labels = lbls, col=rainbow(length(lbls)),
    main="Pie Chart of Reading Education Level")


#pie3d function
library(plotrix)

pie3D(generalLevel2$Freq,labels = lbls, col=rainbow(length(lbls)),
    main="Pie Chart of Reading Education Level",labelpos=lp,explode=0.2)


pieval<-c(2,4,6,8)
pielabels<-
  c("We hate\n pies","We oppose\n  pies","We don't\n  care","We just love pies")
# grab the radial positions of the labels
lp<-pie3D(pieval,radius=0.9,labels=pielabels,explode=0.1,main="3D PIE OPINIONS")
# lengthen the last label and move it to the left
pielabels[4]<-"We cannot survive without our pies"
lp[4]<-4.8
# specify some new colors
pie3D(pieval,radius=0.9,labels=pielabels,explode=0.1,main="3D PIE OPINIONS",
      col=c("brown","#ddaa00","pink","#dd00dd"),labelpos=lp)
# }