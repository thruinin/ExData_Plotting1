
## Download & unzip the file with the datasets
if(!file.exists("./household consumption")){dir.create("./household consumption")}
fileUrl <- "https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"
download.file(fileUrl,destfile="./household consumption/consumption dataset.zip")
unzip(zipfile = "./household consumption/consumption dataset.zip", exdir = "./household consumption")
setwd("./household consumption")


library(dplyr)
## read the dataset
consumo <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
## The variables in the dataset are all factors, so converted appropriately by using STRING_AS_FACTORS = FASE.

## Subset the data that we will use for the plots
dataforplot <- filter(consumo, Date == "1/2/2007" |  Date == "2/2/2007")

## Merge Date & Time character vectors (to get a character vector that has both date & time info)
dataforplot$Date <- paste (dataforplot$Date, dataforplot$Time)

## Convert "DATE" column from character, to DateTime (POSIXlt)
dataforplot$Date <- strptime(dataforplot$Date, "%d/%m/%Y %H:%M:%S")

## Convert from POSIXlt to POSIXct (otherwise R will not plot)
dataforplot$Date <- as.POSIXct(dataforplot$Date)

## set plot to accomodate 2 x 2 graphs
par(mfrow = c(2, 2))

plot(dataforplot$Global_active_power ~ dataforplot$Date, type = "l", ylab = "Global Active Power", xlab = "")
plot(dataforplot$Voltage ~ dataforplot$Date, type = "l", ylab = "Voltage", xlab="datetime" )
plot(dataforplot$Sub_metering_1 ~ dataforplot$Date, type = "l", ylab = "Energy sub metering", xlab = "")
    lines(dataforplot$Sub_metering_2 ~ dataforplot$Date, col = "Red")
    lines(dataforplot$Sub_metering_3 ~ dataforplot$Date, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")
plot(dataforplot$Global_reactive_power ~ dataforplot$Date, type = "l", xlab="datetime", ylab = "Global_reactive_power")

# Save file
dev.copy(png, file = "plot4.png", height = 480, width = 500)
dev.off()








