================= plot1 ===================
# household_power_consumption = hpc

hpc <- read.table(  "household_power_consumption.txt",
  header = T, sep = ";",dec = ".",na.strings = "?")

save(hpc, file = "hpc.RData")

subset1  <- subset(hpc,Date%in% c("1/2/2007","2/2/2007"),
                   select=c(Date,Time,Global_active_power,Global_reactive_power, Voltage,Global_intensity,Sub_metering_1,Sub_metering_2,Sub_metering_3))

save(subset1, file = "subset1.RData")

class(subset1$Global_active_power)

hist(subset1$Global_active_power, col = "red")


(histogram_power <- hist(subset1$Global_active_power, plot = F))

png("Plot1.png", width = 480, height = 480)
plot(histogram_power, labels = F, col="red",main=("Global Active Power "),xlab = "Global Active Power (kilowatts)")
dev.off()
