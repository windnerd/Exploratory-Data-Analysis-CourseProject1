# plot2.R
# read in the data
wd<-getwd()
fn <-paste(wd, "household_power_consumption.txt", sep ="\\", collapse = NULL)
pwrcon<-read.table(fn,sep = ";",header = TRUE,na.strings = "?")

# plot2.png
# find the data for data range of interst
ts<-as.Date("2007-02-01",format= "%Y-%m-%d")
te<-as.Date("2007-02-02",format= "%Y-%m-%d")
dstr<-as.Date(pwrcon$Date,format = "%d/%m/%Y")
pwrcon_sub<-subset(pwrcon,dstr>=ts & dstr<=te)
dstr_sub<-as.Date(pwrcon_sub$Date,format = "%d/%m/%Y")

plot(as.double(pwrcon_sub$Global_active_power),ylab="Global Active Power (kilowatts)",col="black",lty=1,typ="l",xlab = NA,axes = F)
box()

# find the indeces of the first instance of each day
daystring<-unique(weekdays(dstr_sub))
daytick=NULL
for (i in 1:length(daystring)){
    indexes<-which(weekdays(dstr_sub)==daystring[i])
    daytick[i]<-indexes[1]
}
daytick[length(daytick)+1]<-length(weekdays(dstr_sub))
lastdaystr = weekdays(dstr_sub[length(dstr_sub)]+1)
axis(1,at=daytick,labels=c("Thurs","Fri",substr(lastdaystr,1,3)))
ytick<-c(0,2,4,6,8)
axis(2,at=ytick,labels=ytick)

# write plot to file
dev.copy(png,'plot2.png')
dev.off()