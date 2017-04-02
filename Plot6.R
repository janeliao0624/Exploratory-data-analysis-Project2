##Q6 Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle 
##sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over 
##time in motor vehicle emissions?

setwd('C:/Users/Jane_Liao/Desktop/JL/Coursera/4. Exploratory Data Analysis/W4/')
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEIsub <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",  ]

m6 <- aggregate(Emissions ~ year + fips, NEIsub, sum)
m6$fips[m6$fips=="24510"] <- "Baltimore, MD"
m6$fips[m6$fips=="06037"] <- "Los Angeles, CA"
m6
png("plot6.png", width=1040, height=480)
g <- ggplot(m6, aes(factor(year), Emissions))
g <- g + facet_grid(. ~ fips)
g <- g + geom_bar(stat="identity")  +
        xlab("year") +
        ylab(expression("Total PM2.5 Emissions")) +
        ggtitle("Total Emissions from motor vehicle in Baltimore City, MD vs Los Angeles, CA 1999-2008")
print(g)
dev.off()