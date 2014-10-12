## This Scripts reads file household_power_consumption.txt
## Subsets data collected on 1/2/2007 and 2/2/2007
## Draws plot of Global Active Power variable over two days

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
     subsetOfData$Global_active_power, ylab="Global Active Power (kilowatts)",
     xlab="", type="l")
