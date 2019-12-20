a<- walmart_test%>%
  group_by(VisitNumber, Weekday, Upc, DepartmentDescription,FinelineNumber, Department_E2, ScanType_E1) %>%
  summarise(ScanCount = sum(as.numeric(ScanCount), na.rm = T))

test <- spread(a, DepartmentDescription, ScanCount) %>%
  mutate_all(function(x) ifelse( is.na(x), 0, x)) %>%
  group_by(VisitNumber, Weekday)%>%
  summarise_at(7:67,sum,na.rm = T)

write.csv(test,'../Python/test_clean.csv')