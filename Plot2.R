library(dplyr)
classes <-
    c(
        "character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"
    )
power <-
    read.delim(
        "household_power_consumption.txt", sep = ";", na.strings = "?", colClasses = classes
    )
power <- filter(power, Date == '1/2/2007' | Date == '2/2/2007')

power <- mutate(power, Date = as.Date(Date, "%d/%m/%Y"))

power <- mutate(power, Date.Time = as.POSIXct(paste(power$Date, power$Time), format = "%Y-%m-%d %H:%M:%S"))

plot(power$Date.Time, power$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.copy(png, file = "plot2.png")

dev.off()
