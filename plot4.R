##read in all the data
originalpowerdata = read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE,na.strings="?",
                  colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
##get the data for the dates 2/1/2007 adn 2/2/2007
powerdatasubset1<-subset(originalpowerdata,Date=="1/2/2007")
powerdatasubset2<-subset(originalpowerdata,Date=="2/2/2007")
##bind them together
powerdata<-rbind(powerdatasubset1,powerdatasubset2)

##create the time progression on the X axis
createX <- strptime(paste(powerdata$Date, powerdata$Time), "%d/%m/%Y %H:%M:%S") 
##prepare for 4 plots, make the text smaller using cex
par(mfrow=c(2,2),cex=.4)

##create the first plot, using ANN=FALSE to supress annotations
##type="l" to make lines
plot(createX, powerdata$Global_active_power, ann=FALSE, type='l') 
title(main="",ylab="Global Active Power (kilowatts)")

##create the second plot, using ANN=FALSE to supress annotations
##type="l" to make lines
plot(createX, powerdata$Voltage, ann=FALSE, type='l') 
title(main="",ylab="Voltage",xlab="datetime")


##create third the plot, using ANN=FALSE to supress annotations
##type="l" to make lines
plot(createX,powerdata$Sub_metering_1,type="n",ann=FALSE)
points(createX,powerdata$Sub_metering_1,col="black",type='l')
points(createX,powerdata$Sub_metering_2,col="red",type='l')
points(createX, powerdata$Sub_metering_3,type='l',col="blue")
title(main="",ylab="Energy sub metering")
##cex=.6 shrinks the legend text, bty=n removes border around legend
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1, col=c("black","red","blue"),cex=.8,bty="n")

##create the fourth plot, using ANN=FALSE to supress annotations
##type="l" to make lines
plot(createX, powerdata$Global_reactive_power, ann=FALSE, type='l') 
title(main="",ylab="Global_reactive_power",xlab="datetime")


##save plot to png
dev.copy(png,file="plot4.png")
##close the device
dev.off()