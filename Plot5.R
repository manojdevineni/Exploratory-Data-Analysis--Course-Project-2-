# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

# 24510 is Baltimore
# subset type 'ON-ROAD' in NEI which relates to motor vehicles
subsetNEI <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]

aggregateByYear <- aggregate(Emissions ~ year, subsetNEI, sum)



png("plot5.png", width=840, height=480)
g <- ggplot(aggregateByYear, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Emissions from motor vehicle in Baltimore City, Maryland from 1999 to 2008')
print(g)
dev.off()