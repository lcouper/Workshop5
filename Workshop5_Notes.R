#### Workshop 5 Notes ####

# Import your dataaset

Lyme = read.csv("~/Downloads/LD_Incidence.csv", header = TRUE, row.names = 1)
View(Lyme)

JID = read.delim("~/Downloads/JID_table.txt", header = TRUE)

# Do so at the command line or using R studio tools

head(Lyme)
tail(Lyme)
dim(Lyme)
summary(Lyme)

# Basic calculations

# Average LD cases across states in 2009
mean(Lyme$X2009)
mean(Lyme[,4])

# Subset data to look at only 2014,2015,2016
LDnew = LD[,c(9,10,11)]

# Calculate sum of these columns
sum(LDnew[,1])

sum(LDnew[,2]) # gives an error - change the class of the columns
class(LDnew[,2])

LDnew[,2] = as.numeric(LDnew[,2])
sum(LDnew[,2])

# Run a chi-squared test to see if the # of cases across states in 2015 and 2016 differ
chisq.test(LDnew[,1], LDnew[,2])

# Plot the number of cases by state for 2016
barplot(LDnew[,3], main = "LD cases by State", col = "dark green")

# Install packages
install.packages("ggplot2")
library(ggplot2)

p<-ggplot(data=LDnew, aes(x=rownames(LDnew), y=LD$X2006)) +
  geom_bar(stat="identity")
p



           