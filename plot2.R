#read in data
powerData <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?")

#convert dates and time to a Date / Time variable
powerData$DateTime <- as.POSIXct(paste(powerData$Date, powerData$Time), format="%d/%m/%Y %H:%M:%S")

#subset data according to dates provided. 
powerDataSub <- subset(powerData, format(DateTime,'%Y-%m-%d') %in% c('2007-02-01','2007-02-02')) 


#Plot 2
png(file = "plot2.png") # assign screen device as png file

plot(powerDataSub$DateTime, powerDataSub$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type = "n")
lines(powerDataSub$DateTime, powerDataSub$Global_active_power)

dev.off() # close png device