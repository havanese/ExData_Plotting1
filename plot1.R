##read in all the data
originalpowerdata = read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE,na.strings="?",
                  colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
##get the data for the dates 2/1/2007 adn 2/2/2007
powerdatasubset1<-subset(originalpowerdata,Date=="1/2/2007")
powerdatasubset2<-subset(originalpowerdata,Date=="2/2/2007")
##bind them together
powerdata<-rbind(powerdatasubset1,powerdatasubset2)
##create the histogram, using ANN=FALSE to supress annotations
hist(powerdata$Global_active_power,col="red",ann=FALSE)
##add annotations
title(main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency")
##save plot to png
dev.copy(png,file="plot1.png")
##close the device
dev.off()