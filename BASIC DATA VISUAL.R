#IMPORTING LIBRARIES
library(ggplot2)
library(dplyr)
#IMPORTING DATASET 
expenses <- read.csv("dailyexpenses.csv")
#VIEWING DATASET
View(expenses)
#DATA TYPE CONVERSION
str(expenses)
expenses$Date <- as.Date(expenses$Date, "%d/%m/%y")
View(expenses)
#DATA FRAME FOR COMPARING EXPENSES
tot <- expenses[, 2:9]
total <- colSums(tot) 
detail <- c("food", "groceries", "medical", "fuel", "toll", "phone", "electricity","miscellaneous")
tot_each <- data.frame(detail, total)
View(tot_each)
#BAR PLOT OF EXPENSES
 ggplot(data = tot_each, aes(x = detail, y = total))+geom_bar(stat =  "identity", fill = "purple") + labs(x = "Items", y = "Expenses", title = "Comparing Expenses")
#DATAFRAME FOR DAILY TOTAL EXPENSES
cm <- expenses[, 2:9]
dt <- expenses[, 1]
rs <- rowSums(cm)
daily_tot <- data.frame(dt, rs)
View(daily_tot)
#LINE PLOT FOR DAILY TOTAL EXPENSES
 ggplot(data = daily_tot, aes(x = dt, y = rs)) + geom_line(colour = "red", linewidth = 2) + labs(x = "Date", y = "Expenses", title = "Total Expenses")
#DATAFRAME OF DAILY MEDICAL EXPENSES
md <- expenses[, 3]
de <- expenses[, 1]
daily_med <- data.frame(de, md)
View(daily_med)
#SCATTER PLOT OF DAILY MEDICAL EXPENSE
ggplot(data = daily_med, aes(x = de, y = md)) + geom_point() + labs(x = "Expenses", y = "Medical", title = "Medical Expenses")
#HISTOGRAM OF MEDICAL EXPENSES
ggplot(expenses, aes(x = Medical)) + geom_histogram(binwidth = 5, colour = "black", fill = "blue")
#PIE CHART
#IMPORTING DATASET FOR PIE CHART
pc <- read.csv("piechart.csv")
View(pc)
#PIE CHART
pie <- ggplot(pc, aes(x = "", y = amount, fill = factor(expense))) + geom_bar(width = 1, stat = "identity") + theme(axis.line = element_blank(), plot.title = element_text(hjust = 0.5)) + labs(fill = "expense", x = NULL, y = NULL, title = "Pie Chart of expenses") pie + coord_polar(theta = "y", start = 0)

 