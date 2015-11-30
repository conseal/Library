# Test 2 datasets that have the same variables (and the same ordering) whether
# they are identical in every variable. If not print those variables that
# are not identical.

setwd("H:\\Dateneingangskontrolle")

library(foreign)

file1 <- read.spss("file1.sav", to.data.frame = TRUE)
file2 <- read.spss("file1_new.sav", to.data.frame = TRUE)

vector <- NULL
test <- NULL
message <- NULL

for(i in 1:length(file1))
{
  test <- identical(as.vector(table(file1[i])), as.vector(table(file2[i])))
  if(test != TRUE)
  {
    message <- c(message, i)
    print(i)
  } else
  {
    message <- c(message, TRUE)
  }
  vector <- c(vector, message)
}

table(vector)
# Print variable label of not identical variables
# attr(file1, which = "variable.labels")[290]
