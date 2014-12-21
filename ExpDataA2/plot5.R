
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)

NEI_Baltimore <- subset(NEI, fips == "24510")
NEI_Baltimore_OR <- subset(NEI_Baltimore, type == "ON-ROAD")
NEI_Baltimore_OR_2 <- aggregate(Emissions~year,NEI_Baltimore_OR,sum)
g <- ggplot(NEI_Baltimore_OR_2, aes(year,Emissions))

png(file = "plot5.png")

g  + geom_point(pch=1, size=4)+ geom_line(color = "blue",size = 1) + guides(size=FALSE) + 
      labs(title = "Motor Vehicle PM2.5 Emissions (Baltimore)", x = "Year", y = "Total Emissions (tons)")

dev.off()