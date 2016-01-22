# Choose k for k-nearest neighbors
# knn_train, knn_test, train_labels and test_labels are pre-loaded
# titanic dataset

# Set random seed. Don't remove this line.
set.seed(1)

# Load the class package, define range and accs
library(class)
range <- 1:round(0.2 * nrow(knn_train))
accs <- rep(0, length(range))

for (k in range) {
  
  # Make predictions using knn: pred
  pred <- knn(knn_train, knn_test, train_labels, k)
  
  # Construct the confusion matrix: conf
  conf <- table(test_labels, pred)    
  
  # Calculate the accuracy and store it in accs[k]
  accs[k] <- sum(diag(conf))/sum(conf)
}

# Plot the accuracies. Title of x-axis is "k".
plot(range, accs, xlab = "k")

# Calculate the best k
which.max(accs)