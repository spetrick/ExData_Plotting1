df <- read.table("household_power_consumption.txt", header = T, sep = ";", stringsAsFactors = F)
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
df2 <- df[df$Date == "2007-02-01", ]
df3 <- df[df$Date == "2007-02-02", ]
df <- rbind(df2, df3)
df <- cbind(df, strptime(paste(df$Date, df$Time), format = "%Y-%m-%d %H:%M:%S"))
names(df)[10] <- "Datetime"
colo <- c("black", "red", "blue")
leg.text <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
png(filename = "plot4.png")
par(mfcol = c(2, 2))
plot(df$Datetime, df$Global_active_power, type = "s", xlab = "", ylab = "Global Active Power (kilowatts)")
plot(df$Datetime, df$Sub_metering_1, type = "s", xlab = "", ylab = "Energy sub metering")
lines(df$Datetime, df$Sub_metering_2, type = "s", col = "red")
lines(df$Datetime, df$Sub_metering_3, type = "s", col = "blue")
legend("topright", leg.text, lty = 1, lwd = 1, col = colo)
plot(df$Datetime, df$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(df$Datetime, df$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()