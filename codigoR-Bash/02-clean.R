#problematic_rows <- problems(walmart_data)$row

#imports_85_data[problematic_rows,] <- walmart_data %>% 
#  slice(problematic_rows) %>% 
#  unite(col="all", -seq(1:13), sep = "/", remove=TRUE) %>% 
#  extract(all, into=c("curb_weight", "engine_type", "resto"), regex="([0-9]{4})([a-z]*)/(.*)/NA", remove=TRUE) %>% 
#  separate(resto, into=names(imports_85_data)[16:26], sep="/", remove=TRUE) 

#imports_85_data <- 
#imports_85_data %>% mutate_at(1:26, funs(imports_85_clean_data))

walmart_data <- walmart_data %>% mutate_at(c(6),funs(walmart_clean_data))

#walmart_data <- walmart_data %>% mutate_at(c(3,6),funs(walmart_clean_factor_data))

walmart_data <- readr::type_convert(walmart_data)

walmart_data  <- walmart_data %>% 
  mutate_at(c(1,3),funs(as.factor))
