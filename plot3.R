setwd("C:/R programming/Coursera/Exploratory Analysis/Project 1")
importedSet <- "./household_power_consumption.txt"
sample <- read.table(importedSet, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")  
subSet <- sample[sample$Date %in% c("1/2/2007","2/2/2007") ,]

head(subSet)
str(subSet) 

date_time <- strptime(paste(subSet$Date, subSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S")  
globalActivePower <- as.numeric(subSet$Global_active_power) 
subMetering1 <- as.numeric(subSet$Sub_metering_1) 
subMetering2 <- as.numeric(subSet$Sub_metering_2) 
subMetering3 <- as.numeric(subSet$Sub_metering_3) 

png("plot3.png", width=480, height=480) 
plot(date_time, subMetering1, type="l", ylab="Energy Submetering", xlab="") 
lines(date_time, subMetering2, type="l", col="red") 
lines(date_time, subMetering3, type="l", col="blue") 
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue")) 
dev.off() 
