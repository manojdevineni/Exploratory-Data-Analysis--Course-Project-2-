## Ensure that "summarySCC_PM2.5.rds" and "source_classification_Code.rds" are located in the current workng directory
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from all sources 
# for each of the years 1999, 2002, 2005, and 2008.

## Aggregate total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008
aggregateEmissionsByYear <- aggregate(Emissions ~ year, NEI, sum)

png('plot1.png')
barplot(height=aggregateEmissionsByYear$Emissions/10^6, names.arg=aggregateEmissionsByYear$year, xlab="years", ylab=expression('Total PM'[2.5]*' emission (10^6 tons)'),main=expression('PM'[2.5]*' emissions trend from 1999 to 2008'))
dev.off()