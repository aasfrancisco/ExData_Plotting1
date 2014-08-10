============= PLOT4 ===================
  
## hpc = household_power_consumption
  
hpc_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

save(hpc_full, file = "hpc_full.RData")

load("hpc_full.RData")

hpc_full$Date <- as.Date(hpc_full$Date, format="%d/%m/%Y")

## Subsetting plot4

plot4 <- subset(hpc_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

rm(hpc_full)

save(plot4, file = "plot4.RData")

## Converting dates
datetime <- paste(as.Date(plot4$Date), plot4$Time)
plot4$Datetime <- as.POSIXct(datetime)

## Plot 4

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(plot4, {plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})

## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
