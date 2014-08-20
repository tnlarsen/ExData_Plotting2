# Create plot6

# Loading of data is in main.R
source("./main.R")
library(ggplot2)

NEI.bc.la <- NEI[NEI$fips %in% c("24510", "06037"), ]

# See explanation for subsetting in plot5.R
motor.vehicle.sources = SCC[grepl("^Mobile - On-Road", SCC$EI.Sector, ignore.case=TRUE), ]

NEI.bc.la.mv = NEI.bc.la[NEI.bc.la$SCC %in% motor.vehicle.sources$SCC, ]

NEI.bc.la.mv.aggregated <- aggregate(Emissions~year + fips, data=NEI.bc.la.mv, sum)

#Put in some human readable names
NEI.bc.la.mv.aggregated[NEI.bc.la.mv.aggregated$fips == "06037",]$fips <- "Los Angeles Country"
NEI.bc.la.mv.aggregated[NEI.bc.la.mv.aggregated$fips == "24510",]$fips <- "Baltimore City"

#dev <- png(filename = "plot6.png", width = 480, height = 480, units = "px")

g <- ggplot(NEI.bc.la.mv.aggregated, 
            aes(year, Emissions, group = fips, colour = fips)) 
g <- g + geom_line()
g <- g + labs(title = expression(atop("Emissions from motor vehicles")))
g <- g + labs(y = expression('Total yearly PM'[2.5]~'in tons'))

print(g)


#dev.off()