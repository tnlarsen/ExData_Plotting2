# Create plot4

# Loading of data is in main.R
source("./main.R")

library(ggplot2)


# Based on inspection of the SCC codes it _seems_ that SCC.Level.One contains 
# the emitting activity and that SCC.Level.Three contains the material involved
# therefore base the selection of the sources on these two columns
coal.combustion.sources = SCC[grepl("combustion", SCC$SCC.Level.One, ignore.case = TRUE), ]
coal.combustion.sources = coal.combustion.sources[grepl("coal", coal.combustion.sources$SCC.Level.Three, ignore.case = TRUE), ]

NEI.coalcomb = NEI[NEI$SCC %in% coal.combustion.sources$SCC, ]

#dev <- png(filename = "plot4.png", width = 480, height = 480, units = "px")


g <- ggplot(NEI.coalcomb, aes(year, Emissions)) 
g <- g + geom_point(alpha = 1/2)
g <- g + facet_wrap(facets = ~ type, scales = "free_y", nrow=1)
g <- g + geom_smooth(method="lm")
g <- g + labs(title = "Emissions from coal combustion")
g <- g + labs(y = expression('Yearly PM'[2.5]~'in tons'))

print(g)

#dev.off()