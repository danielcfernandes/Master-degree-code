# IST 687
# Daniel Fernandes
# HW 12


install.packages("tm")
library(tm)

# step 1
# read the mlk file
mlkfile <- "D:/Syracuse/687/LAB12/MLK-speech.txt"
mlk <- readLines(mlkfile)

# read the Afinn file
wordlist<- read.delim("D:/Syracuse/687/HW12/AFINN-111.txt", header=FALSE, stringsAsFactors = FALSE)
# rename the colums
names(wordlist) <- c("word", "score") 


# step 2
# function to read the wordcount and compute sentiment score
speechscorefunction <- function(mlk, wordlist)
{
  words.vec <- VectorSource(mlk)
  words.corpus <- Corpus(words.vec)
  words.corpus
  
  words.corpus <- tm_map(words.corpus, content_transformer(tolower))
  words.corpus <- tm_map(words.corpus, removePunctuation)
  words.corpus <- tm_map(words.corpus, removeNumbers)
  words.corpus <- tm_map(words.corpus, removeWords, stopwords("english"))
  
  
  tdm <- TermDocumentMatrix(words.corpus)
  
  m <- as.matrix(tdm)
  wordCounts <- rowSums(m)
  wordCounts <- sort(wordCounts, decreasing=TRUE)
  
  mat <- data.frame(wordCounts)
  dataframemlk <- cbind(rownames(mat),mat)
  colnames(dataframemlk) <- c("word","score")
  rownames(dataframemlk) <- 1:nrow(dataframemlk)
  
  sentimentscore <- 0
  
 for(i in 1:nrow(dataframemlk)){
   for(j in 1:nrow(wordlist)){
          ifelse(dataframemlk[i,1]==wordlist[j,1], sentimentscore <- sentimentscore + (dataframemlk[i,2]*wordlist[j,2]), sentimentscore <-sentimentscore)
   }
 }
  
 return (sentimentscore)
  
}


# calculating overall score for the mlk speech
score<- speechscorefunction(mlk, wordlist)



# step 3
# dividing the speech into 4 quarters
mlk1 <- mlk[1:8]
mlk2 <- mlk[9:16]
mlk3 <- mlk[17:25]
mlk4 <- mlk[26:31]


# calculating the score for each quarter
score1 <- speechscorefunction(mlk1,wordlist)

score2 <- speechscorefunction(mlk2,wordlist)

score3 <- speechscorefunction(mlk3,wordlist)

score4 <- speechscorefunction(mlk4, wordlist)




# step 4
# plotting the scores for each quarter on a barplot
library(ggplot2)
library(reshape2)
scorevector <- c(score1,score2,score3,score4)

barplot(scorevector, main= "sentiment score for each quarter", ylab= "quarter", xlab = "score",ylim = c(0,35))


