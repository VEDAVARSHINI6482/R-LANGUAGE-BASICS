#NATIVE BAYES
#IMPORTING THE DATASET
dataset = read.csv('Social_Network_Ads.csv')
View(dataset)
dataset = dataset[3:5]
View(dataset)
#ENCODING THE TARGET FEATURE AS FACTOR
dataset$Purchased = factor(dataset$Purchased, levels = c(0,1))

#SPLITING THE DATASET INTO THE TRAINING SET AND TEST SET 
#INSTALL.PACKAGES('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
View(training_set)
test_set = subset(dataset, split == FALSE)
View(test_set)
#FEATURE SCALING
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])

#FITTING NATIVE BAYES TO THE TRAINING SET
install.packages('e1071')
library(e1071)
classifier = naiveBayes(x = training_set[-3], y = training_set$Purchased)

#PREDICTING THE TEST SET RESULTS
y_pred = predict(classifier, newdata = test_set[-3])

#MAKING THE CONFUSION MATRIX
cm = table(test_set[, 3], y_pred)
View(cm)