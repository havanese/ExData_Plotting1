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

##create the plot, using ANN=FALSE to supress annotations
##type="l" to make lines
plot(createX, powerdata$Global_active_power, ann=FALSE, type='l') 
title(main="",ylab="Global Active Power (kilowatts)")

##save plot to png
dev.copy(png,file="plot2.png")
##close the device
dev.off()