##Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
##Using the base plotting system, make a plot showing the total PM2.5 emission from all 
##sources for each of the years 1999, 2002, 2005, and 2008.

setwd('C:/Users/Jane_Liao/Desktop/JL/Coursera/4. Exploratory Data Analysis/W4/')
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

m0<-with(NEI,tapply(Emissions,year,sum,na.rm=T))
d0<-data.frame(year=names(m0),sum=m0)
d0
png('plot1.png')
barplot(d0$sum, names.arg=d0$year, xlab="Year", ylab="Total PM2.5 emission",main="Total PM2.5 emissions at various years")
dev.off()