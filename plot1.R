
setwd("C:/Users/hadip/Documents/Exploratory data analysis/Week 1")
data <- read.csv("household_power_consumption.txt", 
                 header = TRUE, sep = ";", na.strings = "?",
                 colClasses = c("character", "character", "numeric", "numeric",
                                "numeric", "numeric", "numeric", "numeric", 
                                "numeric"))

data$Date <- strptime(data$Date, format = "%d/%m/%Y")
##data$Time <- strptime(data$Time, format = "%H:%M:%S")
data<- data[data$Date %in% c("2007-02-01","2007-02-02") ,]

png("plot1.png", width=480, height=480)
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()