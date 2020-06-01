library(arules) 
data("AdultUCI")
class(AdultUCI )
head(AdultUCI)
AdultUCI[["fnlwgt"]]=NULL
AdultUCI[["education-num"]]=NULL
AdultUCI[["age"]]=ordered(cut(AdultUCI[["age"]],c(15,25,45,65,100)),labels=c("young","middleaged","senior","old"))
AdultUCI[["hours-per-week"]]=ordered(cut(AdultUCI[["hours-per-week"]],c(0,25,40,60,168)),labels=c("part -time","full time","overtime","workaholic"))
AdultUCI[["capital-gain"]]=ordered(cut(AdultUCI[["capital-gain"]],c(-Inf,0,median(AdultUCI[["capital-gain"]][AdultUCI[["capital-gain"]]>0]),Inf)),labels=c("none","low","high"))
AdultUCI[["capital-loss"]]=ordered(cut(AdultUCI[["capital-loss"]],c(-Inf,0,median(AdultUCI[["capital-loss"]][AdultUCI[["capital-loss"]]>0]),Inf)),labels=c("none","low","high"))
Adult=as(AdultUCI,"transactions")
class(Adult)
summary (Adult)
adultdf=as(Adult,"data.frame")
head(adultdf,2)
rules1=apriori(Adult,parameter = list(sup=0.5,conf=0.9,target="rules"))
rules1
inspect(head(sort(rules1,by="lift"),52))
