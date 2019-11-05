
setwd("C:/Users/hadip/Documents/Exploratory data analysis/Week 1")
data <- read.csv("household_power_consumption.txt", 
                 header = TRUE, sep = ";", na.strings = "?",
                 colClasses = c("character", "character", "numeric", "numeric",
                                "numeric", "numeric", "numeric", "numeric", 
                                "numeric"))

data<- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
data$Date <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("plot2.png", width=480, height=480)

with(data, plot(Date, Global_active_power, type = "l", xlab = "", ylab =  "Global Active Power (kilowatts)"))
dev.off()