#Ist 687
# Hw 6
# Daniel Fernandes

# load libraries
library(xlsx)
library(ggplot2)

# read data from excel ( This is a local file location)
anteData <- read.xlsx("D:/Syracuse/687/HW6/mlr01.xls" , 1)
#Summary of data
str(anteData)

# Plot fawn births against other variables
plot(x= anteData$X2,y= anteData$X1, main = "Fawn births v. Adult population",  xlab = "Adult population", ylab = "Fawn births")
plot(x= anteData$X3,y= anteData$X1, main = "Fawn births v. Annual precipitation",  xlab = "Annual precipitation", ylab = "Fawn births")
plot(x= anteData$X4,y= anteData$X1, main = "Fawn births v. Winter severity",  xlab = "Winter severity", ylab = "Fawn births")


#linear model
model1<- lm(formula = anteData$X1 ~ anteData$X4, data = anteData)
summary(model1)
abline(model1)

ggplot(anteData, aes(x = X4, y = X1) ) +
  geom_point() +
  stat_smooth(method = "lm", col = "red")
# the above plot has a R squared value that is only 0.54


# linear model 2
model2<- lm(formula = anteData$X1 ~ anteData$X4+anteData$X3, data = anteData)
summary(model2)

ggplot(anteData, aes(x = X4+X3, y = X1) ) +
  geom_point() +
  stat_smooth(method = "lm", col = "red")
# the above plot has a much higher R squared value of 0.9. We only added precipitation
# as an additional independent variable


# linear model 3
model3<- lm(formula = anteData$X1 ~ anteData$X4+anteData$X3+anteData$X2, data = anteData)
summary(model3)

ggplot(anteData, aes(x = X4+X3+X2, y = X1) ) +
  geom_point() +
  stat_smooth(method = "lm", col = "red")
# the above plot has a high R squared value of 0.97! so it looked like adult population
# and precipitation influence R squared highly. They could be create a parsimonious 
# model


# linear model 4 to test parsimonious model
model4<- lm(formula = anteData$X1 ~ anteData$X3+anteData$X2, data = anteData)
summary(model4)

ggplot(anteData, aes(x = X3+X2, y = X1) ) +
  geom_point() +
  stat_smooth(method = "lm", col = "red")

# the above model has an R squared value of 0.91.


model5<- lm(formula = anteData$X1 ~ anteData$X3, data = anteData)
summary(model5)
# R squared of 85

model6<- lm(formula = anteData$X1 ~ anteData$X2, data = anteData)
summary(model6)
#R squared of 88


# From the above combination Model 3 which included winter severity, precipitation 
# adult population has the highest R squared value of 0.97 and closest second is 0.91.
# so I think the parsimonious model should contain all three : precipitation, adult 
# population and winter severity