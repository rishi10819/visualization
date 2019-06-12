library(dplyr)
library(dslabs)

data(gapminder)

str(gapminder)

colnames (gapminder)
#"country" "year" "infant_mortality" "life_expectancy" "fertility" "population" "gdp" "continent" "region"  


# create a time series plot that covers the period from 1960 to 2010 of 
# life expectancy for Vietnam and the United States, using color to distinguish the two countries. 

my_years <- seq(1960,2010)
my_years

my_countries <- c("Vietnam", "United States")
my_countries

tab <- gapminder %>% filter(year %in% my_years & country %in% my_countries)
#tab <- gapminder %>% filter(year %in% my_years & country %in% c("Vietnam", "United States"))
#tab <- gapminder %>% filter(year %in% c(min_year, max_year) & country %in% c("Vietnam", "United States"))
tab

p1 <- tab %>% 
  ggplot(aes(year, life_expectancy, color = country)) +
  geom_line()

p1



p2 <- gapminder %>% filter( year %in% my_years & country == "Cambodia") %>%
  ggplot(aes(year, life_expectancy, color = year)) +
  geom_line()

p2
