#read in data
hpc <- read.table("household_power_consumption.txt", ";", header = T)

#Convert Date and Time vectors to required formats
hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")
hpc$timetemp <- paste(hpc$Date, hpc$Time)  
hpc$Time <- strptime(hpc$timetemp, format = "%Y-%m-%d %H:%M:%S") 

#take subset of data
hpc1 <- subset(hpc, Date >= "2007-02-01" & Date <= "2007-02-02")

#Plot 2
with(hpc1, plot(Time, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)"))

#create file and close device
dev.copy(png, file = "plot2.png")
dev.off()