powerUsage <- read.csv("2DayData.csv",sep=" ")
powerUsage$DT <- as.POSIXct(paste(powerUsage$Date, powerUsage$Time), format="%Y-%m-%d %H:%M:%S")


png(filename = "plot4.png",width = 480, height = 480, units = "px", pointsize = 12)
par(mfrow=c(2,2))

#Graph 1
gap <- as.character(powerUsage$Global_active_power)
gap_numeric <- as.numeric(gap)
plot(gap_numeric ~ powerUsage$DT,col="black",ylab="Global Active Power",type="l",xlab="")


#Graph 2
volt <- as.character(powerUsage$Voltage)
volt_numeric <- as.numeric(volt)
plot(volt_numeric ~ powerUsage$DT,col="black",ylab="Voltage",xlab="datetime",type="l")

#graph 3
as.character(powerUsage$Sub_metering_1)
sm1_numeric <- as.numeric(sm1)
sm2 <- as.character(powerUsage$Sub_metering_2)
sm2_numeric <- as.numeric(sm2)
sm3 <- as.character(powerUsage$Sub_metering_3)
sm3_numeric <- as.numeric(sm3)
plot(sm1_numeric ~ powerUsage$DT,col="black",ylab="Energy sub metering",type="l",xlab="")
lines(sm2_numeric ~ powerUsage$DT,col="red")
lines(sm3_numeric ~ powerUsage$DT,col="blue")
legend("topright",col=c("black","red","blue"),legend=c("sub metering 1","sub metering 2","sub metering 3"),cex = .7, lwd = 3)

grp <- as.character(powerUsage$Global_reactive_power)
grp_numeric <- as.numeric(grp)
plot(grp_numeric ~ powerUsage$DT,col="black",ylab="Global_reactive_power",xlab="datetime",type="l")

dev.off()
