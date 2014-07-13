setwd("C:\\Users\\Carlo\\Documents\\R\\exploratory_data_analysis\\exdata-data-household_power_consumption")

raw<-read.csv("household_power_consumption.txt",sep=';')

raw$Date<-as.Date(raw$Date,"%d/%m/%Y")


raw.date<-raw[which(raw$Date>='2007-02-01'& raw$Date<='2007-02-02' ),]


plot1<-hist(as.numeric(as.character(raw.date$Global_active_power)),col="red",
            main="Global Active power",xlab="Global Active power(Kilowatts)")

dev.copy(png,"plot1.png")
dev.off()