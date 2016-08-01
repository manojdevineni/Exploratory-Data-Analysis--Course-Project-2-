library(ggplot2)

# Compare emissions from motor vehicle sources in Baltimore City with emissions from motor 
# vehicle sources in Los Angeles County, California (fips == "06037"). 
# Which city has seen greater changes over time in motor vehicle emissions?

# 24510 is Baltimore
# Subset by type 'ON-ROAD'and Baltimore and LosAngeles Cities in NEI
subsetNEI <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",  ]

aggregateByYearAndFips <- aggregate(Emissions ~ year + fips, subsetNEI, sum)

png("plot6.png", width=1040, height=480)
g <- ggplot(aggregateByYearAndFips, aes(factor(year), Emissions))
g <- g + facet_grid(. ~ fips)
g <- g + geom_bar(stat="identity")  +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from motor vehicle in Baltimore City vs Los Angeles based on data from 1999-2008')
print(g)
dev.off()