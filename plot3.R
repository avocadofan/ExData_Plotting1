source('getdata.R')

png(filename = "plot3.png",
    width = 480,
    height = 480)

xrange <- range(powerdata$DateTime) 
yrange <- c(0,38)
plot(xrange,yrange,type="n",ylab="Energy sub metering",xlab="")
with(powerdata,lines(DateTime,Sub_metering_1,col="black"))
with(powerdata,lines(DateTime,Sub_metering_2,col="red"))
with(powerdata,lines(DateTime,Sub_metering_3,col="blue"))
legend('topright', 
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3") , 
       lty=1, 
       col=c('black', 'red', 'blue'))


dev.off()