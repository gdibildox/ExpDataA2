
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI_2 <- aggregate(Emissions~year,NEI,sum)

png(file = "plot1.png")

plot(NEI_2$year, NEI_2$Emissions, main = "Total PM2.5 Emissions (all Sources) - US" ,xlab = "Year", ylab = "Total Emissions (tons)", type='o')

dev.off()
