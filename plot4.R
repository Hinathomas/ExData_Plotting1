data <- read.table("household_power_consumption.txt",sep=";")
colnames(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
power <- subset(data,data$Date=="01/02/2007" | data$Date =="02/02/2007")

data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")


#code for plot.04
par(mfrow=c(2,2)
with(power,{
  plot(power$Time,as.numeric(as.character(power$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
  plot(power$Time,as.numeric(as.character(power$Voltage)), type="l",xlab="datetime",ylab="Voltage")
  plot(power$Time,power$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  with(power,lines(Time,as.numeric(as.character(Sub_metering_1))))
  with(power,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
  with(power,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
  legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
  plot(power$Time,as.numeric(as.character(power$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})

dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()
