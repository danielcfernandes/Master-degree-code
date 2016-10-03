library(xlsx)
library(ggplot2)

install.packages("e1071")
library(e1071)

dataframe <- read.csv(file = "D:/Syracuse/687/Project/Data/out-hyatt_June2014.csv")
head(dataframe)

dataframered <- data.frame(dataframe$ROOM_TYPE_CODE_C , dataframe$Tranquility_H, dataframe$Internet_Sat_H, dataframe$Likelihood_Recommend_H)
head(dataframered)
dataframered <- na.omit(dataframered)

head(dataframe$MEMBER_STATUS_R)
colnames(dataframe)


dataframenew <- data.frame(dataframe$NPS_Type,dataframe$COUNTRY_CODE_R,dataframe$MEMBER_STATUS_R, dataframe$Likelihood_Recommend_H)

dataframenew <- na.omit(dataframenew)
head(dataframenew)

nrows <- nrow(dataframenew)
random.indexes <- sample(1:nrows)
cutPoint <- floor(nrows/3)

head(data.train)
data.train <- dataframenew[random.indexes[1:cutPoint],]
data.test <- dataframenew[random.indexes[(cutPoint+1):nrows],]


train.model <- ksvm(dataframe.NPS_Type ~ dataframe.COUNTRY_CODE_R, data = data.train)
predictRating <- predict(train.model, data.test)
results <- table(predictRating, data.test$dataframe.NPS_Type)
print(results)
percentCorrect <- (results[1,1]+results[2,2] + results[3,3])/(results[1,1]+results[1,2]+results[2,1]+results[2,2]+ results[1,3]+results[2,3]+results[3,3]+ results[3,1]+results[3,2])*100
round(percentCorrect)  
errorrating <- ifelse(predictRating == data.test$dataframe.NPS_Type, 1,2)
plott <- ggplot(data= data.test ,mapping = aes(y= data.test$dataframe.NPS_Type , x = data.test$dataframe.COUNTRY_CODE_R))
plott <- plott + geom_point()

