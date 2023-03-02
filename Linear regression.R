#IMPORTING DATASET 
dataset = read.csv("Admission_Predict.csv")
View(dataset)
str(dataset)

#SLICING DATA
gre = dataset [, 2]
coa = dataset [, 9]

#DATASET FOR SLR
data <- data.frame(gre, coa)
View(data)

#IMPORTING DATA SPLITTING LIBRARY
library(caTools)

#GENERATING RANDOM NUMBERS
set.seed(42)

#DATA SPLITTING
split = sample.split(data$coa,SplitRatio = 0.8)

#TRAINING DATA
training_set = subset(data, split==TRUE)
View(training_set)

#TESTING DATA
testing_set = subset(data,split==FALSE)
View(testing_set)

#APPLYING REGRESSION
regressor= lm(formula = coa~gre,data = training_set)

#PREDICTION
y_pred = predict(regressor, newdata = testing_set)
View(y_pred)

#IMPORTING ggplot LIBRARY
library(ggplot2)

#VISUALIZATION
plot(testing_set$gre, testing_set$coa, type = 'p', col = 'blue', xlab ='GRE', ylab = 'COA')
lines(testing_set$gre, y_pred, type = 'o', col = 'red')

#VISUALIZATION
ggplot(testing_set, aes(x = gre)) + 
  geom_point(aes(y = coa,colour = 'Actual')) + 
  geom_line(aes(y = y_pred, colour = 'Predicted'))
