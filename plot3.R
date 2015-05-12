# Exploratory Data Analysis
# Coursera
# Assignment 1 - Question 3

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

# Create Plot 3

# Assign screen device as png file with width 480 and height 480.
png(file   = "plot3.png",
    width  = 480, 
    height = 480
    ) 

plot(powerDataSub$DateTime, powerDataSub$Sub_metering_1, 
     ylab = "Energy sub metering", 
     xlab = "", 
     type = "n"
     )
  lines(powerDataSub$DateTime, powerDataSub$Sub_metering_1)
  lines(powerDataSub$DateTime, powerDataSub$Sub_metering_2, col="red")
  lines(powerDataSub$DateTime, powerDataSub$Sub_metering_3, col = "blue")

legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       fill=c("black", "red", "blue"))

dev.off() # Close png device
