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
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

##plot 1.. datetime and active power
plot(subset_powerconsump$Datetime, as.numeric(subset_powerconsump$Global_active_power), type="l", ylab="Global Active Power")


##plot 2.. datetime and voltage
plot(subset_powerconsump$Datetime, as.numeric(subset_powerconsump$Voltage), type="l", ylab="voltage", xlab="datetime")

##plot 3. datetime and sub
plot(subset_powerconsump$Datetime, as.numeric(subset_powerconsump$Sub_metering_1), type="l", col="black", ylab="Energy Submetering", xlab="")
lines(subset_powerconsump$Datetime, as.numeric(subset_powerconsump$Sub_metering_2), type="l", col="red")
lines(subset_powerconsump$Datetime, as.numeric(subset_powerconsump$Sub_metering_3), type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))


##plot 4.  date timee and reactive power
plot(subset_powerconsump$Datetime, as.numeric(subset_powerconsump$Global_reactive_power), type="l", ylab="Global Reactive Power", xlab="datetime")

##make sure to close
dev.off() 