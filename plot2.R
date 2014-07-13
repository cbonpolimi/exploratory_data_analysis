#save to a temporary folder the file at this url  https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip

raw<-read.csv("household_power_consumption.txt",sep=';')

raw$Date<-as.Date(raw$Date,"%d/%m/%Y")


raw.date<-raw[which(raw$Date>='2007-02-01'& raw$Date<='2007-02-02' ),]


raw.date["date_time"]<-as.POSIXct(paste(raw.date$Date, raw.date$Time), format="%Y-%m-%d %H:%M:%S")

plot2<-with(raw.date,plot(raw.date$date_time,as.numeric(as.character(raw.date$Global_active_power)),type="l",
                          ylab="Global Active power(Kilowatts)",xlab=""))
dev.copy(png,"plot2.png")
dev.off()
