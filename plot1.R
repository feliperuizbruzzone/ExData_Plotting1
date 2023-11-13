
#Import data from txt file
data <- read.table("data/household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", na.strings = "?")

#Subset data from the dates 2007-02-01 and 2007-02-02
data <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

#Plot the histogram plot
hist(data$Global_active_power, col="red", border="black", main ="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")


## plot histogram of global active power for those 2 days
png("plot1.png", width=480, height=480)
hist(data$Global_active_power, col="red", border="black", main ="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()
