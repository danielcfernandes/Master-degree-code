library(xlsx)
library(ggplot2)

dataframe <- read.csv(file = "D:/Syracuse/687/Project/Data/out-hyatt_June2014.csv")
head(dataframe)

colnames(dataframe)

# reduce the data frame to those columns that need to analyzed
dataframered <- data.frame(dataframe$ROOM_TYPE_CODE_C , dataframe$Tranquility_H, dataframe$Internet_Sat_H, dataframe$Likelihood_Recommend_H)
head(dataframered)
dataframered <- na.omit(dataframered)

str(dataframered)
summary(dataframered)

# plot the linear model
plot(y= dataframered$dataframe.Tranquility_H,x= dataframered$dataframe.Likelihood_Recommend_H, main = "Recommend v. Internet Satisfaction",  xlab = "Internet", ylab = "Recommend")

model <- lm(formula = dataframered$dataframe.Likelihood_Recommend_H ~ dataframered$dataframe.Internet_Sat_H, data = dataframered )
summary(model)
abline(model)

#ggplot(dataframered, aes(x = dataframe.Internet_Sat_H , y = dataframered$dataframe.Internet_Sat_H) ) +
 # geom_point() +
  #stat_smooth(method = "lm", col = "red") 

#group the rating
tapply(dataframered$dataframe.Internet_Sat_H, dataframered$dataframe.Likelihood_Recommend_H, mean)


# data frame of only detractors
datafr <- dataframered[dataframered$dataframe.Likelihood_Recommend_H < 6,]
head(datafr)

# plot linear model of detractors
plot(x= datafr$dataframe.Likelihood_Recommend_H, y= datafr$dataframe.Internet_Sat_H, main = "Recommend v. Internet Satisfaction")


model <- lm(formula = datafr$dataframe.Internet_Sat_H ~ datafr$dataframe.Likelihood_Recommend_H, data = datafr )
summary(model)
abline(model)



hist(dataframered$dataframe.Tranquility_H)
hist(dataframered$dataframe.Internet_Sat_H)
hist(dataframered$dataframe.Likelihood_Recommend_H)
