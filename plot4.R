# Coursera - Exploratory Data Analysis
# week1 project
## Plot4

library(dplyr)
Sys.setlocale("LC_ALL", "en_US.UTF-8")

# Download, unzip a file
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
f <- file.path(getwd(), "data.zip")
download.file(url, f)
unzip("data.zip")

# Read a file and subset
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

# Subset
subdata <- filter(data, (Date == "1/2/2007" | Date == "2/2/2007"))
date <- as.Date(subdata$Date, format = "%d/%m/%Y")
x_axis <- as.POSIXct(paste(date, subdata$Time))


# Plot histogram
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

## top-left
plot(x_axis, subdata$Global_active_power, xaxt="n", type="l",
     xlab="", ylab="Global Active Power")
r <- round(range(x_axis), "days")
axis.POSIXct(1, at = seq(r[1], r[2], by="days"), format = "%a")

## top-right
plot(x_axis, subdata$Voltage,  xaxt="n", type="l",
     xlab="datetime", ylab="Voltage")
axis.POSIXct(1, at = seq(r[1], r[2], by="days"), format = "%a")

## bottom-left
plot(x_axis, subdata$Sub_metering_1, xaxt="n", type="l",
     xlab="", ylab="Energy sub metering")
r <- round(range(x_axis), "days")
axis.POSIXct(1, at = seq(r[1], r[2], by="days"), format = "%a")

lines(x_axis, subdata$Sub_metering_2, col="red")
lines(x_axis, subdata$Sub_metering_3, col="blue")

legend("topright", c("Sub_metering1", "Sub_metering2", "Sub_metering3"),
       col = c("black", "red", "blue"), cex = 0.8, lty = 1, bty="n")

## bottom-right
plot(x_axis, subdata$Global_reactive_power, xaxt="n", type="l",
     xlab="datetime", ylab="Global_reactive_power")
axis.POSIXct(1, at = seq(r[1], r[2], by="days"), format = "%a")

dev.off()