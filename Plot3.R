##Q3 Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) 
##variable, which of these four sources have seen decreases in emissions from 1999-2008 for 
##Baltimore City? Which have seen increases in emissions from 1999-2008? Use the ggplot2 
##plotting system to make a plot answer this question.

setwd('C:/Users/Jane_Liao/Desktop/JL/Coursera/4. Exploratory Data Analysis/W4/')
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEIsub <- NEI[NEI$fips=="24510", ]
m2 <- aggregate(Emissions ~ year + type, NEIsub, sum)

png("plot3.png", width=640, height=480)
g <- ggplot(m2, aes(year, Emissions, color = type))
g <- g + geom_line() +
        xlab("Year") +
        ylab("Total PM2.5 Emissions") +
        ggtitle('Total Emissions in Baltimore City, Maryland from 1999 to 2008')
print(g)
dev.off()