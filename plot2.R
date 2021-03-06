unzip(zipfile = 'exdata-data-household_power_consumption.zip')
house.power = read.table(file='./household_power_consumption.txt', header=T, sep=';', na.strings='?')
house.power$Date_Time = as.POSIXct(paste(house.power[,1], house.power[,2]), format="%d/%m/%Y %H:%M:%S")
house.power = house.power[,c(10,2:9)]
house.power = subset(house.power, house.power$Date_Time > as.POSIXct('2007-02-01 00:00:00') & house.power$Date_Time <   as.POSIXct('2007-02-03 00:00:00'))
png(filename = 'plot1.png', width = 480, height = 480)
plot(house.power$Date_Time, house.power$Global_active_power, xlab = '', ylab = 'Global Active Power (kilowatts)', type='l', cex.lab=0.8)
dev.off()
