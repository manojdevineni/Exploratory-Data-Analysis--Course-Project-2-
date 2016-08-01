mergeNEIandSCC <- merge(NEI, SCC, by="SCC")

library(ggplot2)

# Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?

# fetch all NEIxSCC records with Short.Name (SCC) Coal
Coal  <- grepl("coal", mergeNEIandSCC$Short.Name, ignore.case=TRUE)
subsetByCoal <- mergeNEIandSCC[Coal, ]

aggregateEmissionsByYear <- aggregate(Emissions ~ year, subsetByCoal, sum)



png("plot4.png", width=640, height=480)
g <- ggplot(aggregateEmissionsByYear/10^5, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions/10^5 tons")) +
  ggtitle('Total Emissions from coal sources from 1999 to 2008')
print(g)
dev.off()