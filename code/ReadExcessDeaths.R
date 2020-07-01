library(tidyverse)
# Note: xts library may not be loadable when using here library
#library(xts)
library(zoo)
library(scales)
library(doBy)

library(here)

dfExcessDeaths <- read.csv(here("data/ft_excess_deaths.csv"), stringsAsFactors = FALSE)

plotExcessDeaths <- function(dfExcessDeaths, regions) {
  
  dfSub <- dfExcessDeaths[which(dfExcessDeaths$region == regions & 
                                dfExcessDeaths$year == 2020),]

  ggplot(dfSub) + 
    geom_area(fill="lightblue", aes(x=as.Date(date), y=expected_deaths), group=1) + 
    geom_line( color="darkblue", size=1.5, aes(x=as.Date(date), y=expected_deaths), group=1) + 
    geom_ribbon(fill="pink", aes(x=as.Date(date), ymin=expected_deaths, ymax = deaths), group=1) + 
    geom_line(color="maroon", size=0.75, aes(x=as.Date(date), y=deaths), group=1) + 
    scale_x_date(breaks=pretty_breaks()) + aes(xlab="Date", ylab="Deaths")
}
