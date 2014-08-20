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

dev <- png(filename = "plot4.png", width = 480, height = 480, units = "px")

year.sum <- with(NEI.coalcomb, tapply(Emissions, year, sum))
years <- unique(NEI.coalcomb$year)
df <- data.frame(year = years, sums = year.sum)

g <- ggplot(df, aes(year, sums)) 
g <- g + geom_point(alpha = 1/2)
g <- g + labs(title = "Emissions from coal combustion")
g <- g + labs(y = expression('Total yearly PM'[2.5]~'in tons'))

print(g)

dev.off()