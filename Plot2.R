df <- read.table("household_power_consumption.txt", header = T, sep = ";", stringsAsFactors = F)
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
df2 <- df[df$Date == "2007-02-01", ]
df3 <- df[df$Date == "2007-02-02", ]
df <- rbind(df2, df3)
df <- cbind(df, strptime(paste(df$Date, df$Time), format = "%Y-%m-%d %H:%M:%S"))
names(df)[10] <- "Datetime"
png(filename = "plot2.png")
plot(df$Datetime, df$Global_active_power, type = "s", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()