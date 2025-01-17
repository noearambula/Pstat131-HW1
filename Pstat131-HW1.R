# install.packages("tidyverse")
# install.packages("tidymodels")
# install.packages("ISLR")
# install.packages("corrplot")
library(tidyverse)
library(tidymodels)
library(ISLR)
library(corrplot)

#?mpg
mpg

# Exercise 1 
# ggplot(data = mpg) + geom_histogram(mapping = aes(x = hwy)) -> can use this or below

ggplot(mpg, aes(hwy)) + geom_histogram() # creates a histogram

  ## I see highway on the x-axis and count on the y 
  ## The histogram goes from 10 to a bit over 40 on the x-axis and about the same on y
  ## The histogram shows that most cars lie at around 28 mpg on the highway
  ## There is also a spike at around 16 mpg

# Exercise 2
ggplot(mpg) + geom_point(mapping = aes(x = hwy, y = cty, color = class)) # creates a scatter plot
  
  ## There seems to be a linear relationship between highway and city
  ## this means that as the city mpg go up so does the highway mpg
  ## Gas efficiency improvement leads to efficiency in the city and highway

# Exercise 3 
mpg_new = mpg %>% count(manufacturer,sort = T) # created a new data set with a count of each manufacturer
mpg_new
ggplot(mpg_new, aes(x = reorder(manufacturer, +n), y = n)) + geom_bar(stat = "identity") + coord_flip()

  ## Dodge produced the most cars and Lincoln produced the least

# Exercise 4
ggplot(mpg,aes(hwy, cyl)) + geom_boxplot(aes(group = cyl))

  ## I see a pattern as the number of cylinders go down the mpg on the highway goes up 

# Exercise 5 count(manufacturer)
mpg_small = mpg %>% 
  select(displ, year , cyl, cty, hwy) # since corrplot can only use numeric values we filter out all char variables
M = cor(mpg_small)
corrplot(M, type = "lower", method = "number")

  ## cyl is positively correlated with displacement and highway and city are postively correlated
  ## city and displacement are negatively correlated as well as; city and cylinder, hwy and displ, hwy and cyl
  ## These relationships make sense to me because the more cylinders a car has the more displacement it produces which also requires more energy/gas making it less fuel efficient
  ## This is because the more cylinders a car has the more gas it needs to operate them so the hwy cty displ and cyl correlations make sense
  ## the only thing that is interesting is that there is a minor positive correlation between year and displ/cyl
