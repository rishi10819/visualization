library(dplyr)
library(ggplot2)
library(dslabs)

data(murders)

#associate a dataset with a plot object
p1 <- ggplot(data = murders) # p1 <- ggplot(murders)

# or if we load tidyverse, we can use the pipe:
# library(tidyverse)
# p1 <- murders %>% ggplot()


p1 # A blank slate plot

class(p1)  # "gg"  "ggplot"

######################################

# Now define the x-axis and y-axis variables for aesthetic mappings

p2 <- murders %>% ggplot(aes(x = population, y = total)) + geom_point()

# p2 <- murders %>% ggplot(aes(population, total)) + geom_point()

p2 # Now we see the actual plot

######################################

# use geom_label

p3 <- murders %>% ggplot(aes(population, total)) +
  geom_label(label = 'x')

p3 # see 'x' for each data point in the plot

######################################

# adding label for each data point

p4 <- murders %>% ggplot(aes(population, total, label = abb)) +
     geom_label()
   # geom_label(aes(label = abb))                    # same result as above line
   # geom_label(aes(population, total, label = abb)) # same result as above line

p4

######################################

# adding blue color to labels

p5 <- murders %>% ggplot(aes(population, total, label = abb)) +
  geom_label(aes(color = 'blue'))
# geom_label(aes(label = abb, color = 'blue')) # same result as above line

p5

######################################

# use color to represent the different regions. 
# So the states from the West will be one color, states from Northeast another, and so on.

p6 <- murders %>% ggplot(aes(population, total, label = abb, color = region)) +
  geom_label()

p6

######################################

# Now we are going to change the axes to log scales

p7 <- murders %>% ggplot(aes(population, total, label = abb, color = region)) +
  geom_label()

p7 + scale_x_log10() + scale_y_log10()

######################################

# Adding plot title

p8 <- murders %>% ggplot(aes(population, total, label = abb, color = region)) +
  geom_label()

p8 + scale_x_log10() + scale_y_log10() + ggtitle("Gun murder data")

######################################