# [1] "/Users/dparker23/datascience/Exploratory Analysis/ExData_Plotting1"

# load data
powerData <- read.table("./household_power_consumption.txt", header = FALSE, nrows = 2881, sep = ";", skip = 66637, na.strings = "?",
                        colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), 
                        col.names = c("date", "time", "global_active_power", "global_reactive_power", "voltage", "global_intensity", 
                                      "sub_metering_1", "sub_metering_2", "sub_metering_3"))

#open png
png(filename="plot4.png", width = 480, height = 480)

# format data / time
powerData$date <- as.Date(powerData$date, format = "%d/%m/%Y")
powerData$time <- as.POSIXct(paste(powerData$date, powerData$time), format="%Y-%m-%d %H:%M:%S")
labels <- c("2007-02-01 00:00:00", "2007-02-02 00:00:00", "2007-02-03 00:00:00")

#set canvas
par(mfrow=c(2,2))
#plot 1
with(powerData, plot(time, global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xaxt = "n"))
axis.POSIXct(1, powerData$time, at = labels, format = "%a")

#plot 2
with(powerData, plot(time, voltage, type = "l", ylab = "Voltage", xlab = "datetime", xaxt = "n"))
axis.POSIXct(1, powerData$time, at = labels, format = "%a")

#plot 3
with(powerData, plot(time, sub_metering_1, type = "l"))
with(powerData, lines(time, sub_metering_2, col = "red"))
with(powerData, lines(time, sub_metering_3, col = "blue"))
axis.POSIXct(1, powerData$time, at = labels, format = "%a")
legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#plot 4
with(powerData, plot(time, global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime", xaxt = "n"))
axis.POSIXct(1, powerData$time, at = labels, format = "%a")

#close png
dev.off()



