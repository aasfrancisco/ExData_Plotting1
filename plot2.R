============= PLOT2 ===================
  
# household_power_consumption = hpc
  
hpc_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

save(hpc_full, file = "hpc_full.RData")

load("hpc_full.RData")

hpc_full$Date <- as.Date(hpc_full$Date, format="%d/%m/%Y")

## Subsetingt plot2

plot2 <- subset(hpc_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

rm(hpc_full)

save(plot2, file = "plot2.RData")

## Converting dates

datetime <- paste(as.Date(plot2$Date), plot2$Time)
plot2$Datetime <- as.POSIXct(datetime)

## plotting plot2
par(mfrow = c(1, 1), mar = c(4, 4, 2, 1), oma = c(1, 1, 2, 1))
plot(plot2$Global_active_power~plot2$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

