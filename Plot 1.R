

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

## Convert "DATE" column from character, to DateTime (Posixlt)
dataforplot$Date <- strptime(dataforplot$Date, "%d/%m/%Y %H:%M:%S")

## Plot
hist(dataforplot$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "Red")

# Save file
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()








