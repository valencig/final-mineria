

# Intentar poner aquí:
#   Imputación/eliminación
#   Cambio de factor a entero
#   Eliminación de variables



cambio_caracter <- function(column){
  as.character(column)
}

quitar_interrogacion <- function(n_columna){
  col_uno <- as.character(autos_data[,n_columna])
  col_uno <- replace(col_uno,col_uno=="?","")
  col_uno <- as.numeric(col_uno)
  autos_data[,n_columna] <- col_uno
  autos_data[,n_columna] 
}

# quitar_interrogacion(2)

autos_decode <- function(columna){
  if(is.character(columna)){
    unlist(autos_codes[columna],use.names = F)
  }else{
    columna
  }
}

