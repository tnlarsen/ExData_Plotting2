# Read the data if the resulting variables does not exist - so we only read them once
# if multiple plots are done in one session 
# I assume that the data files are downloaded and unzipped in a folder called "data"
if(!exists("NEI") | !exists("SCC")) {
    NEI <- readRDS("./data/summarySCC_PM25.rds")
    SCC <- readRDS("./data/Source_Classification_Code.rds")
}

library(ggplot2)

# Based on inspection of the SCC codes it _seems_ that SCC.Level.One contains 
# the emitting activity and that SCC.Level.Three contains the material involved
# therefore base the selection of the sources on these two columns
coal.combustion.sources = SCC[grepl("combustion", SCC$SCC.Level.One, ignore.case = TRUE), ]
coal.combustion.sources = coal.combustion.sources[grepl("coal", coal.combustion.sources$SCC.Level.Three, ignore.case = TRUE), ]

NEI.coalcomb = NEI[NEI$SCC %in% coal.combustion.sources$SCC, ]

dev <- png(filename = "plot4.png", width = 480, height = 480, units = "px")

NEI.coalcomb.aggregated <- aggregate(Emissions~year, data=NEI.coalcomb, sum)

g <- ggplot(NEI.coalcomb.aggregated, aes(year, Emissions)) 
g <- g + geom_point()
g <- g + labs(title = "Emissions from coal combustion across USA")
g <- g + labs(y = expression('Yearly PM'[2.5]~'in tons'))

print(g)

dev.off()