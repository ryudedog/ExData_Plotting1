#
# Author: Francis Ryu
# Date: 08/09/14
# Desc: Project 1 - Plot4
#       Plotting of electric power consumption
#       Data from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
#


# read file
df <- read.csv("household_power_consumption.txt",
                    header=TRUE, sep=";", na.strings="?")

# convert dates
df$DT <- strptime(paste(df$Date,df$Time), "%d/%m/%Y %H:%M:%S");
df$Date <- as.Date(df$Date, "%d/%m/%Y")

# subset for date range
sdf <- df[which(df$Date>="2007-02-01" & df$Date<="2007-02-02"),]

# plot 4: multi-plot
png(filename="plot4.png", width=480, height=480, units="px")
par(mfrow=c(2,2))
with(sdf, {
  plot(sdf$DT, sdf$Global_active_power, type="l",
       ylab="Global Actve Power", xlab="")
  plot(sdf$DT, sdf$Voltage, type="l",
       ylab="Voltage", xlab="datetime")
  plot(sdf$DT, sdf$Sub_metering_1, type="l",
       ylab="Energy sub metering", xlab="", col="black")
  lines(sdf$DT, sdf$Sub_metering_2, col="red")
  lines(sdf$DT, sdf$Sub_metering_3, col="blue")
  legend("topright",
         legend=c("Sub_metering_1","Sub_metering_2", "sub_metering_3"),
         col=c("black","red","blue"), lty=c(1,1,1),
         bty="n")
  plot(sdf$DT, sdf$Global_reactive_power, type="l",
       ylab="Global_reactive_power", xlab="datetime")
})
dev.off()


