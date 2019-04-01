data1<-read.csv("atlantic.csv")
data2<-read.csv("pacific.csv")
data<-rbind(data1,data2)
library(ggplot2)
library(dplyr)
library(gapminder)
library(stringr)
library(lubridate)
data$Date<-as.Date(as.character(data$Date),  format = "%Y%m%d")
ggplot(data,aes(year(Date)))+
geom_histogram(bins=30) + 
ggtitle("US Extreme Weather Events by Year") +
xlab("Year") + 
ylab("Number of Events")
x11()
TS<-data%>%filter(Status==' TS')
ggplot(TS,aes(year(Date)))+
geom_histogram(bins=30) + 
ggtitle("US Tropical Storm Events by Year") +
xlab("Year") + 
ylab("Number of Events")
x11()
HU<-data%>%filter(Status==' HU')
ggplot(HU,aes(year(Date)))+
geom_histogram(bins=30) + 
ggtitle("US Hurricane Events by Year") +
xlab("Year") + 
ylab("Number of Events")
x11()
TD<-data%>%filter(Status==' TD')
ggplot(TD,aes(year(Date)))+
geom_histogram(bins=30) + 
ggtitle("US Tropical Depression Events by Year") +
xlab("Year") + 
ylab("Number of Events")

