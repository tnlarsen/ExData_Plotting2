
# Read the data

if(!exists("NEI") | !exists("SCC")) {
  NEI <- readRDS("./data/summarySCC_PM25.rds")
  SCC <- readRDS("./data/Source_Classification_Code.rds")
}


