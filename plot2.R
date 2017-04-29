# Before run this code, you must download data from website in the link below
# https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip
# unzip the downloaded file into folder name household in your working directory

# set the path to data file
file_path<-"./household/household_power_consumption.txt"

# read data from file
data<-read.table(file_path,header = TRUE,sep = ";",na.strings="?")
# change type of variable Date of data to datetime format "dd/mm/yyyy
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# get subset of data which Date >= "2007-02-01" & Date <= "2007-02-02"
sub_data<-subset(data,data$Date >= "2007-02-01" & data$Date <= "2007-02-02")

# Join colume Date and Time to make datetime 
datetime<-paste(sub_data$Date,sub_data$Time,sep=" ")
datetime<-as.POSIXlt(datetime)

#plot Global active power vs datetime
plot(datetime, sub_data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#saving plot to png file
dev.copy(png,"plot2.png",width=480, height=480)
dev.off()