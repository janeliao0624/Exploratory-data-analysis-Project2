##Q5 How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?
setwd('C:/Users/Jane_Liao/Desktop/JL/Coursera/4. Exploratory Data Analysis/W4/')
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEIsub <- subset(NEI, fips == "24510" & type=="ON-ROAD")
m5 <- aggregate(Emissions ~ year, NEIsub, sum)

png("plot5.png", width=640, height=480)
g <- ggplot(m5, aes(year, Emissions))
g <- g + geom_line() +
        xlab("Year") +
        ylab("Total PM2.5 Emissions") +
        ggtitle('Total Emissions from motor vehicle in Baltimore City, Maryland from 1999 to 2008')
print(g)
dev.off()