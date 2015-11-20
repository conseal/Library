setwd("H:\\Dateneingangskontrolle\\A - Library")

library(plyr)
library(dplyr)
# install.packages("randomForest")
library(randomForest)

data <- read.csv("H:\\PRIVAT\\R examples\\Machine_Learning\\titanic.csv")
data <- as.data.frame(data)
names(data)

glimpse(data)

# data <- data[,order(c(2,1,3:length(data)))]

# glimpse(data)

data <- subset(data, !is.na(data$age))
data$age <- cut(data$age, seq(0, max(data$age), 5))

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
  mymodel <- randomForest(trainingset$survived ~ pclass + age + sex, 
                          na.action = na.omit,
                          data = trainingset, ntree= 500)
  
  # remove response column 1, Sepal.Length
  temp <- as.data.frame(predict(mymodel, testset[,c(2,5,11)]))
  
  # append this iteration's predictions to the end of the prediction 
  # data frame
  prediction <- rbind(prediction, temp)
  
  # append this iteration's test set to the test set copy data frame
  # keep only the Sepal Length Column
  testsetCopy <- rbind(testsetCopy, as.data.frame(testset[,3]))
  
  progress.bar$step()
}

# add predictions and actual Sepal Length values

result <- cbind(prediction, testsetCopy)
names(result) <- c("Predicted", "Actual")
result$PredSurv <- ifelse(result$Predicted >= 0.5, 1, 0)
result$Difference <- abs(result$Actual - result$PredSurv )

# As an example use Mean Absolute Error as Evaluation
summary(result$Difference)
