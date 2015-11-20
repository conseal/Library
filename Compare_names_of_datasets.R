setwd("H:\\Dateneingangskontrolle\\Datorium\\Posaunenchorbefragung 2012")

library(foreign)

mitg <- read.spss("Mitglieder.sav", to.data.frame = TRUE)
mitgChor <- read.spss("Mitglieder_mit_chorleiterdaten.sav", to.data.frame = TRUE)

a1 <- names(mitg)
a2 <- names(mitgChor)
which(!a1 %in% a2) 
a1[which(!a1 %in% a2)]
which(!a2 %in% a1) 
a2[which(!a2 %in% a1)]
