
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI_Baltimore <- subset(NEI, fips == "24510")
NEI_Baltimore_2 <- aggregate(Emissions~year,NEI_Baltimore,sum)

png(file = "plot2.png")

plot(NEI_Baltimore_2$year, NEI_Baltimore_2$Emissions, xlab = "Year", ylab = "Total Emissions (tons)",main = "Total PM2.5 Emissions in Baltimore", type='o')

dev.off()