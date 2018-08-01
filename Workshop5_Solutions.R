### Workshop 5 Solutions ####

# 1) 
LD = read.csv("~/Downloads/LD_Incidence.csv", header = TRUE, row.names = 1)

# 1.1)
View(LD)
# X's got put in front of all the names. R doesn't like column names that start with numbers
# so this is it's work-around

# 1.2)
dim(LD)
# There are 51 rows. DC is counted as a state here

# 1.3)
class(LD$X2006)
class(LD$X2007)
# There are of the class 'integer'

# 1.4)
LD = as.data.frame(sapply(LD[,1:11], FUN = as.numeric))

# 1.4.1)
# Re-bring in the dataset and save the rownames into a new variable
LD2 = read.csv("~/Downloads/LD_Incidence.csv", header = TRUE, row.names = 1)
StateNames = rownames(LD2)
rownames(LD) = StateNames

# The sapply function allowed us to repeat a functio across all columns of the LD dataset.
# In this case, the function we wanted repeated was "as.numeric"
# Essentially this allowed us to, in a single line of code, convert all the columns
# from the integer class to the numeric class

# The as.data.frame function forced the output of the sapply call to live inside of a dataframe

# In this case, since we don't care to keep the original columns in their integer form,
# We can overwrite the original LD dataset with the new columns in the numeric class
# Saving the output of the call as "LD" allowed us to essentially overwrite the original LD
# dataframe with our updated version

# 1.5)
# Method A: Using sapply again (similar to 1.4)
UStotals = sapply(LD[,1:11], FUN = sum)
UStotals 

# Method B: Using a for loop (not really necessary, but it's kinda fun)
UStotals = rep(0,11)
for (i in 1:11)
{ UStotals[i] = sum(LD[,i]) }

# Method C: The easy way! There is a column sums function. Boring!
UStotals = colSums(LD)

# 1.5.1)
which(UStotals == max(UStotals)) # 2009 had the higest LD incidence
which(UStotals == min(UStotals)) # 2012 had the lowest LD incidence

# 1.6)
# Method A: for loop
Statetotals = rep(0,51)
for (i in 1:51)
{ Statetotals[i] = sum(LD[i,])}

# Method B: rowSums function
Statetotals = rowSums(LD)

# 1.7)
LD = cbind(LD, Statetotals)

# 1.8)
StateNum = which(LD$Statetotals == max(LD$Statetotals))
rownames(LD)[StateNum]  # Pennsylvania has the highest incidence

StateNum2 = which(LD$Statetotals == min(LD$Statetotals))
rownames(LD)[StateNum2] # Hawaii had the lowest incidence (with almost no cases!)

# 1.9)
hist(LD$Statetotals)
# Most cases are concentrated in a few states (can tell from the right-skewed distribution)
# If they were evenly distributed, would expect a roughly noraml distribution

# 1.10)
plot(UStotals, main = "Total LD cases by year", xlab = "Year", ylab = "LD case counts",
     pch = 16, col = "black")

# Doesn't appear to be any trend over time, at least between 2006 - 2016

# 1.11)
LDprobable = LD # Create the LDprobable dataframe by setting it equal to LD to start
# (We'll later overwrite it)

for (i in 1:51)
{LDprobable[i,] = LD[i,]*10}

# 2
PE = read.csv("~/Downloads/Pathogens_Emerging.csv", header = TRUE)

# 2.1)
summary(PE)
# North America has the greatest number of emerging diseases

# 2.2)
NewPE = PE[PE$Year > 2000,]

# 2.3)
dim(NewPE)  # 19 diseases 

# 2.3.1)
summary(NewPE) # more bacteria than viruses (10 to 9)

# 2.4)
plot(PE$VectorType, col = "light blue", ylim = c(0,50), cex.names = 0.85)
# Ticks are vectoring the largest number of emerging diseases

# 2.5)
Drivers = summary(PE$Driver)

# 2.6)
library(colorspace) # I'm going to use this package to find a nice color palette
mycolors = rainbow_hcl(14)
pie(Drivers, col = mycolors, cex = 0.80)

# 3)
MS = read.csv("~/Downloads/MammalSleep.csv", header = TRUE)

# 3.1)
dim(MS)  # 83 animals are included in this dataset

# 3.2)
mean(MS$sleep_total)  # Average  = 10.43 hours

# 3.3)
summary(MS$conservation) # Can see that 7 are listed as vulnerable

# 3.4)
Model = lm(sleep_total ~ bodywt + brainwt, data = MS)

# 3.4.1)
summary(Model)  # Neither predictor is significant

# 3.5)
MS[!complete.cases(MS),] # This step identifies rows with missing data
MSnew <- na.omit(MS)

# 3.6)
plot(sleep_total ~ brainwt, data = MSnew)
plot(sleep_total ~ bodywt, data = MSnew)

# Roughly negative relationship between brain/body weight and sleep time

# 3.7)
plot(brainwt ~ bodywt, data = MSnew)

# 3.8)
abline(lm(brainwt ~ bodywt, data = MSnew), col = "red")
# Appears to be a positive correlation between brain and body weight (which makes sense)

# 3.9)
fit = aov(brainwt ~ vore, data = MS)
summary(fit)
# No significant difference between groups

# 3.10)
BodyBrain = function(x,y)
{Ratio = x/(y/10000)
print(Ratio)}

# 3.11)
Body = c(20.1, 14.3, 7.0, 8.2, 9.3, 10.7) # in kilograms
Brain = c(71, 95, 103, 279, 88, 125)  # in grams

Ratio = BodyBrain(Body,Brain)

