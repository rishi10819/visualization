library(HistData)
data(Galton)
x <- Galton$child

#For this data, compute 
#average, median, standard deviation and the median absolute deviation (MAD)

mean(x)   # 68.08847
median(x) # 68.2
sd(x)     # 2.517941
mad(x)    # 2.9652

# Now suppose that suppose Galton made a mistake when entering the first value, 
# forgetting to use the decimal point. 

x_with_error <- x
x_with_error[1] <- x_with_error[1]*10

# How many inches the average grow after this mistake. 
mean (x_with_error) - mean (x) # 0.5983836

# How many inches the SD grows after this mistake. 
sd (x_with_error) - sd (x) # 15.6746

# How many inches the median grows after the mistake. 
median (x_with_error) - median (x) # 0

# How many inches the MAD grows after the mistake. 
mad (x_with_error) - mad (x) # 0


# To see how outliers can affect the average of a dataset, 
# let's write a simple function that takes the size of the outlier as input and 
# returns the average.

# Write a function called error_avg that takes a value k and 
# returns the average of the vector x after the first entry changed to k. 

#Show the results for k = 10000 and k = -10000.

error_avg <- function(k){
  x_with_error <- x
  x_with_error[1] <- k
  mean(x_with_error)
}

error_avg (10000)  # 78.79784
error_avg (-10000) # 57.24612

