library(ggplot2)

# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999 2008 for Baltimore City? 
# Which have seen increases in emissions from 1999 2008? 
# Use the ggplot2 plotting system to make a plot answer this question.

# 24510 is Baltimore, see plot2.R
baltimoreNEI  <- NEI[NEI$fips=="24510", ]

aggregateByYearAndType <- aggregate(Emissions ~ year + type, baltimoreNEI, sum)



png("plot3.png", width=640, height=480)
g <- ggplot(aggregateByYearAndType, aes(year, Emissions, color = type))
g <- g + geom_line() +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Emissions in Baltimore City (from different sources) from 1999 to 2008')
print(g)
dev.off()