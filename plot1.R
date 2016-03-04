# [1] "/Users/dparker23/datascience/Exploratory Analysis/ExData_Plotting1"

# load data
powerData <- read.table("./household_power_consumption.txt", header = FALSE, nrows = 2878, sep = ";", skip = 66637, na.strings = "?",
                        colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), 
                        col.names = c("date", "time", "global_active_power", "global_reactive_power", "voltage", "global_intensity", 
                                      "sub_metering_1", "sub_metering_2", "sub_metering3"))

# format data / time
powerData$date <- as.Date(powerData$date, format = "%d/%m/%Y")
powerData$time <- strptime(powerData$time, format = "%H:%M:%S")
#powerData$time <- hms(powerData$time)

# Global Active Power plot
hist(powerData$global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")
