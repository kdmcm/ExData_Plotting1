## Read data to electrical data variable
ed <- read.table("household_power_consumption.txt", header=TRUE, na.strings=c("?"), sep=";", dec=".")

##convert date column to date type
ed$Date <- as.Date(ed$Date, format="%d/%m/%Y")

## Get only the data we need for those days
startdate <- as.Date("01/02/2007", format="%d/%m/%Y")
enddate <- as.Date("02/02/2007", format="%d/%m/%Y")

edSub <- subset(ed, ed$Date >= startdate & ed$Date <= enddate )

## Create date Time field
edSub$Date <- as.POSIXct(paste(edSub$Date, edSub$Time), format="%Y-%m-%d %H:%M:%S")

#set output device 
png(file = "plot4.png")

## set grid for 2 x 2 plot
par(mfcol=c(2,2))

## add first plot
plot(edSub$Date, edSub$Global_active_power, xlab="", ylab="Global Active Power", type="o", pch=NA)

## Add second plot
plot(edSub$Date, edSub$Sub_metering_1, xlab="", ylab="Energy sub metering", type="o", pch=NA)
points(edSub$Date, edSub$Sub_metering_2, col="red", type="o", pch=NA)
points(edSub$Date, edSub$Sub_metering_3, col="blue", type="o", pch=NA)
legend("topright", lwd=1, bty="n", pch=c(NA,NA,NA), col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

## Add Third Plot
with(edSub,plot(Date, Voltage, xlab="datetime",type="o", pch=NA))

## Add fourth Plot
with(edSub, plot(Date, Global_reactive_power, xlab="datetime",type="o", pch=NA))

dev.off()
