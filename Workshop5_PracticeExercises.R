### Workhop 5 Practice Exercises ####

# 1)
# Download the "LD_Incidence.csv" file from Github
# Make sure that you specify that the dataset has column names and rownames (the first column)
# This dataset was gathered by the CDC and 
# displays the number of confirmed cases of Lyme disease by state & year

# 1.1)
# View the dataset. What happened to the column names? Why do you think this is?

# 1.2)
# What are the dimensions of the dataset? 
# Is there anything odd about the number of rows included? Why is this?

# 1.3)
# What is the class of the individual rows? (Just check a couple)

# 1.4)
# This class type will be annoying for us to deal with in later calculations. 
# Change the class to "numeric" for all rows using the following code:
LD = as.data.frame(sapply(LD[,1:11], FUN = as.numeric))

# What did the 'sapply' function above do? 
# What did the as.data.frame fucntion above do?
# Why did we save the output as "LD"?

# 1.4.1)
# Notice that this made the rownames disappear. Can you add them back?

# 1.5)
# You can now more easily do calculations on this dataset. Let's start by
# calculating the US totals by year and storing the values in a vector called "UStotals"
# Hint: there are many ways to do this
# I've demoed a few in the solutions, but feel free to do whatever method you like!

# 1.5.1)
# Which year had the highest LD incidence (the most cases)?
# Which year had the least?
# You could manually examine the output of UStotals, 
# or (preferably), use a function call on this output to determine the max/min

# 1.6)
# Using a different method than you did above, can you calculate the state totals across all years?
# Store the output in a vector called "Statetotals"

# 1.7) 
# Add the rowtotals to the end of the original LD dataframe

# 1.8)
# Which state had the highest LD incidence? (This is admittedly a bit complicated to do 
# using R tools rather than simple visual inspection. Either method is fine)
# Which had the lowest?

# 1.9)
# Create a histogram of the state totals to get a sense for how LD cases are distributed between states
# Do cases appear to be well spread out across the country?
# Or do a few states have a lot of cases, and the rest have few?

# 1.10)
# Create a plot (probably will want a scatterplot) of the US totals by year
# Add appropriate axis labels, a title, and change the plotting symbol/color

# Does there appear to be any trend over time?

# 1.11)
# It is estimated that the actual number of LD cases per year is 10x greater than 
# the confirmed cases displayed here

# Create a new dataframe called "LDprobale" that contains the values presented in LD, 
# inflated by an order of magnitude
# Note: This will involve some cleverness, and a for loop
# Don't feel bad looking at the solutions - this one is tough


# 2)
# Import the "Pathogens_Emerging.csv" dataset from Github
# This dataset has column names, but not row names
# View the dataset to get a sense for what it contains
# This dataset contains information about some recently emerging vector-borne diseases around the world
# The first column lists the pathogen/disease
# 2nd column =  the year it emerged
# 3rd column =  the type of pathogen causing the disease (virus, bacteria, protozoan, etc)
# 4th column =  the family the pathogen belongs to (i.e. taxonomic info)
# 5th column =  the type of vector that vectors this pathogen (i.e. tick, mosquito, etc)
# 6th column = the "cause" that led to this disease's emergence
# 7th column = the continent this disease first emerged


# 2.1) 
# Uee the summary function on this dataset to view some basic summmary statistics
# From this output -- which continent appears to host the most recently emerging diseases?

# 2.2)
# Using subsetting tools (with logic statements)
# Break apart this dataset to include only the diseases that emerged after the year 2000
# Name this new dataset whatever you like

# 2.3)
# How many diseases are included in this new dataset? (i.e. how many emerged after 2000?)

# 2.3.1)
# Are most of the new emerging diseases (from the >2000s dataset) bacteria or viruses?
# (Use some kind of R function to find out! Don't count!)

# 2.4)
# Returning to the original dataset - create a barplot (using the 'plot' function)
# To display the number of emerging diseases based on their VectorType
# Reformat the plot a bit so it looks presentable
# See if you can change the angle or the size of the bar labels 
# so that they all appear in the plotting window
# What vector type is vectoring the highest number of emerging diseases?

# 2.5)
# Use the summary function on the "Driver" column in the original dataset
# to see the breakdown of the number of emerging pathogens attributed to each environmental driver
# Store the output of this summary function call in a new variable called "Drivers"

# 2.6)
# Create a piechart of this output using the "pie" function. 
# Change the size of the text so all the words fit, and change the colors
# to something more pleasing
# Take a look at this website for good info on R color palettes:
# https://www.nceas.ucsb.edu/~frazier/RSpatialGuides/colorPaletteCheatsheet.pdf

# 3)
# Download and view the "MammalsSleep.csv" dataset from github
# This dataset has column names, but we'll leave the row names unspecified
# This dataset has information on the sleep patterns, diet, conservation status, etc.
# on various animals

# 3.1)
# How many animals are included in this dataset?

# 3.2) 
# What is the average total sleep achieved by these animals?

# 3.3)
# How many species in this dataset are considered "vulnerable" 
# (i.e. how many have a conservation status of 'vu')

# 3.4)
# How does brain weight and body weight relate to mammal sleep totals?
# Run a linear model (using the lm function) using sleep total as the outcome variable,
# and brainwt and bodywt as predictor variables

# 3.4.1)
# Are either of the predictors significant?

# 3.5)
# You can see there are a lot of missing values in this dataset --
# Lets remove all rows with missing data using the following commands:
# (Note the commands assume your dataset is named 'MS')
MS[!complete.cases(MS),] # This step identifies rows with missing data
MSnew <- na.omit(MS)  # This steps removes any rows without complete data

# 3.6) 
# We will do some plotting using the MSnew dataset
# First let's change the plotting window parameters so you can fit 2 plots at once:
  
par(mfrow = c(1,2))

# Now lets both the relationship between sleep total and brain weight
# And the relationship between sleep total and body weight
# Be sure to use the MSnew dataset
# Both plots should appear side by side

# Does there appear to be any relationship between body weight and sleep time?
# How about brain weight and sleep time?

# 3.7)
# Now lets change the plotting window back to normal:
par(mfrow = c(1,1))

# And lets plot the relationship between brain weight and body weight
# i.e. with brain weight as y variable, and body weight as x variable

# 3.8)
# Add a line of best fit (in red) to the plot 
# - is there any relatioship between these variables?

# 3.9) 
# Returning to the original datset, 
# Run an ANOVA to see if there is any difference in brain size
# based on diet (i.e. omnivore vs carnivore vs insectivore, etc)

# Is there a significant difference between these groups?

# 3.10)
# The ratio of body to brain mass is an important predictor variable
# for some ecological metrics

# Create a function called "BodyBrain" that takes as input
# 1) body weight in kg and 2) brain weight in g
# and provides as output the body weight/ brain weight
# I.e. make sure your function includes a conversion between g and kg!

# 3.11)
# You obtain the following body & brain measurements:

Body = c(20.1, 14.3, 7.0, 8.2, 9.3, 10.7) # in kilograms
Brain = c(71, 95, 103, 279, 88, 125)  # in grams

# Use these measurements in the BodyBrain function to get the ratio of
# body mass ratio


