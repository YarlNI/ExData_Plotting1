# week 1

library(tidyverse)
library(readr)
power <- read_delim("household_power_consumption.txt",  ";", escape_double = FALSE,
                    col_types = cols(Date = col_date(format = "%d/%m/%Y"),
                                     Time = col_time(format = "%H:%M:%S")), 
                    trim_ws = TRUE)


p20070201 <- power %>% filter(Date == as.Date('01/02/2007', format = "%d/%m/%Y") | Date == as.Date('02/02/2007', format = "%d/%m/%Y"))
tail(p20070201)

# plot 01
hist(p20070201$Global_active_power, col = 'red',
     main = 'Global Active Power',
     xlab = 'Global Active Power, kW')

# ploting
png(file = 'plot1.png', width = 480, height = 480, units = "px")
hist(p20070201$Global_active_power, col = 'red',
     main = 'Global Active Power',
     xlab = 'Global Active Power, kW')
dev.off()
