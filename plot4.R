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

# open png file to write output
png(file="plot4.png",width=480,height=480)

# set margins and number of rows and columns
par(mfrow=c(2,2),mar=c(4,4,3,3))

#plot graph 1
plot(datetime,data$Global_active_power,type="l",xlab="",ylab="Global Active Power")

#plot graph 2
plot(datetime,data$Voltage,type="l",xlab="datetime",ylab="Voltage")

#plot graph 3
plot(datetime,data$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering",col="black",yaxt='n',ylim=c(-1,37))
axis(2,tick=TRUE,at=c(0,10,20,30),labels=c(0,10,20,30))
lines(datetime,data$Sub_metering_2,col="red")
lines(datetime,data$Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=0.2,lty=1,bty="n",cex=0.75)

#plot graph 4
plot(datetime,data$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")

#close device so output is written to png file
dev.off()