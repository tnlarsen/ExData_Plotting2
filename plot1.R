# Loading of data is in main.R
source("./main.R")


year.sums <- with(NEI, tapply(Emissions, year, sum))

dev <- png(filename = "plot1.png", width = 480, height = 480, units = "px")

plot(x = c(1999, 2002, 2005, 2008), 
     year.sums, 
     xlab = "Year", 
     ylab = expression('PM'[2.5]~'in tons'),
     main = expression('Yearly total PM'[2.5]), 
     pch = 16)

dev.off()