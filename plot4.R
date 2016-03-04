# [1] "/Users/dparker23/datascience/Exploratory Analysis/ExData_Plotting1"

# load data
powerData <- read.table("./household_power_consumption.txt", header = FALSE, nrows = 2878, sep = ";", skip = 66637, na.strings = "?",
                        colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), 
                        col.names = c("date", "time", "global_active_power", "global_reactive_power", "voltage", "global_intensity", 
                                      "sub_metering_1", "sub_metering_2", "sub_metering_3"))

# format data / time
powerData$date <- as.Date(powerData$date, format = "%d/%m/%Y")
powerData$time <- strptime(powerData$time, format = "%H:%M:%S")
#powerData$time <- hms(powerData$time)

#set canvas
par(mfrow=c(2,2))
#plot 1
with(powerData, plot(time, global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xaxt = "n"))
with(powerData, axis.Date(1, at=seq(min(date), max(date), by = 1400), format="%a"))

#plot 2
with(powerData, plot(time, voltage, type = "l", ylab = "Voltage", xlab = "datetime", xaxt = "n"))
with(powerData, axis.Date(1, at=seq(min(date), max(date), by = 1400), format="%a"))

#plot 3
with(powerData, plot(time, sub_metering_1, type = "l"))
with(powerData, lines(time, sub_metering_2, col = "red"))
with(powerData, lines(time, sub_metering_3, col = "blue"))
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#plot 4
with(powerData, plot(time, global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime", xaxt = "n"))
with(powerData, axis.Date(1, at=seq(min(date), max(date), by = 1400), format="%a"))
