# reading the data 
data <- read.table("household_power_consumption.txt",sep = ";")
colnames(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

#subsetting data 
power <- subset(data,data$Date=="01/02/2007" | data$Date =="02/02/2007")

#converting date and time
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

#code for plot.01
hist(as.numeric(as.character(power$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
title(main = "Global Active Power")

# saving files
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()



          