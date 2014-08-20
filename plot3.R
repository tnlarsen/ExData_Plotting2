# Create plot3

# Loading of data is in main.R
source("./main.R")
library(ggplot2)

NEI.baltimore <- NEI[NEI$fips==24510, ]

NEI.baltimore.aggregated <- aggregate(Emissions~year + type, data=NEI.baltimore, sum)

dev <- png(filename = "plot3.png", width = 480, height = 480, units = "px")


g <- ggplot(NEI.baltimore.aggregated, aes(year, Emissions)) 
g <- g + geom_point()
g <- g + facet_wrap(facets = ~ type)
g <- g + labs(title = expression(atop("Emissions per source", scriptstyle('Baltimore City, Maryland'))))
g <- g + labs(y = expression('Yearly total PM'[2.5]~'in tons'))

print(g)

dev.off()

