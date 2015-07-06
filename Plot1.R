library(dplyr)
classes <-
    c(
        "character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"
    )
power <-
    read.delim(
        "household_power_consumption.txt", sep = ";", na.strings = "?", colClasses = classes
    )
power <- filter(power, Date == '1/2/2007' |
                    Date == '2/2/2007')

power <- mutate(power, Date = as.Date(Date, "%d/%m/%Y"))

hist(power[, 3], main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

dev.copy(png, file = "plot1.png")

dev.off()
