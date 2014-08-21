# Read the data if the resulting variables does not exist - so we only read them once
# if multiple plots are done in one session 
# I assume that the data files are downloaded and unzipped in a folder called "data"
if(!exists("NEI") | !exists("SCC")) {
    NEI <- readRDS("./data/summarySCC_PM25.rds")
    SCC <- readRDS("./data/Source_Classification_Code.rds")
}

library(ggplot2)

NEI.baltimore <- NEI[NEI$fips == "24510", ]

NEI.baltimore.aggregated <- aggregate(Emissions~year + type, data=NEI.baltimore, sum)

dev <- png(filename = "plot3.png", width = 480, height = 480, units = "px")


g <- ggplot(NEI.baltimore.aggregated, aes(year, Emissions)) 
g <- g + geom_point()
g <- g + facet_wrap(facets = ~ type)
g <- g + labs(title = expression(atop("Emissions per source", scriptstyle('Baltimore City, Maryland'))))
g <- g + labs(y = expression('Yearly PM'[2.5]~'in tons'))

print(g)

dev.off()

