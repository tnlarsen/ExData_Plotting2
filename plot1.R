# Read the data if the resulting variables does not exist - so we only read them once
# if multiple plots are done in one session 
# I assume that the data files are downloaded and unzipped in a folder called "data"
if(!exists("NEI") | !exists("SCC")) {
    NEI <- readRDS("./data/summarySCC_PM25.rds")
    SCC <- readRDS("./data/Source_Classification_Code.rds")
}

year.sums <- with(NEI, tapply(Emissions, year, sum))

dev <- png(filename = "plot1.png", width = 480, height = 480, units = "px")

plot(x = c(1999, 2002, 2005, 2008), 
     year.sums, 
     xlab = "Year", 
     ylab = expression('PM'[2.5]~'in tons'),
     main = expression('Yearly total PM'[2.5]), 
     pch = 16)

dev.off()