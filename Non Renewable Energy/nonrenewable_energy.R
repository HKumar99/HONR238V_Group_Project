#Nonrenewable Energy R file.
#Setup
setwd("F:/HONR238V Group Project/nonrenewable_energy_usage") #Home folder
#install.packages("dplyr") #Install once
library(dplyr)

#Crude Oil
setwd("./Crude Oil") #Descend into the crude Oil directory
crude_oil <- read.csv('Source 4.csv', header = TRUE, sep=";")

setwd("..") #Ascend upwards into the home directory


#Coal
setwd("./Coal") #Descend into the crude Oil directory
coal <- read.csv('Source 2.csv', header = TRUE, sep=";")

setwd("..") #Ascend upwards into the home directory


#Natural Gas
setwd("./Natural Gas") #Descend into the crude Oil directory
natural_gas <- read.csv('Source 1.csv', header = TRUE, sep=";")

setwd("..") #Ascend upwards into the home directory


#Nuclear
setwd("./Nuclear/") #Descend into the crude Oil directory
nuclear <- read.csv('Source 3.csv', header = TRUE, sep=";")

setwd("..") #Ascend upwards into the home directory



#Data Analysis

