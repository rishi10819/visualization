library(dplyr)
library(ggplot2)
library(dslabs)

data(us_contagious_diseases)

dat <- us_contagious_diseases %>%
  filter(year == 1967 & disease=="Measles" & !is.na(population)) %>% mutate(rate = count / population * 10000 * 52 / weeks_reporting)

print(dat)

state <- dat$state 
rate <- dat$count/(dat$population/10000)*(52/dat$weeks_reporting)

# Redefine the state object so that the levels are re-ordered by rate.
state <- reorder(state, rate)

print(state)

levels(state)

####################################

dat <- us_contagious_diseases %>% filter(year == 1967 & disease=="Measles" & count>0 & !is.na(population)) %>%
  mutate(rate = count / population * 10000 * 52 / weeks_reporting) %>%
  mutate(state = reorder(state, rate)) # reorder the states by the rate variable.


dat %>% ggplot(aes(state, rate)) +
  geom_bar(stat = "identity") +
  coord_flip()
