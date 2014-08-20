
# Download and unzip the data file if not already present

file.url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"

zip.file.name <- file.path(".", "data", "NEI_data.zip")
data.dir <- file.path(".", "data")

if(!file.exists(data.dir)) {
    dir.create(data.dir)
    
    print('Downloading')
    download.file(url = file.url, destfile = zip.file.name, method = "curl")
    
    print('Unzipping')
    unzip(zip.file.name, exdir = data.dir)
}

# Read the data if the resulting variables does not exist - so we only read them once
if(!exists("NEI") | !exists("SCC")) {
    print('Reading file')
    NEI <- readRDS("./data/summarySCC_PM25.rds")
    SCC <- readRDS("./data/Source_Classification_Code.rds")
}


plotAll <- function() {
    source("./plot1.R")
    source("./plot2.R")
    source("./plot3.R")
    source("./plot4.R")
    source("./plot5.R")
    source("./plot6.R")
}

