## This Scripts reads file household_power_consumption.txt
## Subsets data collected on 1/2/2007 and 2/2/2007
## Draws 4 plots in one page.

data <- read.table("household_power_consumption.txt", sep=";", 
                   header=TRUE,na.strings="?",
                   colClasses=c("character", "character","numeric", 
                                "numeric", "numeric","numeric","numeric",
                                "numeric", "numeric"))
subsetOfData <- subset(data, as.Date(data$Date,"%d/%m/%Y") == 
                         as.Date("1/2/2007", "%d/%m/%Y") | 
                         as.Date(data$Date,"%d/%m/%Y") == 
                         as.Date("2/2/2007", "%d/%m/%Y"))

par(mfrow=c(2,2))

plot(strptime(paste(subsetOfData$Date,subsetOfData$Time),"%d/%m/%Y %H:%M:%S"),
     subsetOfData$Global_active_power, ylab="Global Active Power",
     xlab="", type="l")

plot(strptime(paste(subsetOfData$Date,subsetOfData$Time),"%d/%m/%Y %H:%M:%S"),
     subsetOfData$Voltage, ylab="Voltage", xlab="datetime", type="l")

plot(strptime(paste(subsetOfData$Date,subsetOfData$Time),"%d/%m/%Y %H:%M:%S"),
     subsetOfData$Sub_metering_1, 
     ylab="Energy sub metering", xlab="", type="l",col="black")
lines(strptime(paste(subsetOfData$Date,subsetOfData$Time),"%d/%m/%Y %H:%M:%S"),
      subsetOfData$Sub_metering_2, type="l",col="red")
lines(strptime(paste(subsetOfData$Date,subsetOfData$Time),"%d/%m/%Y %H:%M:%S"),
      subsetOfData$Sub_metering_3, type="l",col="blue")

plot(strptime(paste(subsetOfData$Date,subsetOfData$Time),"%d/%m/%Y %H:%M:%S"),
     subsetOfData$Global_reactive_power, ylab="Global_reactive_power",
     xlab="datetime", type="l")
