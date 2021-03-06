setwd("H:\\Dateneingangskontrolle\\A - Library")

library(plyr)
library(dplyr)
# install.packages("randomForest")
library(randomForest)

data <- iris

glimpse(iris)

# cross validation, using random forest to predict sepal.length
k <- 5

data$id <- sample(1:k, nrow(data), replace = TRUE)
list <- 1:k

# prediction and test set data frame that we add to with each 
# iteration over the folds
prediction  <- data.frame()
testsetCopy  <- data.frame()

# Creating a progress bar to know the status of CV
progress.bar <- create_progress_bar("text")
progress.bar$init(k)

# function for k fold
for(i in 1:k) 
{
  # remove rows with id i from dataframe to create training set 
  # remove rows with id i to create test set
  trainingset <- subset(data, id %in% list[-i])
  testset <- subset(data, id %in% c(i))
  
  # run a random forest model
  mymodel <- randomForest(trainingset$Sepal.Length ~., 
                          data = trainingset, ntree= 100)
  
  # remove response column 1, Sepal.Length
  temp <- as.data.frame(predict(mymodel, testset[,-1]))
  
  # append this iteration's predictions to the end of the prediction 
  # data frame
  prediction <- rbind(prediction, temp)
  
  # append this iteration's test set to the test set copy data frame
  # keep only the Sepal Length Column
  testsetCopy <- rbind(testsetCopy, as.data.frame(testset[,1]))
  
  progress.bar$step()
}

# add predictions and actual Sepal Length values

result <- cbind(prediction, testsetCopy[,1])
names(result) <- c("Predicted", "Actual")
result$Difference <- abs(result$Actual - result$Predicted)

# As an example use Mean Absolute Error as Evaluation
summary(result$Difference)
