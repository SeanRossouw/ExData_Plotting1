##Sean Rossouw
##2017/03/21
##Exploratory Data Assignment 1 plot 3

library(data.table)

alldata<-fread("household_power_consumption.txt", header=TRUE, na.strings="?")
alldata$Date <- as.Date(alldata$Date, format="%d/%m/%Y")
subdata<-subset(alldata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

datetime <- paste(as.Date(subdata$Date), subdata$Time)
subdata$Datetime <- as.POSIXct(datetime)


png("plot3.png", width=480, height=480)
plot(subdata$Datetime, subdata$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(subdata$Datetime,subdata$Sub_metering_2, type="l", col="red")
lines(subdata$Datetime,subdata$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()