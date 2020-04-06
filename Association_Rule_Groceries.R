library(arules)
groceries<-read.transactions(file.choose(),format="basket",sep = ',', rm.duplicates = TRUE)
View(groceries)
inspect(groceries[1:10])
class(groceries)
summary(groceries)
# itemFrequencyPlot can be applicable only for transaction data 
# count of each item from all the transactions 
itemFrequencyPlot(groceries,topN=20)
groceries_rules<-apriori(groceries,parameter = list(support = 0.002,confidence = 0.04,minlen=3))
groceries_rules
library(arulesViz)
plot(groceries_rules,method = "scatterplot")
plot(groceries_rules,method = "grouped")
plot(groceries_rules,method = "graph")

groceries_rules <- sort(groceries_rules,by="lift")


inspect(groceries_rules[1:8])
#by changing length
groceries_rules<-apriori(groceries,parameter = list(support = 0.002,confidence = 0.04,minlen=5))
groceries_rules
library(arulesViz)
plot(groceries_rules,method = "scatterplot")
plot(groceries_rules,method = "grouped")
plot(groceries_rules,method = "graph")

groceries_rules <- sort(groceries_rules,by="lift")
inspect(groceries_rules[1:8])

#by changing confidence
groceries_rules<-apriori(groceries,parameter = list(support = 0.002,confidence = 0.08,minlen=5))
groceries_rules
#library(arulesViz)
plot(groceries_rules,method = "scatterplot")
plot(groceries_rules,method = "grouped")
plot(groceries_rules,method = "graph")

groceries_rules <- sort(groceries_rules,by="lift")
inspect(groceries_rules[1:8])

