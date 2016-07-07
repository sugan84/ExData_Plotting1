setwd("C:/R programming/Coursera/Exploratory Analysis/Project 1")

importedSet <- "./household_power_consumption.txt"

sample <- read.table(importedSet, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 
subSet <- sample[sample$Date %in% c("1/2/2007","2/2/2007") ,]

head(subSet)
str(subSet) 

globalActivePower <- as.numeric(subSet$Global_active_power) 
png("plot1.png", width=480, height=480) 
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)") 
dev.off() 
