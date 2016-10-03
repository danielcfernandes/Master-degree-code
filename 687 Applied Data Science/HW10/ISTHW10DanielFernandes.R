#IST 687
#HW10
# Daniel Fernandes

# load the required packages
install.packages("arules")
library(arules)
install.packages("arulesViz")
library(arulesViz)


# load the data
load(file = "D:/Syracuse/687/HW10/termDocMatrix.rdata")


tweets <- termDocMatrix
str(tweets)
summary(tweets)
head(tweets)


# transpose the matrix
tweets <- t(tweets)



# apply apriori rules to the tweet data set
tweetrules <- apriori(tweets,parameter=list(support=0.09,confidence=0.09))
summary(tweetrules)            
inspect(tweetrules)

#Plot the rules
plot(tweetrules)


# there is a strong lift for rules between 'data' and 'mining' = 2.10
# looking at the plot we can see that the lift is the highest at around 0.6 confidence
# and a support of 0.1



# Analysis / Interpretation
# from this analysis I can identify Key words that are used across tweets. In the case of emails
# this technique can be used to understand the most frequently used words in the emails and also understand
# the context in which they are used by looking at the related words.

