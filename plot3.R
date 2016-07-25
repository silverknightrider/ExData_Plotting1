# plot3 : Global Active Power by sub metering over time

# Read data again and this time saving it in df3
df3 <- read.table('../household_power_consumption.txt', sep=';', header=T, 
                   colClasses = c('character', 'character', 'numeric',
                                  'numeric', 'numeric', 'numeric',
                                  'numeric', 'numeric', 'numeric'),
                   na.strings='?')
df3$DateTime <- strptime(paste(df3$Date, df3$Time), 
                          "%d/%m/%Y %H:%M:%S")
df3 <- subset(df3, 
               as.Date(DateTime) >= as.Date("2007-02-01") & 
                 as.Date(DateTime) <= as.Date("2007-02-02"))

# create plot3.png
png("plot3.png", height=480, width=480)

# plot Global Active Power by sub metering over time
plot(df3$DateTime,df3$Sub_metering_1,pch=NA,xlab="",
     ylab="Energy sub metering")
lines(df3$DateTime, df3$Sub_metering_1)
lines(df3$DateTime, df3$Sub_metering_2, col='red')
lines(df3$DateTime, df3$Sub_metering_3, col='blue')
#adding legend
legend('topright', 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1,1),
       col = c('black', 'red', 'blue'))

# close plot3
dev.off()
