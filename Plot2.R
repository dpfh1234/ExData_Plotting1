# Read Data into R 
  file <- ("household_power_consumption.txt")
  df <- read.table(file, header = TRUE, sep = ";")
  
  sub.df <- df[df$Date %in% c("1/2/2007","2/2/2007") ,]
  
  sub.df$datetime <- strptime(paste(sub.df$Date, 
                                    sub.df$Time, 
                                    sep=" "), 
                              "%d/%m/%Y %H:%M:%S") 

# Create the Plot
  sub.df$Globalactivepower <- as.numeric(sub.df$Global_active_power)
  
  png("Plot2.png", width=480, height=480)
  
  plot(sub.df$datetime, 
       sub.df$Globalactivepower,
       type = "l",
       xlab="", 
       ylab="Global Active Power (kilowatts)")
  
  dev.off()
  
  
  

