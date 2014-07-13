#save to a temporary folder the file at this url  https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip

raw<-read.csv("household_power_consumption.txt",sep=';')

raw$Date<-as.Date(raw$Date,"%d/%m/%Y")


raw.date<-raw[which(raw$Date>='2007-02-01'& raw$Date<='2007-02-02' ),]


raw.date["date_time"]<-as.POSIXct(paste(raw.date$Date, raw.date$Time), format="%Y-%m-%d %H:%M:%S")


raw.date["date_time"]<-as.POSIXct(paste(raw.date$Date, raw.date$Time), format="%Y-%m-%d %H:%M:%S")


plot4<-   
  par(mfrow=c(2,2),mar=c(4,4,2,1),oma=c(0,0,2,0))

  with(raw.date,{
  
  plot(raw.date$date_time,as.numeric(as.character(raw.date$Global_active_power)),type="l"
       ,ylab="Global_active_Power",xlab="")
  
  plot(raw.date$date_time,as.numeric(as.character(raw.date$Voltage)),type="l",
       ylab="Voltage",xlab="datetime")    
{
    plot(raw.date.meltering$date_time,
         as.numeric(as.character(raw.date.meltering$Sub_metering_1)),
         type="l",ylim=c(0,max(as.numeric(as.character(raw.date.meltering$Sub_metering_1)))),
         ylab="",xlab="")
    
    par(new=T)
    
    plot(raw.date.meltering$date_time,
         as.numeric(as.character(raw.date.meltering$Sub_metering_2)),
         type="l",col="red",axes=F,ylim=c(0,max(as.numeric(as.character(raw.date.meltering$Sub_metering_1)))),
         ylab="",xlab="")
    
    par(new=T)
    plot(raw.date.meltering$date_time,
         as.numeric(as.character(raw.date.meltering$Sub_metering_3)),
         type="l",col="blue",axes=F,ylim=c(0,max(as.numeric(as.character(raw.date.meltering$Sub_metering_1)))),
         ylab="Energy sub metering",xlab="")
    
    legend("topright",9.5, 
           c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
           lty=c(1,1),               
           lwd=c(2.5,2.5),col=c("black","blue","red")) 
    
    
    par(new=F)
  }

plot(raw.date$date_time,as.numeric(as.character(raw.date$Global_reactive_power)),type="l", 
     ylab="Global_reactive_power",xlab="datetime")


mtext("plot4",outer=TRUE)
}
)


dev.copy(png,"plot4.png")
dev.off()
