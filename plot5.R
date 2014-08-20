# Create plot5

# Loading of data is in main.R
source("./main.R")
library(ggplot2)

NEI.baltimore <- NEI[NEI$fips == "24510", ]

# According to page 198 of the codebook at 
# http://www.epa.gov/ttn/chief/net/2011nei/2011_nei_tsdv1_draft2_june2014.pdf
# "The four sectors for on-road mobile sources include emissions from motorized vehicles that are normally 
# operated on public roadways". Furthermore the definition of "motor vehicle" at
# http://www.law.cornell.edu/uscode/text/18/31 only mentions highway based transport.
#
# I take that to mean that only the four "Mobile - On-Road" EIS sectors are relevant
# i.e. aircraft, locomotives and marine vessels are not included.

motor.vehicle.sources = SCC[grepl("^Mobile - On-Road", SCC$EI.Sector, ignore.case=TRUE), ]

NEI.baltimore.mv = NEI.baltimore[NEI.baltimore$SCC %in% motor.vehicle.sources$SCC, ]

dev <- png(filename = "plot5.png", width = 480, height = 480, units = "px")

NEI.baltimore.mv.aggregated <- aggregate(Emissions~year, data=NEI.baltimore.mv, sum)

g <- ggplot(NEI.baltimore.mv.aggregated, aes(year, Emissions)) 
g <- g + geom_point()
g <- g + labs(title = expression(atop("Emissions from motor vehicles", scriptstyle('Baltimore City, Maryland'))))
g <- g + labs(y = expression('Total yearly PM'[2.5]~'in tons'))

print(g)

dev.off()