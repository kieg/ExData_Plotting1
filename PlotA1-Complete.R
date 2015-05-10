#read in data
powerData <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?")

#convert dates and time to a Date / Time variable
powerData$DateTime <- as.POSIXct(paste(powerData$Date, powerData$Time), format="%d/%m/%Y %H:%M:%S")

#subset data according to dates provided. 
powerDataSub <- subset(powerData, format(DateTime,'%Y-%m-%d') %in% c('2007-02-01','2007-02-02')) 


#Plot 1
png(file = "plot1.png") # assign screen device as png file

hist(with(powerDataSub, Global_active_power), main = "Global Active Power", col = "red", xlab = "Global Active power (kilowatts)")

dev.off() # close png device

#Plot 2
png(file = "plot2.png") # assign screen device as png file

plot(powerDataSub$DateTime, powerDataSub$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type = "n")
  lines(powerDataSub$DateTime, powerDataSub$Global_active_power)

dev.off() # close png device

#Plot 3
png(file = "plot3.png") # assign screen device as png file

plot(powerDataSub$DateTime, powerDataSub$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "n")
  lines(powerDataSub$DateTime, powerDataSub$Sub_metering_1)
  lines(powerDataSub$DateTime, powerDataSub$Sub_metering_2, col="red")
  lines(powerDataSub$DateTime, powerDataSub$Sub_metering_3, col = "blue")

  legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       fill=c("black", "red", "blue"))

dev.off() # close png device

#Plot 4
png(file = "plot4.png") # assign screen device as png file

par(mfrow = c(2,2))

#Plot 4.a - Global Active power
plot(powerDataSub$DateTime, powerDataSub$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type = "n")
    lines(powerDataSub$DateTime, powerDataSub$Global_active_power)
    
#Plot 4.b - Voltage Over time
plot(powerDataSub$DateTime, powerDataSub$Voltage, ylab = "Voltage", xlab = "datetime", type = "n")   
  lines(powerDataSub$DateTime, powerDataSub$Voltage)

#Plot 4.c - Energy Sub Meeting 
plot(powerDataSub$DateTime, powerDataSub$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "n")
    lines(powerDataSub$DateTime, powerDataSub$Sub_metering_1)
    lines(powerDataSub$DateTime, powerDataSub$Sub_metering_2, col="red")
    lines(powerDataSub$DateTime, powerDataSub$Sub_metering_3, col = "blue")

    legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       fill=c("black", "red", "blue"))

#Plot 4.c - Global Reactive Power
plot(powerDataSub$DateTime, powerDataSub$Global_reactive_power, ylab = "Global_reactive_power", xlab = "datetime", type = "n")   
  lines(powerDataSub$DateTime, powerDataSub$Global_reactive_power)

dev.off() # close png device
