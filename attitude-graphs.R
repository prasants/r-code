#Prasant Sudhakaran

#Plotting all the columns of the 'attitude' data set in R

library(ggplot2)
library(reshape2)

#Scatterplot
ggplot(data = melt(attitude), aes(x=variable, y=value)) + geom_jitter(aes(colour=variable)) + geom_smooth(method="lm", se=FALSE)


#Boxplot
ggplot(melt(attitude), aes(x = variable, y = value)) + geom_boxplot() 

#Histogram
ggplot(attitudeM,aes(x=value)) + geom_histogram() + facet_wrap(~variable)