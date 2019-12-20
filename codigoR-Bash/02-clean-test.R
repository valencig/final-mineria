walmart_test <- walmart_test %>% mutate_at(c(5),funs(walmart_clean_data_test))

#walmart_data <- walmart_data %>% mutate_at(c(3,6),funs(walmart_clean_factor_data))

walmart_test <- readr::type_convert(walmart_test)

walmart_test  <- walmart_test %>% 
  mutate_at(c(2,3,6),funs(as.factor))
