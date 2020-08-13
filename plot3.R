data <- read.table("household_power_consumption.txt",sep=";")
colnames(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
power <- subset(data,data$Date=="01/02/2007" | data$Date =="02/02/2007")

data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")


#code for plot.03
plot(power$Time,power$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(power,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(power,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(power,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
title(main="Energy sub-metering")

# Save file
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()
