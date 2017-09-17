#assumed that dataset file was downloaded and unzipped in the current work directory

#read data
dataFile <- file('./household_power_consumption.txt')
colNames <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
dataTable <- read.table(text = grep("^[1,2]/2/2007",readLines(dataFile),value=TRUE), sep = ';', col.names = colNames, na.strings = '?')

# format date and time 
dataTable$DateTime <- strptime(paste(dataTable$Date, dataTable$Time), format="%d/%m/%Y %H:%M:%S")
dataTable$Date <- as.Date(dataTable$Date, format = '%d/%m/%Y')

# open png device
png(filename = './plot4.png', width = 480, height = 480, units='px')

# plot figures
par(mfrow = c(2, 2))
plot(dataTable$DateTime, dataTable$Global_active_power, xlab = '', ylab = 'Global Active Power', type = 'l')
plot(dataTable$DateTime, dataTable$Voltage, xlab = 'datetime', ylab = 'Voltage', type = 'l')
plot(dataTable$DateTime, dataTable$Sub_metering_1, xlab = '', ylab = 'Energy sub metering', type = 'l')
lines(dataTable$DateTime, dataTable$Sub_metering_2, col = 'red')
lines(dataTable$DateTime, dataTable$Sub_metering_3, col = 'blue')
legend('topright', col = c('black', 'red', 'blue'), lty=1, lwd=2, bty="n", legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
plot(dataTable$DateTime, dataTable$Global_reactive_power, xlab = 'datetime', ylab = 'Global_reactive_power', type = 'l')

# close device
dev.off()


