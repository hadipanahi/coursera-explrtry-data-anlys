
setwd("C:/Users/hadip/Documents/Exploratory data analysis/Week 1")
data <- read.csv("household_power_consumption.txt", 
                 header = TRUE, sep = ";", na.strings = "?",
                 colClasses = c("character", "character", "numeric", "numeric",
                                "numeric", "numeric", "numeric", "numeric", 
                                "numeric"))

data<- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("plot4.png", width=480, height=480)

par(mfrow = c(2,2))

plot(datetime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(datetime, data$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, data$Sub_metering_1, type = "l", xlab = "", ylab =  "Energy sub metering")
lines(datetime, data$Sub_metering_2, col = "red")
lines(datetime, data$Sub_metering_3,  col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 1, col = c("black", "red", "blue"))

plot(datetime, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")


dev.off()