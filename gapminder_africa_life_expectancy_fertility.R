library(dplyr)
library(ggplot2)
library(dslabs)

data(gapminder)

str(gapminder)

colnames (gapminder)
#"country" "year" "infant_mortality" "life_expectancy" "fertility" "population" "gdp" "continent" "region"  


# Using ggplot and the points layer, create a scatter plot of 
# life expectancy versus fertility for the African continent in 2012.

gapminder %>% filter( year == 2012 & continent == "Africa") %>%
  ggplot(aes(fertility, life_expectancy)) +
  geom_point()

# use color to dinstinguish the different regions of Africa

gapminder %>% filter( year == 2012 & continent == "Africa") %>%
  ggplot(aes(fertility, life_expectancy, color = region)) +
  geom_point()


# in 2012 had fertility rates of 3 or less and life expectancies of at least 70.
# Assign your result to a data frame called df.

df <- gapminder %>% 
  filter( year == 2012 & continent == "Africa" & fertility <= 3 & life_expectancy >= 70) %>% 
  select (country, region)

df
