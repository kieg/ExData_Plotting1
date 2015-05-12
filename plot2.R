# Exploratory Data Analysis
# Coursera
# Assignment 1 - Question 2

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


# Create Plot 2

# Assign screen device as png file with width 480 and height 480.
png(file = "plot2.png",
    width  = 480, 
    height = 480
    ) 

# Create histogram detailing Global Active Power level over time..
plot(powerDataSub$DateTime, powerDataSub$Global_active_power, 
     ylab = "Global Active Power (kilowatts)", 
     xlab = "", 
     type = "n"  #Leave chart void of data for now. 
     )
  lines(powerDataSub$DateTime, powerDataSub$Global_active_power) 

dev.off()  # Close png device
