#read in data
powerData <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?")

#convert dates and time to a Date / Time variable
powerData$DateTime <- as.POSIXct(paste(powerData$Date, powerData$Time), format="%d/%m/%Y %H:%M:%S")

#subset data according to dates provided. 
powerDataSub <- subset(powerData, format(DateTime,'%Y-%m-%d') %in% c('2007-02-01','2007-02-02')) 


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