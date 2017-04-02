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
png("plot3.png", width=480, height=480)
plot(subset_powerconsump$Datetime, as.numeric(subset_powerconsump$Sub_metering_1), type="l", col="black", ylab="Energy Submetering", xlab="")
lines(subset_powerconsump$Datetime, as.numeric(subset_powerconsump$Sub_metering_2), type="l", col="red")
lines(subset_powerconsump$Datetime, as.numeric(subset_powerconsump$Sub_metering_3), type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))

##make sure to close
dev.off() 