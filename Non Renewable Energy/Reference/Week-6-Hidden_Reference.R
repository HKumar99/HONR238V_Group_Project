# this is only run once
# install.packages("dplyr")

# this is run every time you run script
library(dplyr)

# this is the command that came from RStudio use of:
# - Session (menu)
# - Set Working Directory
# - Choose Directory ...
setwd("/Volumes/GoogleDrive/My Drive/UMD/Courses/HONR238V/2019/Data/")

# example of loading downloaded data (zillow data)
stateTimeSeries <- read.csv("zecon/State_time_series.csv")
stateTimeSeries$Date <- as.Date(stateTimeSeries$Date)

# example of loading downloaded data (census data)
statePopTotals <- read.csv("census/state-population-totals.csv")

# this is using dplyr's select function
stateTimeSeriesSpecificColumns <- select(stateTimeSeries, Date, RegionName, DaysOnZillow_AllHomes, InventoryRaw_AllHomes, MedianListingPricePerSqft_AllHomes)

# this is using dplyr's inner_join function
joinedData <- inner_join(stateTimeSeriesSpecificColumns, statePopTotals, by = c("RegionName" = "STATE"))
# this is how we fix the warning message
stateTimeSeriesSpecificColumns$RegionName <- as.character(stateTimeSeriesSpecificColumns$RegionName)
statePopTotals$STATE <- as.character(statePopTotals$STATE)
joinedData <- inner_join(stateTimeSeriesSpecificColumns, statePopTotals, by = c("RegionName" = "STATE"))

# this is using dplyr's filter function
joinedDataFiltered <- filter(joinedData, Date>"2014-1-1" & Date<"2016-3-1")

# this is using dplyr's mutate function
joinedDataFilteredMutated <- mutate(joinedDataFiltered, DaysTimesInventory = DaysOnZillow_AllHomes * InventoryRaw_AllHomes)

# this is using dplyr's group_by function
joinedDataFilteredMutatedGrouped <- group_by(joinedDataFilteredMutated, RegionName)

# after grouping, you can summarise()
joinedDataFilteredMutatedGroupedSummarised <- joinedDataFilteredMutatedGrouped %>% summarise(
  meanDaysOnZillow_AllHomesGroupedByState  = mean(DaysOnZillow_AllHomes),
  meanInventoryRaw_AllHomesGroupedByState  = mean(InventoryRaw_AllHomes)
)

# using alternative syntax
joinedDataFilteredMutatedGroupedSummarised <- group_by(joinedDataFilteredMutated, RegionName) %>% summarise(
  meanDaysOnZillow_AllHomesGroupedByState  = mean(DaysOnZillow_AllHomes),
  meanInventoryRaw_AllHomesGroupedByState  = mean(InventoryRaw_AllHomes)
)
