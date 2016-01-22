# train and test are pre-loaded

# Code of previous exercise
set.seed(1)
tree <- rpart(income ~ ., train, method = "class")
probs <- predict(tree, test, type = "prob")[,2]

# Load the ROCR library
library(ROCR)

# Make a prediction object: pred
pred <- prediction(probs, test$income)

# Make a performance object: perf
perf <- performance(pred, "tpr", "fpr")

# Plot this curve
plot(perf)

# Calculate Area Under Curve
perf2 <- performance(pred, "auc")

# Print out the AUC
perf2@y.values[[1]]