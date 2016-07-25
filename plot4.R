# plot4 : 4 graphs- global active power, voltage, sub metering and global_reactive_power

# Read data and save it in df4
df4 <- read.table('../household_power_consumption.txt', sep=';', header=T, 
                   colClasses = c('character', 'character', 'numeric',
                                  'numeric', 'numeric', 'numeric',
                                  'numeric', 'numeric', 'numeric'),
                   na.strings='?')
df4$DateTime <- strptime(paste(df4$Date, df4$Time),"%d/%m/%Y %H:%M:%S")

df4 <- subset(df4, 
               as.Date(DateTime) >= as.Date("2007-02-01") & 
                 as.Date(DateTime) <= as.Date("2007-02-02"))

# create plot4.png
png("plot4.png", height=480, width=480)

# make 4-plot frame
par(mfrow=c(2,2))

# 1st plot: Global Active Power 
plot(df4$DateTime,df4$Global_active_power,pch=NA,xlab="", 
     ylab="Global Active Power (kilowatts)")
lines(df4$DateTime, df4$Global_active_power)

# 2nd plot: Voltage 
plot(df4$DateTime, df4$Voltage, ylab="Voltage", xlab="datetime", pch=NA)
lines(df4$DateTime, df4$Voltage)

# 3rd plot: Sub metering 
plot(df4$DateTime,df4$Sub_metering_1,pch=NA,xlab="", 
     ylab="Energy sub metering")
lines(df4$DateTime, df4$Sub_metering_1)
lines(df4$DateTime, df4$Sub_metering_2, col='red')
lines(df4$DateTime, df4$Sub_metering_3, col='blue')

#add legend
legend('topright', 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1,1),
       col = c('black', 'red', 'blue'),
       bty = 'n')

# 4th plot: Global_reactive_power 
with(df4, plot(DateTime, Global_reactive_power, xlab='datetime', pch=NA))
with(df4, lines(DateTime, Global_reactive_power))

# close plot4.png
dev.off()
