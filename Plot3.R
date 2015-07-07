library(dplyr)
classes <-
    c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")

power <-
    read.delim("household_power_consumption.txt", sep = ";", na.strings = "?", colClasses = classes)

power <- filter(power, Date == '1/2/2007' | Date == '2/2/2007')

power <- mutate(power, Date = as.Date(Date, "%d/%m/%Y"))

power <-
    mutate(power, Date.Time = as.POSIXct(paste(power$Date, power$Time), format = "%Y-%m-%d %H:%M:%S"))

png(file = "plot3.png")

plot(power$Date.Time, power$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")

lines(power$Date.Time, power$Sub_metering_2, col = "red")

lines(power$Date.Time, power$Sub_metering_3, col = "blue")

legend("topright", col = c("black", "red", "blue"), 
    legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1))

#dev.copy(png, file = "plot3.png")

dev.off()
