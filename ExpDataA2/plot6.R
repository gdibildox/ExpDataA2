
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)

NEI_Baltimore <- subset(NEI, fips == "24510")
NEI_Baltimore_OR <- subset(NEI_Baltimore, type == "ON-ROAD")
NEI_Baltimore_OR_2 <- aggregate(Emissions~year,NEI_Baltimore_OR,sum)

NEI_LA <- subset(NEI, fips == "06037")
NEI_LA_OR <- subset(NEI_LA, type == "ON-ROAD")
NEI_LA_OR_2 <- aggregate(Emissions~year,NEI_LA_OR,sum)

NEI_BA_LA <- rbind(NEI_Baltimore_OR_2, NEI_LA_OR_2)
NEI_BA_LA$city <- c(rep("Baltimore",4),rep("Los Angeles",4))

png(file = "plot6.png")
g <- ggplot(NEI_BA_LA, aes(year,Emissions))
g  + geom_point(pch=1, size=4, aes(color = city))+ geom_line(aes(color = city),size = 1) + guides(size=FALSE) + 
      labs(title = "PM2.5 Motor Vehicle Emissions in Baltimore and LA", x = "Year", y = "Total Emissions (tons)")
dev.off()