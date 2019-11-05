
setwd("C:/Users/hadip/Documents/Exploratory data analysis/Week 1")
data <- read.csv("household_power_consumption.txt", 
                 header = TRUE, sep = ";", na.strings = "?",
                 colClasses = c("character", "character", "numeric", "numeric",
                                "numeric", "numeric", "numeric", "numeric", 
                                "numeric"))

data<- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
data$Date <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("plot3.png", width=480, height=480)

with(data, plot(Date, Sub_metering_1, type = "l", xlab = "", ylab =  "Energy sub metering"))
with(data, lines(Date, Sub_metering_2, col = "blue"))
with(data, lines(Date, Sub_metering_3,  col = "red"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 1, col = c("black", "red", "blue"))

dev.off()