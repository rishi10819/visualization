install.packages("NHANES")
library(NHANES)
data(NHANES)


#library(dslabs)

#data(na_example)
#mean(na_example) # NA
#sd(na_example)   # NA

# ignore the NAs
  
#mean(na_example, na.rm = TRUE) # 2.301754
#sd(na_example, na.rm = TRUE)   # 1.22338



# Filter the NHANES dataset so that only 20-29 year old females are included 
# and assign this new data frame to the object tab.

tab <- NHANES %>% filter(AgeDecade == " 20-29" & Gender == "female")

# Save the average and standard deviation of systolic blood pressure as 
# average and standard_deviation to a variable called ref.

ref <- NHANES %>% 
  filter(AgeDecade == " 20-29" & Gender == "female") %>% 
  summarize (average = mean(BPSysAve, na.rm=TRUE), standard_deviation = sd (BPSysAve, na.rm=TRUE))

ref

#   A tibble: 1 x 2
#   average   standard_deviation
#    <dbl>                <dbl>
# 1    108.                10.1


# Now generate only the average blood pressure for 20-29 year old females. 
# And assign it variable called ref_avg

ref_avg <- NHANES %>%
  filter(AgeDecade == " 20-29" & Gender == "female") %>%
  summarize(average = mean(BPSysAve, na.rm = TRUE)) %>% .$average

ref_avg # 108.4224


# Save the minimum and maximum of systolic blood pressure as 
# min and max to a variable called ref_min_max.

ref_min_max <- NHANES %>%
  filter(AgeDecade == " 20-29"  & Gender == "female") %>% 
  summarize (min = min(BPSysAve, na.rm = TRUE), max = max(BPSysAve, na.rm = TRUE))

ref_min_max

# A tibble: 1 x 2
#      min     max
#    <dbl>   <dbl>
# 1    84     179




# Compute the average and standard deviation of systolic blood pressure 
# for females for each age group separately. 
# age groups are contained in AgeDecade.

ref_agedecade_female <- NHANES %>%
  filter(Gender == "female") %>% 
  group_by (AgeDecade) %>% 
  summarize (average = mean(BPSysAve, na.rm = TRUE), standard_deviation = sd(BPSysAve, na.rm = TRUE)) 

ref_agedecade_female


# Compute the average and standard deviation of systolic blood pressure 
# for males for each age group separately. 
# age groups are contained in AgeDecade.

ref_agedecade_male <- NHANES %>%
  filter(Gender == "male") %>% 
  group_by (AgeDecade) %>% 
  summarize (average = mean(BPSysAve, na.rm = TRUE), standard_deviation = sd(BPSysAve, na.rm = TRUE))

ref_agedecade_male


# Compute the average and standard deviation of systolic blood pressure 
# for females and males for each age group separately. 
# age groups are contained in AgeDecade.


ref_agedecade_gender <- NHANES %>%
  group_by (AgeDecade, Gender) %>% 
  summarize (average = mean(BPSysAve, na.rm = TRUE), standard_deviation = sd(BPSysAve, na.rm = TRUE))

ref_agedecade_gender


# Compute the average and standard deviation for each value of Race1 
# for males in the age decade 40-49.
# Order the resulting table from lowest to highest average systolic blood pressure.

ref_race1_male <- NHANES %>%
  filter(AgeDecade == " 40-49"  & Gender == "male") %>% 
  group_by (Race1) %>% 
  summarize (average = mean(BPSysAve, na.rm = TRUE), standard_deviation = sd(BPSysAve, na.rm = TRUE)) %>% 
  arrange(average)

ref_race1_male
