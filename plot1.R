## Read and Clean Input
data<-read.csv2("household_power_consumption.txt",stringsAsFactors=FALSE)
auswahl<-(data$Date == "1/2/2007" | data$Date == "2/2/2007")
data2<-data[auswahl,]

data2$Date<-strptime(data2$Date, "%d/%m/%Y")
data2$DateTime <- strptime(paste(data2$Date, data2$Time), "%Y-%m-%d %H:%M:%S")

data2$Global_active_power<-as.double(data2$Global_active_power)

data2$Sub_metering_1<-as.double(data2$Sub_metering_1)
data2$Sub_metering_2<-as.double(data2$Sub_metering_2)
data2$Sub_metering_3<-as.double(data2$Sub_metering_3)



## Create 1. Plot
png('plot1.png',width = 480, height = 480)
hist(data2$Global_active_power,xlab="Global Active Power (kilowatts)",main="Global Active Power",col="red")
dev.off()