## This Scripts reads file household_power_consumption.txt
## Subsets data collected on 1/2/2007 and 2/2/2007
## Draws histgram for Global Active Power variable

data <- read.table("household_power_consumption.txt", sep=";", 
                   header=TRUE,na.strings="?",
                   colClasses=c("character", "character","numeric", 
                                "numeric", "numeric","numeric","numeric",
                                "numeric", "numeric"))
subsetOfData <- subset(data, as.Date(data$Date,"%d/%m/%Y") == 
                      as.Date("1/2/2007", "%d/%m/%Y") | 
                      as.Date(data$Date,"%d/%m/%Y") == 
                      as.Date("2/2/2007", "%d/%m/%Y"))

hist(subsetOfData$Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)", col="red", ylim=c(0,1200))