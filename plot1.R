# Coursera - Exploratory Data Analysis
# week1 project
## Plot1

library(dplyr)
Sys.setlocale("LC_ALL", "en_US.UTF-8")

# Download, unzip a file
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
f <- file.path(getwd(), "data.zip")
download.file(url, f)
unzip("data.zip")

# Read a file and subset
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
data$Date <- strptime(data$Date, format = "%d/%m/%Y")
data$Time <- format(strptime(data$Time, format = "%H:%M:%S"), format = "%H:%M:%S")

# Subset
subdata <- filter(data, (Date == "2007-02-01" | Date == "2007-02-02"))


# Plot histogram
png("plot1.png", width = 480, height = 480)
hist(subdata$Global_active_power, col="red", 
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")
dev.off()
