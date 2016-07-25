# Plot 2 : Global Active Power over time

# read file again (this time I'm calling it df2) and convert date accordingly

df2 <- read.table('../household_power_consumption.txt', sep=';', header=T, 
                   colClasses = c('character', 'character', 'numeric',
                                  'numeric', 'numeric', 'numeric',
                                  'numeric', 'numeric', 'numeric'),
                   na.strings='?')

df2$DateTime <- strptime(paste(df2$Date, df2$Time), 
                          "%d/%m/%Y %H:%M:%S")
df2 <- subset(df2, 
               as.Date(DateTime) >= as.Date("2007-02-01") & 
                 as.Date(DateTime) <= as.Date("2007-02-02"))

# create plot2.png
png("plot2.png", height=480, width=480)

# create Global Active Power over time graph
plot(df2$DateTime,df2$Global_active_power,pch=NA,xlab="", 
     ylab="Global Active Power (kilowatts)")
lines(df2$DateTime, df2$Global_active_power)

# close plot2.png
dev.off()
