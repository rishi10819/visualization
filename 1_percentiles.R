library(dslabs)

data(heights)

female <- heights$height[heights$sex=="Female"]
male   <- heights$height[heights$sex=="Male"]

length(female)  # 238
length(male)    # 812

#female # Shows 238 female heights
#male   # Shows 812 male heights

# Create two five row vectors showing the 10th, 30th, 50th, 70th, and 90th percentiles 
# for the heights of each sex called these vectors 
# female_percentiles and male_percentiles.

female_percentiles <- quantile(female, seq(0.1, 0.9, 0.2))
male_percentiles   <- quantile(male,   seq(0.1, 0.9, 0.2))

female_percentiles
#      10%      30%      50%      70%      90% 
# 61.00000 63.00000 64.98031 66.46417 69.00000

male_percentiles
#      10%      30%      50%      70%      90% 
# 65.00000 68.00000 69.00000 71.00000 73.22751

# create a data frame called df with these two vectors as columns.
df <- data.frame(female = female_percentiles, male = male_percentiles)

df

#        female      male
# 10%  61.00000  65.00000
# 30%  63.00000  68.00000
# 50%  64.98031  69.00000
# 70%  66.46417  71.00000
# 90%  69.00000  73.22751

