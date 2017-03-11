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
  sub.df$Globalactivepower <- as.numeric(sub.df$Global_active_power)
  sub.df$sub.metering.1 <- as.numeric(sub.df$Sub_metering_1)
  sub.df$sub.metering.2 <- as.numeric(sub.df$Sub_metering_2)
  sub.df$sub.metering.3 <- as.numeric(sub.df$Sub_metering_3)
  sub.df$global.reactive.power <- as.numeric(sub.df$Global_reactive_power)
  sub.df$voltage <- as.numeric(sub.df$Voltage)
  
  png("Plot4.png", width=480, height=480)
  par(mfrow = c(2, 2))

  plot(x    = sub.df$datetime, 
       y    = sub.df$Globalactivepower,
       type = "l",
       xlab = "", 
       ylab = "Global Active Power (kilowatts)",
       cex  = 0.2)
  
  plot(x    = sub.df$datetime, 
       y    = sub.df$voltage, 
       type = "l", 
       xlab = "datetime", 
       ylab = "Voltage")

  plot(x     = sub.df$datetime, 
       y     = sub.df$sub.metering.1,
       type  = "l",
       ylab  = "Energy Submetering", 
       xlab  = "")
  lines(x    = sub.df$datetime, 
        y    = sub.df$sub.metering.2, 
        type = "l", 
        col  = "red")
  lines(x    = sub.df$datetime, 
        y    = sub.df$sub.metering.3, 
        type = "l", 
        col  = "blue")
  legend(x   = "topright", 
         y   = c("Sub_metering_1", 
                 "Sub_metering_2", 
                 "Sub_metering_3"), 
         lty = 1, 
         lwd = 2, 
         col = c("black", "red", "blue"))
  
  plot(x    = sub.df$datetime,
       y    = sub.df$global.reactive.power,
       type = "l",
       xlab = "datetime",
       ylab = "Global_reative_power")
  
  dev.off()




