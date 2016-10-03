# IST 687
# HW 3
# Daniel Fernandes

# Task 1
sampleDistribution <- rnorm(1000, mean = 80, sd= 1)

checkSample <- function(myVector, min, max)
{
 numberOfValues <- 0
 for(value in myVector)
 {
   if((value >= min) & (value <= max))
   {
     numberOfValues = numberOfValues + 1
   }
 }

  return (numberOfValues)
}

checkSample(sampleDistribution, 79, 81)

# repeat 1
sampleDistribution <- rnorm(1000, mean = 80, sd= 1)
checkSample(sampleDistribution, 79, 81)

#repeat 2
sampleDistribution <- rnorm(1000, mean = 80, sd= 1)
checkSample(sampleDistribution, 79, 81)

# repeat 3
sampleDistribution <- rnorm(1000, mean = 80, sd= 1)
checkSample(sampleDistribution, 79, 81)



# Task 2
# created random pareto distribution
FSApops <- rpareto(51, scale = 1000000, shape = 1)
#create a histogram 
hist(FSApops)

# mean and sd of FSApops
mean(FSApops)
sd(FSApops)
# Max value and minimum value
max(FSApops)
min(FSApops)
