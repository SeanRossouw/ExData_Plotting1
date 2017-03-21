##Sean Rossouw
##2017/03/21
##Exploratory Data Assignment 1 plot 4

library(data.table)

alldata<-fread("household_power_consumption.txt", header=TRUE, na.strings="?")
alldata$Date <- as.Date(alldata$Date, format="%d/%m/%Y")
subdata<-subset(alldata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

datetime <- paste(as.Date(subdata$Date), subdata$Time)
subdata$Datetime <- as.POSIXct(datetime)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(subdata$Global_active_power~subdata$Datetime, type="l",ylab="Global Active Power (kilowatts)", xlab="", cex=0.2)

plot(subdata$Datetime, subdata$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(subdata$Datetime, subdata$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(subdata$Datetime,subdata$Sub_metering_2, type="l", col="red")
lines(subdata$Datetime,subdata$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

plot(subdata$Datetime, subdata$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()