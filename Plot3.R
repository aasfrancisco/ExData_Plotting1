============= PLOT3 ===================
  
  ## hpc = household_power_consumption
  
  hpc_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

save(hpc_full, file = "hpc_full.RData")

hpc_full$Date <- as.Date(hpc_full$Date, format="%d/%m/%Y")

## Subsetting plot3

plot3 <- subset(hpc_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

rm(hpc_full)

save(plot3, file = "plot3.RData")

## Converting dates

datetime <- paste(as.Date(plot3$Date), plot3$Time)
plot3$Datetime <- as.POSIXct(datetime)

## Plot 3
with(plot3, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
