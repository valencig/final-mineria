b<- walmart_data%>%
  group_by(TripType, VisitNumber, Weekday, Upc, DepartmentDescription,FinelineNumber, Department_E2) %>%
  summarise(ScanCount = sum(as.numeric(ScanCount), na.rm = T))

train <- spread(b, DepartmentDescription, ScanCount) %>%
  mutate_all(function(x) ifelse( is.na(x), 0, x)) %>%
  group_by(VisitNumber, Weekday)%>%
  summarise_at(7:67,sum,na.rm = T)

write.csv(train,'../Python/train_clean.csv')