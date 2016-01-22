# setwd("H:\\Dateneingangskontrolle\\")
# 
# library(foreign)
# 
# file1 <- read.spss("file1.sav", to.data.frame = TRUE)
# file2 <- read.spss("file2.sav", to.data.frame = TRUE)

# a1 <- names(file1)
# a2 <- names(file1)
vector <- NULL
for(i in 1:length(a1))
{
  if(all.equal(a1[i], a2[i]) != TRUE)
  {
    print(i)
    if(!is.null(vector))
    {
      vector <- c(vector, i)
    } else
    {
      vector <- i
    }
  }
}
if(!is.null(vector))
{
  print(a1[c(vector)])
  print(a2[c(vector)])
}
