# [1] "/Users/dparker23/datascience/Exploratory Analysis/ExData_Plotting1"
#
# The dataset has 2,075,259 rows and 9 columns. First calculate a rough estimate of how much memory the dataset will require in memory before reading into R. 
# Make sure your computer has enough memory (most modern computers should be fine).
# 
# We will only be using data from the dates 2007-02-01 and 2007-02-02. One alternative is to read the data from just those dates rather than reading in the entire dataset and subsetting to those dates.
# 66638 - 69515
# You may find it useful to convert the Date and Time variables to Date/Time classes in R using the strptime() and as.Date() functions.
#
# Note that in this dataset missing values are coded as ?.

# load data
powerData <- read.table("./household_power_consumption.txt", header = FALSE, nrows = 2878, sep = ";", skip = 66637, na.strings = "?",
                        colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), 
                        col.names = c("date", "time", "global_active_power", "global_reactive_power", "voltage", "global_intensity", 
                                      "sub_metering_1", "sub_metering_2", "sub_metering3"))

# format data / time
powerData$date <- as.Date(powerData$date, format = "%d/%m/%Y")
powerData$time <- strptime(powerData$time, format = "%H:%M:%S")
#powerData$time <- hms(powerData$time)

