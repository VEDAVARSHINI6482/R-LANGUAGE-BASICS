#MEASURE OF CENTRAL TENDENCY
#IMPORTING LIBRARY
library(modeest)
 
#IMPORTING DATASET
#setwd("D:\\00)
neo <- read.csv("neo.csv")
View(neo)

#MEAN
diamin <- mean(neo$Estimated.Diameter.minimum..m.)
print(diamin)
diamax <- mean(neo$Estimated.Diameter.maximum..m.)
print(diamax)
avgvelr <- mean(neo$Vrelative..km.s.)
print(avgvelr)
avddist <- mean(neo$CA.Distance.Minimum..au.)
print(avddist)
avgvinf <- mean(neo$V.infinity..km.s.)
print(avgvinf)
avghmag <- mean(neo$H..mag.)
print(avghmag)
 
#MEDIAN
middist <- median(neo$CA.Distance.Nominal..au.)
print(middist)
middist <- median(neo$Vrelative..km.s.)
print(middist)
middist <- median(neo$V.infinity..km.s.)
print(middist)
#MODE
modemag <- mfv(neo$H..mag.)
print(modemag)