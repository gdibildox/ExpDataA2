
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)

NEI_Baltimore <- subset(NEI, fips == "24510")

png(file = "plot3.png")

NEI_Baltimore_2 <- aggregate(Emissions~year+type,NEI_Baltimore,sum)
g <- ggplot(NEI_Baltimore_2, aes(year,Emissions))
g + geom_point(aes(color = type, size = 4)) + geom_line(aes(color = type)) + guides(size=FALSE) + 
      labs(title = "PM2.5 Emissions by Source in Baltimore", x = "Year", y = "Total Emissions (tons)")
dev.off()