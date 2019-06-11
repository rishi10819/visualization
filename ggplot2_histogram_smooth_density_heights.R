library(dplyr)
library(ggplot2)
library(dslabs)

data(heights)

# Create a ggplot object called p1 to assign the heights data to a ggplot object.
# And make the histogram.

p1 <- heights %>% ggplot() +
  geom_histogram (aes(height))
# geom_histogram (aes(x=height)) # same result as above line

p1

######################################

# Add binwidth to histogram. bins of size 1 inch. 

p2 <- heights %>% ggplot() +
  geom_histogram (aes(height), binwidth = 1)

p2

######################################

# Instead of geom_histogram, now we will use geom_density to create a smooth density plot.

p3 <- heights %>% ggplot(aes(height)) + geom_density ()
#p3 <- heights %>% ggplot() + geom_density (aes(height)) # same result as above line

p3

######################################

# Create separte smooth density plots for males and females.

p4 <- heights %>% ggplot(aes(height, group = sex)) + 
  geom_density ()
# geom_density (aes(group = sex)) # same result as above line

p4

######################################

# Create separte smooth density plots for males and females.
# Assign groups through the color

p5 <- heights %>% ggplot(aes(height, color = sex)) + 
  geom_density ()
# geom_density (aes(group = sex)) # same result as above line

p5

######################################

# Create separte smooth density plots for males and females.
# Assign groups through the color
# Here part of the 1 plot is hidden behind 2nd plot
# i.e. second density is drawn over the other.

p6 <- heights %>% ggplot(aes(height, fill = sex)) + 
  geom_density ()
# geom_density (aes(group = sex)) # same result as above line

p6

######################################

# Create separte smooth density plots for males and females.
# Assign groups through the color and use alpha blending
# second density is not drawn over the other.

p7 <- heights %>% ggplot(aes(height, fill = sex)) + 
  geom_density () +
# geom_density (aes(group = sex)) # same result as above line
  geom_density(alpha = 0.2) 

p7

######################################
