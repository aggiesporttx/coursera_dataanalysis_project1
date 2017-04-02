##read in the dataset
setwd("D:/online classes/data analysis/project 1")
power_consump <- read.table("household_power_consumption.txt", sep=";", header=TRUE)

##pull in the subset data
subset_powerconsump <- subset(power_consump,power_consump$Date == "1/2/2007" | power_consump$Date == "2/2/2007") 

##convert dates
subset_powerconsump$Date <- as.Date(subset_powerconsump$Date, format = "%d/%m/%Y")
powerDates <- strptime(paste(subset_powerconsump$Date, subset_powerconsump$Time), "%Y-%m-%d %H:%M:%S")
subset_powerconsump$Datetime <- as.POSIXct(powerDates)

##draw the line plot.. using png function, copy doesnt seem to work well
png("plot2.png", width=480, height=480)
plot(subset_powerconsump$Datetime, as.numeric(as.character(subset_powerconsump$Global_active_power)), type="l", ylab="Global ActivePower  (kilowatts)", xlab="")  ##line plot

##make sure to close
dev.off() 