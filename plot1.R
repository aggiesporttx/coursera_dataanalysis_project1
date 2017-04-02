##read in the dataset
setwd("D:/online classes/data analysis/project 1")
power_consump <- read.table("household_power_consumption.txt", sep=";", header=TRUE)

##pull in the subset data
subset_powerconsump <- subset(power_consump,power_consump$Date == "1/2/2007" | power_consump$Date == "2/2/2007") 

##draw the histogram.. using png function, copy doesnt seem to work well
png("plot1.png", width=480, height=480)
hist(as.numeric(as.character(subset_powerconsump$Global_active_power)), col="red", main="Global Active Power", xlab="Global ActivePower  (kilowatts)")
  
 ##make sure to close
dev.off() 