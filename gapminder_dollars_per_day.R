library(dplyr)
library(dslabs)
library(ggplot2)

data(gapminder)

# Create the dollars_per_day variable for African countries for the year 2010.
# Remove any NA values. 
# Create a dollars_per_day variable, which is defined as gdp/population/365.
# Save the mutated dataset as daydollars.

daydollars <- gapminder %>%
  filter (year == 2010 & !is.na(gdp) & continent == "Africa") %>%
  mutate (dollars_per_day = gdp/population/365)

daydollars


# plot the smooth density plot using a log (base 2) x axis.

daydollars %>% ggplot(aes(dollars_per_day)) + 
  geom_density() + 
  scale_x_continuous(trans = "log2")


# Create density plots for multiple years.
# Create the dollars_per_day variable for African countries in the years 1970 and 2010.
# Create a smooth density plot of dollars per day for 1970 and 2010 using a log (base 2) scale for the x axis.
# Show a different density plot for 1970 and 2010. 

daydollars <- gapminder %>%
  filter (year %in% c(1970, 2010) & !is.na(gdp) & continent == "Africa") %>%
  group_by(year) %>%
  mutate (dollars_per_day = gdp/population/365) %>% 
  ggplot (aes(dollars_per_day)) + 
  geom_density () + 
  scale_x_continuous (trans = "log2") +
  facet_grid (year ~ group)


# Make sure the densities are smooth by using bw = 0.5.
# Create the stacked histograms of each region.

daydollars <- gapminder %>%
  filter (year %in% c(1970,2010) & !is.na(gdp) & continent == "Africa") %>%
  group_by(year) %>%
  mutate (dollars_per_day = gdp/population/365) %>% 
  ggplot (aes(dollars_per_day, fill = region)) + 
  geom_density (bw = 0.5, position = "stack") + 
  scale_x_continuous (trans = "log2") +
  facet_grid (year ~ group)
