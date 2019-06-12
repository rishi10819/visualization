Use height data collected by Francis Galton for his genetics studies. 
Here we just use height of the children in the dataset.


For this data, compute average, median, standard deviation and the median absolute deviation (MAD).


Now suppose that suppose Galton made a mistake when entering the first value, forgetting to use the decimal point. 
The data now has an outlier that the normal approximation does not account for. 


Report how many inches the average grows, the SD grows, the median grows and the MAD grows, after this mistake. 


To see how outliers can affect the average of a dataset, let's write a simple function that takes the size of the outlier as input and returns the average.
Write a function called error_avg that takes a value k and returns the average of the vector x after the first entry changed to k. 
Show the results for k = 10000 and k = -10000.