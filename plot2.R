
## Read data
powerdata <- read.table("data/household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";"  )

## Create column in table with date and time merged together
FullTimeDate <- strptime(paste(powerdata$Date, powerdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
powerdata <- cbind(powerdata, FullTimeDate)

#Subset data from the dates 2007-02-01 and 2007-02-02
subsetdata <- powerdata[powerdata$Date %in% c("1/2/2007","2/2/2007"), ]

# Plot global active power against time vector
png("plot2.png", width=480, height=480)
with(subsetdata, plot(FullTimeDate, Global_active_power, type="l", xlab="Day", ylab="Global Active Power (kilowatts)"))
dev.off()
