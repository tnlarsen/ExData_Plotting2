# Create plot3

# Loading of data is in main.R
source("./main.R")

NEI.baltimore <- NEI[NEI$fips==24510, ]

library(ggplot2)

dev <- png(filename = "plot3.png", width = 480, height = 480, units = "px")


g <- ggplot(NEI.baltimore, aes(year, Emissions)) 
g <- g + geom_point(alpha = 1/2)
g <- g + facet_wrap(facets = ~ type, scales = "free_y", nrow=1)
g <- g + geom_smooth(method="lm")
g <- g + labs(title = "Emissions per source\n(note the difference in scale)")
g <- g + labs(y = expression('Yearly total PM'[2.5]~'in tons'))

print(g)

dev.off()