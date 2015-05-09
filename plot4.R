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

#Convert character vectors to numeric
PowerConsumption$Global_active_power <- as.numeric(PowerConsumption$Global_active_power )
PowerConsumption$Voltage <- as.numeric(PowerConsumption$Voltage)
PowerConsumption$Sub_metering_1 <- as.numeric(PowerConsumption$Sub_metering_1)
PowerConsumption$Sub_metering_2 <- as.numeric(PowerConsumption$Sub_metering_2)
PowerConsumption$Global_reactive_power <- as.numeric(PowerConsumption$Global_reactive_power)

#Create a grid with 4 plots and save to a png file
png("plot4.png", width = 480, height = 480)
par(mfrow = c( 2, 2 ), cex.lab=1 )

plot(PowerConsumption$dateTime, PowerConsumption$Global_active_power, type="l", cex=.7, xlab="", ylab="Global Active Power")

plot(PowerConsumption$dateTime, PowerConsumption$Voltage, type="l", xlab="datetime", ylab="Volatage")

plot(PowerConsumption$dateTime, PowerConsumption$Sub_metering_1, type='l', xlab="", ylab="Energy sub metering")
lines(PowerConsumption$dateTime, PowerConsumption$Sub_metering_2, col="red")
lines(PowerConsumption$dateTime, PowerConsumption$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n", lty=c(1,1,1), col=c("black","red","blue"))

plot(PowerConsumption$dateTime, PowerConsumption$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()