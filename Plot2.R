##Q2 Have total emissions from PM2.5 decreased in the Baltimore City, Maryland 
##(fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering
##this question.

setwd('C:/Users/Jane_Liao/Desktop/JL/Coursera/4. Exploratory Data Analysis/W4/')
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEIsub <- NEI[NEI$fips=="24510", ]
m1<-with(NEIsub,tapply(Emissions,year,sum,na.rm=T))
d1<-data.frame(year=names(m1),sum=m1)
d1
png('plot2.png')
barplot(d1$sum, names.arg=d1$year, xlab="Year", ylab="Total PM2.5 emission",main="Total PM2.5 emissions in the Baltimore City, MD at various years")
dev.off()