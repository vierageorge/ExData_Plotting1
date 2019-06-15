##########################################
#Plot2 generator script                  #
##########################################

#URL to download the data from
data_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

#Download data and unzip
dest_file_path <- "./project_data.zip"
download.file(data_url, destfile =dest_file_path)
unzip(dest_file_path)

#Read the data to a data frame.
file_name <- "household_power_consumption.txt"
data <- read.csv2(file_name, na.strings = "?", dec=".")
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- strptime(data$DateTime, format="%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

date1 <- as.Date("2007-02-01")
date2 <- as.Date("2007-02-02")

data_selected <- data[which(data$Date >= date1 & data$Date <= date2), ]

#Create Histogram
png(filename="plot2.png", width=480, height=480)
plot(data_selected$DateTime, data_selected$Global_active_power, xlab="", ylab="Global active power (kilowatts)", main="", type="n")
lines(data_selected$DateTime, data_selected$Global_active_power)
dev.off()