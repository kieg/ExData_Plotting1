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

