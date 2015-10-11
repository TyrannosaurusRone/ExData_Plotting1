#read in data
hpc <- read.table("household_power_consumption.txt", ";", header = T)

#Convert Date and Time vectors to required formats
hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")
hpc$timetemp <- paste(hpc$Date, hpc$Time)  
hpc$Time <- strptime(hpc$timetemp, format = "%Y-%m-%d %H:%M:%S") 

#take subset of data
hpc1 <- subset(hpc, Date >= "2007-02-01" & Date <= "2007-02-02")

#Plot 3
with(hpc1, plot(Time, Sub_metering_1, type = "l", ylab = "Energy Sub Metering"))
with(hpc1, lines(Time, Sub_metering_2, type = "l", col="red"))
with(hpc1, lines(Time, Sub_metering_3, type = "l", col="blue"))
legend("topright", lty=1, col = c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#create file and close device
dev.copy(png, file = "plot3.png")
dev.off()