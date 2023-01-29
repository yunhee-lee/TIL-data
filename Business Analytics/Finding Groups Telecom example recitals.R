rm(list = ls(all = TRUE))

# read dataset
data = read.table("~/Work/TIL-data/Business Analytics/Sample Data/DATA_2.03_Telco.csv", header = T, sep = ',') 

str(data)
summary(data)

testdata = data
testdata = scale(testdata)

d = dist(testdata, method = "euclidean")
hcward = hclust(d, method="ward.D")

data$groups <- cutree(hcward,k = 8)

aggdata = aggregate(. ~ groups, data = data, FUN = mean)
proptemp = aggregate(Calls ~ groups, data = data, FUN = length) # Computation of the number of observations by group
aggdata$proportion = (proptemp$Calls)/sum(proptemp$Calls) # Computation of the proportion by group
aggdata = aggdata[order(aggdata$proportion, decreasing=T),] # Ordering from the largest group to the smallest

data$groups= cutree(hcward,k = 5) #Create segments for k=5
aggdata = aggregate(. ~ groups, data = data, FUN = mean)
proptemp = aggregate(Calls ~ groups, data = data, FUN = length) 
aggdata$proportion = (proptemp$Calls)/sum(proptemp$Calls)
aggdata=aggdata[order(aggdata$proportion, decreasing=T),]

palette(rainbow(12, s = 0.6, v = 0.75)) # Select the colors to use
stars(aggdata[, 2:(ncol(data))], len = 0.6, key.loc = c(11, 6)
      , xlim=c(2,12), main = "Segments", draw.segments = TRUE
      , nrow = 2, cex = .75, labels=aggdata$groups)