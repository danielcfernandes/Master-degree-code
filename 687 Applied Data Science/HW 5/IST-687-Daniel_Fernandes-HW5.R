# IST 687 
# Daniel Fernandes
# HW 5

# airquality dataset
airQual <- airquality

# head command to reveal the data set
head(airQual)

#activate sqldf
library(sqldf)
mean(na.omit(airQual$Ozone))
newAQ <- sqldf('select * from airQual where Ozone > (select AVG(Ozone) from airQual)')
newAQ
str(newAQ)
summary(newAQ)
dim(newAQ)
head(newAQ)

meanozone <- mean(na.omit(airQual$Ozone))
# gives the days where ozone is higher than average
# i used this simple function as opposed to length because length only gives the 
# count.
tapply( airQual$Day, airQual$Ozone>meanozone, function(x) x)

