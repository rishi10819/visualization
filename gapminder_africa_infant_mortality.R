library(dplyr)
library(ggplot2)
library(dslabs)

data(gapminder)

# Generate dollars_per_day and filter for the year 2010 for African countries.
# Store the mutated dataset in gapminder_Africa_2010.

gapminder_Africa_2010 <- gapminder %>% 
  filter (year == 2010 & !is.na(gdp) & continent == "Africa") %>%
  mutate (dollars_per_day = gdp/population/365) 

#str(gapminder_Africa_2010)


# Make a scatter plot of infant_mortaility versus dollars_per_day 
# for countries in the African continent.
# Use color to denote the different regions of Africa.


gapminder_Africa_2010 %>%
  ggplot(aes(dollars_per_day, infant_mortality, color = region)) +
  geom_point()


# Transform the x axis to be in the log (base 2) scale.

gapminder_Africa_2010 %>%
  ggplot(aes(dollars_per_day, infant_mortality, color = region)) +
  geom_point() +
  scale_x_continuous(trans = "log2")


# Add a layer to display country names instead of points.

gapminder_Africa_2010 %>%
  ggplot(aes(dollars_per_day, infant_mortality, color = region, label = country)) +
  geom_text () +
  #  theme (axis.text.x = element_text (angle = 90, hjust = 1)) +
  scale_x_continuous(trans = "log2")


# Use facet_grid to show different plots for 1970 and 2010. 

gapminder %>% 
  mutate(dollars_per_day = gdp/population/365) %>%
  filter(continent == "Africa" & year %in% c(1970, 2010) & !is.na(dollars_per_day) & !is.na(infant_mortality)) %>%
  ggplot(aes(dollars_per_day, infant_mortality, color = region, label = country)) +
  geom_text() + 
  scale_x_continuous(trans = "log2") +
  facet_grid(year~.)
