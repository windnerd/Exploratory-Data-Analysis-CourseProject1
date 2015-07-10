# plot1.R
# read in the data
wd<-getwd()
fn <-paste(wd, "household_power_consumption.txt", sep ="\\", collapse = NULL)
pwrcon<-read.table(fn,sep = ";",header = TRUE,na.strings = "?")

# plot1.png
# find the data for data range of interst
ts<-as.Date("2007-02-01",format= "%Y-%m-%d")
te<-as.Date("2007-02-02",format= "%Y-%m-%d")
pwrcon_sub<-subset(pwrcon,as.Date(pwrcon$Date,format = "%d/%m/%Y")>=ts & as.Date(pwrcon$Date,format = "%d/%m/%Y")<=te)
head(pwrcon_sub)
hist(as.double(pwrcon_sub$Global_active_power),main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency",col="red")
# write plot to file
dev.copy(png,'plot1.png')
dev.off()