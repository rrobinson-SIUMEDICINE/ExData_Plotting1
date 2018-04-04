##Load all data
all_data <- read.csv("household_power_consumption.txt", header = T, sep = ';', na.strings = "?", check.names = F, stringsAsFactors = F, comment.char = "", quote = '\"')

##Fix dates for filtering
all_data$Date <- as.Date(all_data$Date, format = "%d/%m/%Y")
 
##Filter to target date range
working_data <- subset(all_data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
datetime <- paste(as.Date(working_data$Date), working_data$Time)
working_data$Datetime <- as.POSIXct(datetime)

##Plot data
plot(working_data$Global_active_power ~ working_data$Datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
