# Create plot2

# Loading of data is in main.R
source("./main.R")

NEI.baltimore <- NEI[NEI$fips==24510, ]
year.sums <- with(NEI.baltimore, tapply(Emissions, year, sum))

dev <- png(filename = "plot2.png", width = 480, height = 480, units = "px")

plot(x = c(1999, 2002, 2005, 2008), 
     year.sums, 
     xlab = "Year", 
     ylab = expression('PM'[2.5]~'in tons'),
     xlim = c(1998,2008),
     main = expression(atop('Yearly total PM'[2.5],scriptstyle('Baltimore City, Maryland'))), 
     pch = 16)

dev.off()