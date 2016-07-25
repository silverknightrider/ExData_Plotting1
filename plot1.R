# Plot 1 : Global Active Power


# Read data file
df1 <- read.table('../household_power_consumption.txt', sep=';', header=T, 
                   colClasses = c('character', 'character', 'numeric',
                                  'numeric', 'numeric', 'numeric',
                                  'numeric', 'numeric', 'numeric'),
                   na.strings='?')
df1$DateTime <- strptime(paste(df1$Date, df1$Time), 
                          "%d/%m/%Y %H:%M:%S")
df1 <- subset(df1, 
               as.Date(DateTime) >= as.Date("2007-02-01") & 
                 as.Date(DateTime) <= as.Date("2007-02-02"))

# create plot1.png
png("plot1.png", height=480, width=480)

# plot graph
hist(df1$Global_active_power, col='red', 
     xlab = 'Global Active Power (kilowatts)',
     main = 'Global Active Power')

# close plot1.png
dev.off()
