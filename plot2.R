## loading data and subsetting the proper dates (2/1/2007-2/2/2007)
data_set <- read.table("household_power_consumption.txt", sep = ";", skip = 1)
names(data_set) <- c("date", "time", "global_active_power", "global_reactive_power", 
                     "voltage", "global_intensity", "sub_metering_1", "sub_metering_2", "sub_metering_3")
sub_data <- subset(data_set, data_set$date=="1/2/2007" | data_set$date== "2/2/2007")
sub_data[sub_data == "?"] <- NA   ## convert missing values from "?" to NA
sub_data1 <- transform(sub_data, global_active_power = as.numeric(global_active_power))

## set the date and time to the right format
sub_data1 <- transform(sub_data1, date = as.Date(date))
sub_data1$time <- strptime(sub_data1$time, format = "%H:%M:%S")
sub_data1[1:1440, "time"] <- format(sub_data1[1:1440, "time"], "2007-02-01 %H:%M:%S")
sub_data1[1441:2880, "time"] <- format(sub_data1[1441:2880, "time"], "2007-02-02 %H:%M:%S")

## begin graphing analysis 
png(filename = "plot2.png")    ## create png file
plot(sub_data1$time, sub_data1$global_active_power, type = "l", yaxt = "n", xlab = " ", 
     ylab = "Global Active Power (kilowatts)")
axis(2, at = c( 0, 1000, 2000, 3000), labels = c(0, 2, 4, 6)) ## specify y-axis
dev.off()
