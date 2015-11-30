df <- mtcars

strNames <- paste(names(df)[1], "value", 1:10, sep="_")
output <- as.data.frame(matrix(rep(NA, length(strNames)), nrow=1))
names(output) <- c(strNames)
  
df2 <- data.frame(values= row.names(df), output)
