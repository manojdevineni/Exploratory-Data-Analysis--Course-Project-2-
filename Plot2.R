# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008?
baltimoreNEI  <- NEI[NEI$fips=="24510", ]

baltimoreAggregateEmissionsByYear <- aggregate(Emissions ~ year, baltimoreNEI, sum)

png('plot2.png')
barplot(height=baltimoreAggregateEmissionsByYear$Emissions, names.arg=baltimoreAggregateEmissionsByYear$year, xlab="years", ylab=expression('Total PM'[2.5]*' emission in Baltimire City'),main=expression('PM'[2.5]*' emissions trend from 1999 to 2008 in Baltimore City'))
dev.off()
