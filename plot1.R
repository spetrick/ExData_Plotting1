df <- read.table("household_power_consumption.txt", header = T, sep = ";", stringsAsFactors = F)
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
df2 <- df[df$Date == "2007-02-01", ]
df3 <- df[df$Date == "2007-02-02", ]
df <- rbind(df2, df3)
df$Global_active_power <- as.numeric(df$Global_active_power)
png(filename = "plot1.png")
plot(hist(df$Global_active_power), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()