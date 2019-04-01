# this is the command that came from RStudio use of:
# - Session (menu)
# - Set Working Directory
# - Choose Directory ...
setwd("/Volumes/GoogleDrive/My Drive/UMD/Courses/HONR238V/2019/Data/zecon")

# example of loading downloaded data
# it might be better to open this file in Excel
dataDictionary <- read.csv("DataDictionary.csv")

# example of loading downloaded data
stateTimeSeries <- read.csv("State_time_series.csv")

# let's take a look at how R read this data in for us
str(stateTimeSeries)

# one way to convert to a Date
stateTimeSeries$Date <- as.Date(stateTimeSeries$Date)
str(stateTimeSeries)

# one way to filter for records that are not NA for DaysOnZillow_AllHomes
stateTimeSeriesFiltered <- subset(stateTimeSeries, !is.na(DaysOnZillow_AllHomes))

# one way to filter for records that are not NA for DaysOnZillow_AllHomes
stateTimeSeriesFiltered <- subset(stateTimeSeries, Date >= "2010-01-31")

# note that these approaches produce very different results!
# South Dakota is an issue!

stateTimeSeriesFiltered <- subset(stateTimeSeries, Date>"2014-1-1" & Date<"2016-3-1" & RegionName=="California")

plot(stateTimeSeriesFiltered$Date, stateTimeSeriesFiltered$DaysOnZillow_AllHome)
plot(stateTimeSeriesFiltered$Date, stateTimeSeriesFiltered$InventoryRaw_AllHomes)

# this is only run once
install.packages("dplyr")

# this is run every time you run script
library(dplyr)

# this is using dplyr's select function
stateTimeSeriesFilteredSpecificColumns <- select(stateTimeSeriesFiltered, Date, RegionName, DaysOnZillow_AllHomes, InventoryRaw_AllHomes)
