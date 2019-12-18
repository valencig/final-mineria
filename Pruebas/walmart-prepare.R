# walmart_train  <- walmart_train %>% 
#  mutate_all(funs(autos_decode))

walmart_train  <- walmart_train %>% 
  mutate_at(c(3,6),funs(as.factor))

walmart_train  <- walmart_train %>% 
  mutate_at(c(4),funs(as.double))

walmart_train  <- walmart_train %>% 
  mutate_at(c(1,2,5,7),funs(as.integer))
