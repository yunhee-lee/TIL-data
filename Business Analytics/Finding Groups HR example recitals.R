rm(list = ls(all = TRUE))

# read dataset
data = read.table("~/Work/TIL-data/Business Analytics/Sample Data/DATA_2.02_HR.csv", header = T, sep = ',') 

str(data)
# S = satisfaction level on scale of 0 to 1
# LPE = lst project evaluation
# NP = number of projects worked on
# ANH = average number of hours worked in the last 12 month
# TIC = time spent in the company in years
# Newborn = 1 if the employee had a new born in last 12 month
summary(data)

testdata = data
testdata = scale(testdata) 

d = dist(testdata, method = "euclidean")
hcward = hclust(d, method = "ward.D")

data$groups = cutree(hcward, k = 4)

aggdata = aggregate(.~ groups, data = data, FUN = mean)

proptemp = aggregate(S ~ groups, data=data, FUN=length)  # Compute the number of observations per group
aggdata$proportion = (proptemp$S)/sum(proptemp$S) # Compute the proportion
aggdata = aggdata[order(aggdata$proportion, decreasing = T),] # Let's order the groups from the larger to the smaller

library(dplyr)
aggdata$groups <- recode(
  aggdata$groups,
  '1' = "Low Perf.",
  '2' = "Burned OUt",
  '3' = "High Potential",
  '4' = "Misc"
)
aggdata