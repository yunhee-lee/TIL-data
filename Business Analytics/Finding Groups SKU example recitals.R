# read dataset
data = read.table("~/Work/TIL-data/Business Analytics/Sample Data/DATA_2.01_SKU.csv", header = T, sep = ',') 

# have a look at variables and see some summary statistics
# The str() function shows the structure of your dataset and details the type of variables that it contains
str(data) 
# ADS = average daily source
# CV = coefficient variations
# The summary() function provides for each variable in your dataset the minimum, mean, maximum and quartiles
summary(data)

# plot data to see if we can identify groups visually 
plot(data$CV, data$ADS, main = "SKU Example", ylab="Average Daily Sales", xlab= "Coefficient of Variation")
abline(v = 0.2, col = "red")
abline(h = 4, col = "red")
text(0.15,9.7, "Horses", col = "red") # we can add some text to our plot by using the text() function, here to label the group "Horses"
text(0.65,9.7, "Wild Bulls", col = "red") # and group "Wild Bulls"
text(0.8,2, "Crickets", col = "red") # and group "Crickets"

# find groups using hierarchical clustering and check if we obtain similar results
testdata = data  # To keep dataset safe
testdata = scale(testdata) # used to standardize variables by subtracting the mean and dividing by the standard deviation
# this results in all variables having a mean of 0
# this can be useful when comparing variables with different units or scales

d = dist(testdata, method = "euclidean") # the dist() function computes the distances of all the observations in our dataset
hcward = hclust(d, method="ward.D") # hclust() function performs hierarchical clustering, we pass it the distances, and we set the method argument to "ward.D"

data$groups <- cutree(hcward,k=3) # assign our points to our k=3 clusters 

library(lattice)
xyplot(ADS~ CV, main = "After Clustering", type="p", group = groups, data = data, # define the groups to be differentiated 
       auto.key = list(title = "Group", space = "left", cex = 1.0, just = 0.95), # to produce the legend we use the auto.key= list() 
       par.settings = list(superpose.line=list(pch = 0:18, cex = 1)), # the par.settings argument allows us to pass a list of display settings
       col=c('blue','green','red')) # finally we choose the color of our plotted points per group

library(ggplot2)
ggplot(data = data, aes(x = CV, y = ADS)) +
  geom_point(aes(shape = as.factor(groups), color = as.factor(groups)))