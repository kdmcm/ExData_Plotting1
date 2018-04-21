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
png(file = "plot2.png")

## create plot
plot(edSub$Date, edSub$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="o", pch=NA)

dev.off()