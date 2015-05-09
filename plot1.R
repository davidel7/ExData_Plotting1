#Set the working directory for the script.  If it does not exist then create it.
if (!file.exists("Z:\\Coursera\\ExploringData")) {
  dir.create("Z:\\Coursera\\ExploringData")
}
setwd("Z:\\Coursera\\ExploringData")

#Import the data file
hhPowerConsumption <- read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE)

#Create datetime field from Date and Time fields
hhPowerConsumption$dateTime <- strptime(paste(hhPowerConsumption$Date, hhPowerConsumption$Time), "%d/%m/%Y %H:%M:%S")

#Subset the data to include only records from 2007-02-01 and 2007-02-02
PowerConsumption <- subset(hhPowerConsumption, hhPowerConsumption$dateTime >= "2007-02-01 00:00:00" & hhPowerConsumption$dateTime < "2007-02-03 00:00:00")

#Convert the Global_active_power field to numeric from character
PowerConsumption$Global_active_power <- as.numeric(PowerConsumption$Global_active_power)

#Create a histogram plot from the Global_active_power vector and save to a png file
png("plot1.png", width = 480, height = 480)
hist(PowerConsumption$Global_active_power, breaks=12, col="red", xlab =  "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
