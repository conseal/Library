# All packages, emails, train, and test have been pre-loaded
# emails from UCI, train and test as fractions from this dataset.

# Set random seed. Don't remove this line
set.seed(1)

# Load the rpart, rattle, rpart.plot and RColorBrewer package
library(rattle)
library(rpart)
library(rpart.plot)
library(RColorBrewer)


# Set random seed. Don't remove this line.
set.seed(1)

# Train and test tree with gini criterion
tree_g <- rpart(spam ~ ., train, method = "class")
pred_g <- predict(tree_g, test, type = "class")
conf_g <- table(test$spam, pred_g)
acc_g <- sum(diag(conf_g)) / sum(conf_g)

# Change the first line of code to use information gain as splitting criterion
tree_i <- rpart(spam ~ ., train, method = "class", parms = list(split = "information"))
pred_i <- predict(tree_i, test, type = "class")
conf_i <- table(test$spam, pred_i)
acc_i <- sum(diag(conf_i)) / sum(conf_i)

# Draw a fancy plot of both tree_g and tree_i
fancyRpartPlot(tree_g)
fancyRpartPlot(tree_i)

# Print out acc_g and acc_i
acc_g
acc_i
