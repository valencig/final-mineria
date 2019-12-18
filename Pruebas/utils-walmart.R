
load <- function(){
  walmart_train <- read.csv("train.csv")
  print('walmart train se descargó y guardó\n')
  return(walmart_train)
} 

# autos_decode <- function(columna){
#  if(is.character(columna)){
#     unlist(autos_codes[columna],use.names = F)
#   }else{
#     columna
#   }
# }


walmart_clean_colnames <- function(x){
  str_replace_all(tolower(x),"/| ",'_')
}
