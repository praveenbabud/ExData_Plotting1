## This Scripts reads file household_power_consumption.txt
## Subsets data collected on 1/2/2007 and 2/2/2007
## Draws plots of sub meter reading in different colors

data <- read.table("household_power_consumption.txt", sep=";", 
                   header=TRUE,na.strings="?",
                   colClasses=c("character", "character","numeric", 
                                "numeric", "numeric","numeric","numeric",
                                "numeric", "numeric"))
subsetOfData <- subset(data, as.Date(data$Date,"%d/%m/%Y") == 
                         as.Date("1/2/2007", "%d/%m/%Y") | 
                         as.Date(data$Date,"%d/%m/%Y") == 
                         as.Date("2/2/2007", "%d/%m/%Y"))

plot(strptime(paste(subsetOfData$Date,subsetOfData$Time),"%d/%m/%Y %H:%M:%S"),
     subsetOfData$Sub_metering_1, 
     ylab="Energy sub metering", xlab="", type="l",col="black")
lines(strptime(paste(subsetOfData$Date,subsetOfData$Time),"%d/%m/%Y %H:%M:%S"),
      subsetOfData$Sub_metering_2, type="l",col="red")
lines(strptime(paste(subsetOfData$Date,subsetOfData$Time),"%d/%m/%Y %H:%M:%S"),
      subsetOfData$Sub_metering_3, type="l",col="blue")
legend(x="topright",legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lwd=2,col=c("black","red","blue"))
