data1=read.csv(file.choose(),header=T,sep=",")
data1
usefuldata=na.omit(data1)
summary(usefuldata)
usefuldata=data.matrix(usefuldata)
usefuldata=scale(usefuldata)
library(fpc)
clusters=pamk(usefuldata)
?pamk
library(fpc)
clusters<-pamk(usefuldata)
n=clusters$nc
n
fit=kmeans(usefuldata,n)
table(fit$cluster)
aggregate(usefuldata,by=list(fit$cluster),FUN=mean)
plotcluster(usefuldata,fit$cluster)
library(cluster)
clusplot(usefuldata,fit$cluster,color=T,shade=T,labels=1,lines=0)