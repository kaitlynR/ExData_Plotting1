## loading data and subsetting the proper dates (2/1/2007-2/2/2007)
data_set <- read.table("household_power_consumption.txt", sep = ";", skip = 1)
names(data_set) <- c("date", "time", "global_active_power", "global_reactive_power", 
                     "voltage", "global_intensity", "sub_metering_1", "sub_metering_2", "sub_metering_3")
sub_data <- subset(data_set, data_set$date=="1/2/2007" | data_set$date== "2/2/2007")
sub_data1 <- transform(sub_data, global_active_power = as.numeric(global_active_power))


## begin graphing analysis 
png(filename = "plot1.png")    ## create png file
hist(sub_data1$global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()