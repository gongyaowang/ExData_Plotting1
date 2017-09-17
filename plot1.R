#assumed that dataset file was downloaded and unzipped in the current work directory

#read data
dataFile <- file('./household_power_consumption.txt')
colNames <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
dataTable <- read.table(text = grep("^[1,2]/2/2007",readLines(dataFile),value=TRUE), sep = ';', col.names = colNames, na.strings = '?')

# open png device
png(filename = './plot1.png', width = 480, height = 480, units='px')

# plot figure
with(dataTable, hist(Global_active_power, xlab = 'Global Active Power (kilowatts)', main = 'Global Active Power', col = 'red'))

# close device
dev.off()
