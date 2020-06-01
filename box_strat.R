#generates random normal-distributed sequences
rnorm(n=100,mean=3,sd=1)

#data
data<-data.frame(Stat11=rnorm(100,mean=3,sd=2),
                 Stat21=rnorm(100,mean=4,sd=1),
                 Stat31=rnorm(100,mean=6,sd=0.5),
                 Stat41=rnorm(100,mean=10,sd=0.5),
                 Stat12=rnorm(100,mean=4,sd=2),
                 Stat22=rnorm(100,mean=4.5,sd=2),
                 Stat32=rnorm(100,mean=7,sd=0.5),
                 Stat42=rnorm(100,mean=8,sd=3),
                 Stat13=rnorm(100,mean=6,sd=0.5),
                 Stat23=rnorm(100,mean=5,sd=3),
                 Stat33=rnorm(100,mean=8,sd=0.2),
                 Stat43=rnorm(100,mean=4,sd=4))

boxplot(data)

boxplot(data, las = 2, names = c("Station 1","Station 2","Station 3","Station 4","Station 1","Station 2","Station 3","Station 4","Station 1","Station 2","Station 3","Station 4"))


#If the names are too long and they do not fit into the plot's window you can increase it by using the option par:
  boxplot(data, las = 2, par(mar = c(12, 5, 4, 2)+ 0.1), names = c("Station 1","Station 2","Station 3","Station 4","Station 1","Station 2","Station 3","Station 4","Station 1","Station 2","Station 3","Station 4"))

#Now I want to group the 4 stations so that the division in 3 successive days is clearer. To do that I can use the option at, which let me specify the position, along the X axis, of each box-plot:
  boxplot(data, las = 2, at =c(1,2,3,4, 6,7,8,9, 11,12,13,14), par(mar = c(12, 5, 4, 2) + 0.1), names = c("Station 1","Station 2","Station 3","Station 4","Station 1","Station 2","Station 3","Station 4","Station 1","Station 2","Station 3","Station 4"))

  boxplot(data, las = 2, col = c("red","sienna","palevioletred1","royalblue2","red","sienna","palevioletred1", 
                                  "royalblue2","red","sienna","palevioletred1","royalblue2"),
          at = c(1,2,3,4, 6,7,8,9, 11,12,13,14), par(mar = c(12, 5, 4, 2) + 0.1), 
          names = c("Station 1","Station 2","Station 3","Station 4","Station 1","Station 2","Station 3","Station 4","Station 1","Station 2","Station 3","Station 4"))  

  boxplot(data, ylab ="Oxigen (%)", xlab ="Time", las = 2, col = c("red","sienna","palevioletred1","royalblue2","red","sienna","palevioletred1","royalblue2","red","sienna","palevioletred1","royalblue2"),at = c(1,2,3,4, 6,7,8,9, 11,12,13,14), par(mar = c(12, 5, 4, 2) + 0.1), names = c("Station 1","Station 2","Station 3","Station 4","Station 1","Station 2","Station 3","Station 4","Station 1","Station 2","Station 3","Station 4"))
  

  # Create data for the graph.
  v <- c(9,13,21,8,36,22,12,41,31,33,19)
  
  # Create the histogram.
  hist(v,xlab = "Weight",col = "green",border = "red", xlim = c(0,40), ylim = c(0,5),
       breaks = 5)
  
  chol <- read.table(url("http://assets.datacamp.com/blog_assets/chol.txt"), header = TRUE)
  
  hist(AirPassengers)