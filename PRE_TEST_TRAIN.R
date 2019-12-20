########## para train

train <- read.csv("train.csv", header = TRUE)
train <- train %>% mutate(DepartmentDescription = replace(DepartmentDescription, DepartmentDescription == "MENSWEAR", "MENS WEAR"))
train <- train %>% mutate(DepartmentDescription = replace(DepartmentDescription, DepartmentDescription == "OPTICAL - FRAMES", "OPTICAL - LENSES"))
train <- train %>% mutate(DepartmentDescription = replace(DepartmentDescription, DepartmentDescription == "NULL", NA))
unique(train$DepartmentDescription)
OldDataLong <- train[c(1,2,6)]
OldDataLong$VisitNumber <- factor(OldDataLong$VisitNumber)
OldDataLong$TripType <- factor(OldDataLong$TripType)
OldDataLong <- OldDataLong %>% group_by(TripType, VisitNumber) %>% count(DepartmentDescription)
DataWide <- spread(OldDataLong, DepartmentDescription, n)
#Los NAs los transformamos en 0s para poder sumar
DataWide[,1:69][is.na(DataWide[, 1:69])] <- 0
DataWide <- DataWide[,-which(colnames(DataWide)=="<NA>")]
DataWide <- DataWide%>%select(-`HEALTH AND BEAUTY AIDS`,everything())

na_count_train <-sapply(DataWide, function(y) sum(length(which(is.na(y)))))
na_count_train <- data.frame(na_count_train)
pre_train <- DataWide
write.csv(DataWide, "pre_train.csv")

########## para test

test <-read.csv("test2.csv", header = TRUE)
test <- test %>% mutate(DepartmentDescription = replace(DepartmentDescription, DepartmentDescription == "MENSWEAR", "MENS WEAR"))
test <- test %>% mutate(DepartmentDescription = replace(DepartmentDescription, DepartmentDescription == "OPTICAL - FRAMES", "OPTICAL - LENSES"))
test <- test %>% mutate(DepartmentDescription = replace(DepartmentDescription, DepartmentDescription == "NULL", NA))
unique(test$DepartmentDescription)
OldDataLong <- test[c(1,5)]
OldDataLong$VisitNumber <- factor(OldDataLong$VisitNumber)
OldDataLong <- OldDataLong %>% group_by(VisitNumber) %>% 
  count(DepartmentDescription)
DataWide <- spread(OldDataLong, DepartmentDescription, n)
#Los NAs los transformamos en 0s para poder sumar
DataWide[,1:67][is.na(DataWide[, 1:67])] <- 0
DataWide <- DataWide[,-which(colnames(DataWide)=="<NA>")]

na_count_test <-sapply(DataWide, function(y) sum(length(which(is.na(y)))))
na_count_test <- data.frame(na_count_test)

DataWide$`HEALTH AND BEAUTY AIDS` <- 0 
DataWide <- DataWide%>%select(-`HEALTH AND BEAUTY AIDS`,everything())
pre_test <- DataWide

write.csv(DataWide, "pre_test.csv")
