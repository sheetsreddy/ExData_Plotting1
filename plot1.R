
# Coursera Exploratory Data Analysis Project 1
# Read household power consumption data from txt file to dataframe data

data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",stringsAsFactors=F)

# convert Date from factor to Date format
data$Date <- as.Date(data$Date,format="%d/%m/%Y")

#extract rows with dates between 2007-02-01 and 2007-02-02
data <- subset(data,data$Date >= "2007-02-01" & Date <= "2007-02-02")

#merge data and time variables from dataframe data and convert into Date Time format
datetime <- paste(data$Date, data$Time)
datetime <- as.POSIXlt(strptime(datetime, format="%Y-%m-%d %H:%M:%S"))

#open png file to write output
png(file="plot1.png",width=480,height=480)

#create histogram of Global active power
hist(data$Global_active_power,xlab="Global Active Power(kilowatts)",col="red",main="Global Active Power")

#close device so output is written to png file
dev.off()