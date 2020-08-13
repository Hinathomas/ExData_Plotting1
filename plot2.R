data <- read.table("household_power_consumption.txt",sep=";")
colnames(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

#taking the subset of data
power <- subset(data,data$Date=="01/02/2007" | data$Date =="02/02/2007")

data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

#code for plot.02
plot(power$Time,as.numeric(as.character(power$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 
title(main="Global Active Power Vs Time")

# Save file
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()
