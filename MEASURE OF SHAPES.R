#VARIATION IN DATA 
#IMPORTING DATASET
neo <- read.csv("neo.csv")

#VIEWING DATASET
View(neo)

#RANGE
range <- max(neo$Vrelative..km.s.) - min(neo$Vrelative..km.s.)
print(range)
range<- max(neo$H..mag.) - min(neo$H..mag.)
print(range)

#STANDARD DEVIATION
sdofvelocity <- sd(neo$Vrelative..km.s.)
print(sdofvelocity)
sdofmag <- sd(neo$H..mag.)
print(sdofmag)

#VARIANCE
varofvelocity <- var(neo$Vrelative..km.s.)
print(varofvelocity)
varofmag <- var(neo$H..mag.)
print(varofmag)

#VIEWING DATASET
View(neo)

#KURTOSIS
kurtosis <- (neo$CA.Distance.Minimum..au.)
View(kurtosis)

#SKEWNESS
skewness <- (neo$CA.Distance.Minimum..au.) 
View(skewness)

