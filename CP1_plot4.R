# week 1

library(tidyverse)
library(readr)
power <- read_delim("household_power_consumption.txt",  ";", escape_double = FALSE,
                    col_types = cols(Date = col_date(format = "%d/%m/%Y"),
                                     Time = col_time(format = "%H:%M:%S")), 
                    trim_ws = TRUE)


p20070201 <- power %>% filter(Date == as.Date('01/02/2007', format = "%d/%m/%Y") | Date == as.Date('02/02/2007', format = "%d/%m/%Y"))
tail(p20070201)

# plot 04
par(mfrow = c(2, 2))
plot(p20070201$Global_active_power, type = 'l',
     main = '', xlab = '', ylab = 'Global Active Power, kW')

plot(p20070201$Voltage, type = 'l',
     main = '', xlab = 'datetime', ylab = 'Voltage, V')

plot(p20070201$Sub_metering_1, type = 'l',
     main = '', xlab = '', ylab = 'Global Active Power, kW')
lines(p20070201$Sub_metering_2, col = 'red')
lines(p20070201$Sub_metering_3, col = 'blue')
legend('topright', legend = colnames(p20070201)[7:9], col = c('black', 'red', 'blue'), lty = c(1, 1))

plot(p20070201$Global_reactive_power, type = 'l',
     main = '', xlab = 'datetime', ylab = 'Global_reactive_power, kW')
par(mfrow = c(1, 1))


# ploting
png(file = 'plot4.png', width = 480, height = 480, units = "px")
par(mfrow = c(2, 2))
plot(p20070201$Global_active_power, type = 'l',
     main = '', xlab = '', ylab = 'Global Active Power, kW')

plot(p20070201$Voltage, type = 'l',
     main = '', xlab = 'datetime', ylab = 'Voltage, V')

plot(p20070201$Sub_metering_1, type = 'l',
     main = '', xlab = '', ylab = 'Global Active Power, kW')
lines(p20070201$Sub_metering_2, col = 'red')
lines(p20070201$Sub_metering_3, col = 'blue')
legend('topright', legend = colnames(p20070201)[7:9], col = c('black', 'red', 'blue'), lty = c(1, 1))

plot(p20070201$Global_reactive_power, type = 'l',
     main = '', xlab = 'datetime', ylab = 'Global_reactive_power, kW')
par(mfrow = c(1, 1))
dev.off()

