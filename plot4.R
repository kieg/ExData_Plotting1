# Exploratory Data Analysis
# Coursera
# Assignment 1 - Question 4

# Read in data from power consumption file. 
powerData <- read.table("household_power_consumption.txt", 
                        header     = TRUE, 
                        sep        = ";", 
                        na.strings = "?")

# Convert dates and time to a Date / Time variable
# Combine Date and Time column, then specify formatting.
powerData$DateTime <- as.POSIXct(paste(powerData$Date, powerData$Time), 
                                 format = "%d/%m/%Y %H:%M:%S")

# Subset data according to include only Feb 1st and 2nd 2007 
powerDataSub <- subset(powerData, 
                       format(DateTime,'%Y-%m-%d') 
                       %in% c('2007-02-01','2007-02-02')
                       ) 

## Create Plot 4

# Assign screen device as png file with width 480 and height 480.
png(file = "plot4.png", 
    width = 500, 
    height = 500) 

par(mfrow = c(2,2))  # Show four chart in screen display..

#Plot 4.a - Global Active Power over time.
plot(powerDataSub$DateTime, powerDataSub$Global_active_power, 
     ylab = "Global Active Power (kilowatts)", 
     xlab = "", 
     type = "n")
  lines(powerDataSub$DateTime, powerDataSub$Global_active_power)

#Plot 4.b - Voltage Over time
plot(powerDataSub$DateTime, powerDataSub$Voltage, 
     ylab  = "Voltage", 
     xlab  = "datetime", 
     type  = "n")   
  lines(powerDataSub$DateTime, powerDataSub$Voltage)

#Plot 4.c - Energy Sub Metering over time. 
plot(powerDataSub$DateTime, powerDataSub$Sub_metering_1, 
     ylab = "Energy sub metering", 
     xlab = "", 
     type = "n")
  lines(powerDataSub$DateTime, powerDataSub$Sub_metering_1)
  lines(powerDataSub$DateTime, powerDataSub$Sub_metering_2, col="red")
  lines(powerDataSub$DateTime, powerDataSub$Sub_metering_3, col = "blue")

  legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       fill=c("black", "red", "blue"))

#Plot 4.c - Global Reactive Power over time.
plot(powerDataSub$DateTime, powerDataSub$Global_reactive_power, 
     ylab = "Global_reactive_power", 
     xlab = "datetime", 
     type = "n")   
  lines(powerDataSub$DateTime, powerDataSub$Global_reactive_power)

dev.off() # close png device

