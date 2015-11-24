setwd("H:\\Dateneingangskontrolle\\")

library(foreign)

file1 <- read.spss("file1.sav", to.data.frame = TRUE)
file2 <- read.spss("file2.sav", to.data.frame = TRUE)

a1 <- names(file1)
a2 <- names(file2)
which(!a1 %in% a2) 
a1[which(!a1 %in% a2)]
which(!a2 %in% a1) 
a2[which(!a2 %in% a1)]
