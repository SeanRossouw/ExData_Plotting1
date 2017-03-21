##Sean Rossouw
##2017/03/21
##Exploratory Data Assignment 1 plot 1


library(data.table)

alldata<-fread("household_power_consumption.txt", header=TRUE, na.strings="?")
alldata$Date <- as.Date(alldata$Date, format="%d/%m/%Y")
subdata<-subset(alldata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

datetime <- paste(as.Date(subdata$Date), subdata$Time)
subdata$Datetime <- as.POSIXct(datetime)

png(filename = "plot1.png", width = 480, height=480)
hist(subdata$Global_active_power, col = "red", main = "Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()




