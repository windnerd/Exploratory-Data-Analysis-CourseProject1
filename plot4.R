# plot4.R
# read in the data
wd<-getwd()
fn <-paste(wd, "household_power_consumption.txt", sep ="\\", collapse = NULL)
pwrcon<-read.table(fn,sep = ";",header = TRUE,na.strings = "?")

# plot4.png
# find the data for data range of interst
ts<-as.Date("2007-02-01",format= "%Y-%m-%d")
te<-as.Date("2007-02-02",format= "%Y-%m-%d")
dstr<-as.Date(pwrcon$Date,format = "%d/%m/%Y")
pwrcon_sub<-subset(pwrcon,dstr>=ts & dstr<=te)
dstr_sub<-as.Date(pwrcon_sub$Date,format = "%d/%m/%Y")

#create a 2x2 graphics device
par(mfrow=c(2,2))


# -------------------- plot 1 --------------------------
plot(as.double(pwrcon_sub$Global_active_power),ylab="Global Active Power",col="black",lty=1,typ="l",xlab = NA,axes = F)
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
# -------------------- plot 1 --------------------------


# -------------------- plot 2 --------------------------
plot(as.double(pwrcon_sub$Voltage),ylab="Voltage",col="black",lty=1,typ="l",xlab ="datetime",axes = F)
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
ytick<-c(234,238,242,246)
axis(2,at=ytick,labels=ytick)
# -------------------- plot 2 --------------------------

# -------------------- plot 3 --------------------------
plot(as.double(pwrcon_sub$Sub_metering_1),ylab="Energy Sub Metering",col="black",lty=1,typ="l",xlab = NA,axes = F)
box()
lines(as.double(pwrcon_sub$Sub_metering_2),col="red")
lines(as.double(pwrcon_sub$Sub_metering_3),col="blue")
legend('topright', names(pwrcon_sub[7:9]) , lty=1, col=c('black', 'red', 'blue'), bty='n',cex=0.50)

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
ytick<-c(0,10,20,30)
axis(2,at=ytick,labels=ytick)
# -------------------- plot 3 --------------------------

# -------------------- plot 4 --------------------------
plot(as.double(pwrcon_sub$Global_reactive_power),ylab=names(pwrcon_sub[4]),col="black",lty=1,typ="l",xlab = "datetime",axes = F)
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
ytick<-c(0.0,0.1,0.2,0.3,0.4,0.5)
axis(2,at=ytick,labels=ytick,cex.axis=0.7)
# -------------------- plot 4 --------------------------

# write plot to file
dev.copy(png,'plot4.png')
dev.off()