# IST 687
# Daniel Fernandes
# HW 2

# Task 1

# copy of mtcars
my_cars <- mtcars

# create new column and assign it the value of disp/cyl
my_cars$disppercyl <- (my_cars$disp / my_cars$cyl)
# print summary of new column
summary(my_cars$disppercyl)



# Task 2
# create data for family friends
userIDs <- c(1, 2, 3, 4, 5)
pets <- c(2, 1, 0, 0, 3)
order <- c(2, 3, 1, 1, 2)
siblings <- c(1, 2, 2, 1, 1)

# create a data frame of that data
myFriends <- data.frame(userIDs, pets, order, siblings)
myFriends

# display the structure of the data 
str(myFriends)
# display summary of data to show the min mean, median
summary(myFriends)

# display user IDs column in data frame
myFriends$userIDs
# display pets column in data frame
myFriends$pets
# display birth order column in data frame
myFriends$order
# display number of siblings column in data frame
myFriends$siblings

