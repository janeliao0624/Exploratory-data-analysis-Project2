##Q4 Across the United States, how have emissions from coal combustion-related sources 
##changed from 1999-2008?
setwd('C:/Users/Jane_Liao/Desktop/JL/Coursera/4. Exploratory Data Analysis/W4/')
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEISCC <- merge(NEI, SCC, by="SCC")
coalMatches  <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)
NEISCCsub <- NEISCC[coalMatches, ]

m3 <- aggregate(Emissions ~ year, NEISCCsub, sum)

png("plot4.png", width=640, height=480)
g <- ggplot(m3, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
        xlab("Year") +
        ylab("Total PM2.5 Emissions") +
        ggtitle('Total Emissions from coal combustion-related sources from 1999-2008')
print(g)
dev.off()