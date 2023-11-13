
## Read data
powerdata <- read.table("data/household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";"  )

## Create column in table with date and time merged together
FullTimeDate <- strptime(paste(powerdata$Date, powerdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
powerdata <- cbind(powerdata, FullTimeDate)

#Subset data from the dates 2007-02-01 and 2007-02-02
subsetdata <- powerdata[powerdata$Date %in% c("1/2/2007","2/2/2007"), ]

## Plot globalactivepower vs date&time
png("plot3.png", width=480, height=480)
with(subsetdata, plot(FullTimeDate, Sub_metering_1, type="l", xlab="Day", ylab="Energy sub metering"))
lines(subsetdata$FullTimeDate, subsetdata$Sub_metering_2,type="l", col= "red")
lines(subsetdata$FullTimeDate, subsetdata$Sub_metering_3,type="l", col= "blue")
legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, lwd=2, col = c("black", "red", "blue"))
dev.off()

