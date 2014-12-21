
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)

coal <- grep("[Cc]oal", SCC$EI.Sector)
SCC_coal <- SCC[coal,]
NEI_coal <- merge(NEI,SCC_coal, by = "SCC")
NEI_coal_2 <- aggregate(Emissions~year,NEI_coal,sum)
g <- ggplot(NEI_coal_2, aes(year,Emissions))

png(file = "plot4.png")

g  + geom_point(pch=1, size=4)+ geom_line(color = "red",size = 1) + guides(size=FALSE) + 
      labs(title = "Coal Combustion Related PM2.5 Emissions (US)", x = "Year", y = "Total Emissions (tons)")

dev.off()