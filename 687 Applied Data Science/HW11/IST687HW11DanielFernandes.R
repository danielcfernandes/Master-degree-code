# IST 687
# Daniel Fernandes
# HW 11

install.packages("kernlab")
library(kernlab)
install.packages("ggplot2")
library(ggplot2)

# Step 1 read the data
fooddataframe <- read.csv('D:/Syracuse/687/HW11/Food_Service_Establishment__Last_Inspection.csv')
head(fooddataframe)

str(fooddataframe)
summary(fooddataframe)
fooddataframe <- na.omit(fooddataframe)

# Step 2 create a new column that stores if violations have been done
violationsflag <- ifelse((fooddataframe$TOTAL...CRITICAL.VIOLATIONS >0)|(fooddataframe$TOTAL..CRIT...NOT.CORRECTED>0)|(fooddataframe$TOTAL...NONCRITICAL.VIOLATIONS>0),1,0)
summary(violationsflag)

fooddataframe <- data.frame(fooddataframe,violationsflag)

# Step 3 creating test and train sets
nrows <- nrow(fooddataframe)
random.indexes <- sample(1:nrows)
cutPoint <- floor(nrows/3)


fooddataframe.train <- fooddataframe[random.indexes[1:cutPoint],]
fooddataframe.test <- fooddataframe[random.indexes[(cutPoint+1):nrows],]

# ksvm model with one predictor
food.ksvm <- ksvm(as.factor(violationsflag) ~ DESCRIPTION , data=fooddataframe.train)

food.first <- predict(food.ksvm, fooddataframe.test)
resultsksvm <- table(food.first, fooddataframe.test$violationsflag)
percentCorrectksvm <- (resultsksvm[1,1]+resultsksvm[2,2])/(resultsksvm[1,1]+resultsksvm[1,2]+resultsksvm[2,1]+resultsksvm[2,2])*100
percentCorrectksvm
correctpredictksvm <- ifelse(food.first == fooddataframe.test$violationsflag,1,2)
plotksvm1 <- ggplot(data = fooddataframe.test, mapping = aes(x= fooddataframe.test$violationsflag, y = fooddataframe.test$DESCRIPTION))
plotksvm1 <- plotksvm1 + geom_point() + aes(color= food.first , size= correctpredictksvm)
plotksvm1


# the above preodcitor predicted with 69% accuracy the type of food service that violated 
# the NY food services laws.






# Step 4 KSVM using more predictors
food.ksvm2 <- ksvm(as.factor(violationsflag) ~ DESCRIPTION + LOCAL.HEALTH.DEPARTMENT+ PERMIT.EXPIRATION.DATE, data=fooddataframe.train)

food.first2 <- predict(food.ksvm2, fooddataframe.test)
resultsksvm2 <- table(food.first2, fooddataframe.test$violationsflag)
percentCorrectksvm2 <- (resultsksvm2[1,1]+resultsksvm2[2,2])/(resultsksvm2[1,1]+resultsksvm2[1,2]+resultsksvm2[2,1]+resultsksvm2[2,2])*100
percentCorrectksvm2
correctpredictksvm2 <- ifelse(food.first2 == fooddataframe.test$violationsflag,1,2)
plotksvm2 <- ggplot(data = fooddataframe.test, mapping = aes(x= fooddataframe.test$violationsflag, y = fooddataframe.test$LOCAL.HEALTH.DEPARTMENT))
plotksvm2 <- plotksvm2 + geom_point() + aes(color= food.first2 , size= correctpredictksvm2)
plotksvm2



# adding local health department and permit expiration date increased the prediction of violation by 4%
# this could indicate that food services that come under a certain health department are more prone
# to violations.
# the accurancy rate is 73.64%
