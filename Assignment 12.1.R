library(readr)
require(Amelia)
library(Rcpp)
datacrime<-read.csv("C:/Users/aruna/Desktop/Assignments/home work acadgild/COBRA-2019.csv")
library(Rcpp)
data<-datacrime
data[4:10,3]<-rep(NA,7)
help(rep)
data[1:5,4]<-NA
data<-data[-c(5,6)]
summary(data)
str(datacrime)
library(car)
fit<-lm(Beat~UCR..+Location.Type+Neighborhood+Longitude+Latitude,data=datacrime)
fit
summary(fit)
vif(fit)
vif(fit)>5
#Find out top 3 reasons for having more crime in a city. Which all attributes have correlation with crime rate?
library(ggplot2)
fit$dayofWeek <- weekdays(as.Date(fit$Possible.Date))
fit$hour<-sub(":.*", "", fit$Occur.Time)
fit$hour <- as.numeric(fit$hour) 
library(ggplot2)
library(dplyr)
library(magrittr)
ggplot(aes(x =hour), data = fit) + geom_histogram(bins = 24, color='white', fill='black') + ggtitle('Histogram of Crime Time') 
topCrimes_1 <- topCrimes %>% group_by(UCR.Literal,occur_time) %>% summarise(total = n())
  