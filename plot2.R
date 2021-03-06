#
# Author: Francis Ryu
# Date: 08/09/14
# Desc: Project 1 - Plot2
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

# Plot 2: time series
png(filename="plot2.png", width=480, height=480, units="px")
plot(sdf$DT, sdf$Global_active_power, type="l",
     ylab="Global Actve Power (kilowatts)", xlab="")
dev.off()

