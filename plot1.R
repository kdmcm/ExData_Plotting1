## Read data to electrical data variable
ed <- read.table("household_power_consumption.txt", header=TRUE, na.strings=c("?"), sep=";", dec=".")

##convert date column to date type
ed$Date <- as.Date(ed$Date, format="%d/%m/%Y")

## Get only the data we need for those days
startdate <- as.Date("01/02/2007", format="%d/%m/%Y")
enddate <- as.Date("02/02/2007", format="%d/%m/%Y")

edSub <- subset(ed, ed$Date >= startdate & ed$Date <= enddate )

#set output device and create historgram
png(file = "plot1.png")
hist(edSub$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()