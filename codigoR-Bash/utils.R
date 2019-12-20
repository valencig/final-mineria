load <- function(){
  if(!file.exists('../Data/walmart.rds')){
    walmart_data <- read_csv('../Data/train.csv',
                              col_names=TRUE)#,
#                              na = "?")
    saveRDS(walmart_data, "../Data/walmart.rds")
    print('walmart.rds se guardó')
  }
  else{
    warning('walmart.rds ya existe')
    walmart_data <- readRDS("../Data/walmart.rds")
  }
  
  return(walmart_data)
}


#walmart_clean_colnames <- function(x){
#  str_replace_all(x,'-','_')
#}

walmart_clean_data <- function(x){
  str_replace_all(x,c(','='',' - '='_' , '  '='_','-' = '_', '__'='_', '___'='_',' '='_', '/'='_'))#, '\\?'='(other)'))
}

save.rds.wal <- function(num){
    saveRDS(walmart_data, paste("../Data/walmart_",num,".rds",sep=""))
    print(paste("walmart_",num,".rds"," se guardó",sep=""))
}

add.variables<- function(df){
source("groups2.R")
df %>%
 # group_by(TripType, VisitNumber, Weekday, Upc, DepartmentDescription, FinelineNumber) %>%
 # summarise(ScanCount = sum(ScanCount)) %>%
 # ungroup() %>%
  mutate(ScanType_E1 = factor(ifelse(ScanCount > 0, 'Purchase', 
                            ifelse(ScanCount < 0,'Return','Check'))),
         Weekday  = factor(Weekday, levels = c('Monday', 'Tuesday','Wednesday', 
                                              'Thursday', 'Friday', 'Saturday', 
                                              'Sunday')),
         DepartmentDescription = factor(DepartmentDescription),
         Department_E2=DepartmentDescription)
  
         
         
         
         
         
  #        
  #        Department_E2 = factor(ifelse(DepartmentDescription %in% electronics_office, 'ELECTRONICS_AND_OFFICE',
  #                      ifelse(DepartmentDescription %in% movies_music_books, 'MUSIC_MOVIES_AND_BOOKS',
  #                       ifelse(DepartmentDescription %in% home_forniture_appliances, 'HOME_AND_APPLIANCES',
  #                        ifelse(DepartmentDescription %in% improvement_patio, 'HOME_IMPROVEMENT_AND_PATIO',
  #                         ifelse(DepartmentDescription %in% clothing, 'CLOTHING',
  #                          ifelse(DepartmentDescription %in% shoes_accessories, 'SHOES_AND_ACCESSORIES',
  #                          ifelse(DepartmentDescription %in% baby_toddler, 'BABY_AND_TODDLER',
  #                           ifelse(DepartmentDescription %in% toys_videogames, 'TOYS_AND_VIDEOGAMES',
  #                            ifelse(DepartmentDescription %in% food, 'FOOD',
  #                             ifelse(DepartmentDescription %in% household, 'HOUSEHOLD',
  #                              ifelse(DepartmentDescription %in% pharma_optical, 'PHARMACY_AND_OPTICAL',
  #                               ifelse(DepartmentDescription %in% beauty, 'HEALTH_AND_BEAUTY',
  #                               ifelse(DepartmentDescription %in% sports_fit_outdoors, 'SPORTS_FITNESS_AND_OUTDOORS',
  #                                ifelse(DepartmentDescription %in% auto_tires_industrial, 'AUTOMOTIVE_AND_TIRES',
  #                                 ifelse(DepartmentDescription %in% photo_personalized, 'PHOTO_AND_PERSONALIZED',
  #                                  ifelse(DepartmentDescription %in% art_craft_party, 'ART_CRAFT_AND_PARTY', as.character(DepartmentDescription)))))))))))))))))),
  #        DepartmentDescription = str_replace(DepartmentDescription, 'MENSWEAR', 'MENS_WEAR'),
  #        DepartmentDescription=str_replace(DepartmentDescription, 'HEALTH AND BEAUTY AIDS' , 'BEAUTY'),
  #        DepartmentDescription = str_replace(DepartmentDescription, 'GIRLS_WEAR_4_6X_AND_7_14|BOYS_WEAR', 'KIDS_WEAR'),
  #        DepartmentDescription = str_replace(DepartmentDescription, 'LADIES_SOCKS|BRAS_&_SHAPEWEAR|SHEER_HOSIERY|SLEEPWEAR_FOUNDATIONS|PLUS_AND_MATERNITY', 'LADIESWEAR')) %>%
  # mutate(Upc = as.character(format(Upc, scientific = FALSE)),
  #        ManufacturerCode_E3 = ifelse(grepl("[0-9]{12}", Upc),substr(Upc, 2, 6),
  #                             ifelse(grepl("[ ][0-9]{11}", Upc),substr(Upc, 2, 6), 
  #                               ifelse(grepl("[ ]{2}[0-9]{10}", Upc),substr(Upc, 3, 7),
  #                                 ifelse(grepl("[ ]{3}[0-9]{9}", Upc),substr(Upc, 4, 7),
  #                                   ifelse(grepl("[ ]{4}[0-9]{8}", Upc),substr(Upc, 5, 8),
  #                                     ifelse(grepl("[ ]{7}[0-9]{5}", Upc),"wwwww",
  #                                       ifelse(grepl("[ ]{8}[0-9]{4}", Upc),"wwwww",
  #                                         ifelse(grepl("[ ]{10}NA", Upc) & DepartmentDescription %in% c("PHARMACY_RX"), "unk_ph",
  #                                           ifelse(grepl("[ ]{10}NA", Upc) & DepartmentDescription %in% c("NULL"), "unk_null",
  #                                             "unk")))))))))) %>%
  # mutate(ProductCode_E4 = ifelse(grepl("[0-9]{12}", Upc),substr(Upc, 7, 11),
  #                        ifelse(grepl("[ ][0-9]{11}", Upc),substr(Upc, 7, 11), 
  #                          ifelse(grepl("[ ]{2}[0-9]{10}", Upc),substr(Upc, 8, 12),
  #                            ifelse(grepl("[ ]{3}[0-9]{9}", Upc),substr(Upc, 8, 11),
  #                              ifelse(grepl("[ ]{4}[0-9]{8}", Upc),substr(Upc, 9, 12),
  #                                ifelse(grepl("[ ]{7}[0-9]{5}", Upc),substr(Upc, 8, 11),
  #                                  ifelse(grepl("[ ]{8}[0-9]{4}", Upc),substr(Upc, 9, 12),
  #                                    ifelse(grepl("[ ]{10}NA", Upc) & DepartmentDescription %in% c("PHARMACY_RX"), "unk_ph",
  #                                      ifelse(grepl("[ ]{10}NA", Upc) & DepartmentDescription %in% c("NULL"), "unk_null",
  #                                        "unk"))))))))),
  #        DepartmentDescription = factor(DepartmentDescription),
  #         ManufacturerCode_E3 = factor( ManufacturerCode_E3),
  #        ProductCode_E4 = factor(ProductCode_E4))
}

generate_groups<-function(df){
  
  df$Department_E2<- str_replace_all(df$Department_E2,'MEDIA_AND_GAMING' ,'TOYS_VIDEOGAMES')
  df$Department_E2<- str_replace_all(df$Department_E2,'PLAYERS_AND_ELECTRONICS' ,'TOYS_VIDEOGAMES')
  df$Department_E2<- str_replace_all(df$Department_E2,'TOYS' ,'TOYS_VIDEOGAMES')
  
  df$Department_E2<- str_replace_all(df$Department_E2,'HORTICULTURE_AND_ACCESS' ,'IMPROVEMENT_PATIO')
  df$Department_E2<- str_replace_all(df$Department_E2,'LAWN_AND_GARDEN' ,'IMPROVEMENT_PATIO')
  df$Department_E2<- str_replace_all(df$Department_E2, 'PAINT_AND_ACCESSORIES','IMPROVEMENT_PATIO')
  
  df$Department_E2<- str_replace_all(df$Department_E2, 'ACCESSORIES', 'ELECTRONICS_OFFICE')
  df$Department_E2<- str_replace_all(df$Department_E2, 'ELECTRONICS','ELECTRONICS_OFFICE')
  df$Department_E2<- str_replace_all(df$Department_E2, 'HARDWARE','ELECTRONICS_OFFICE')
  df$Department_E2<- str_replace_all(df$Department_E2, 'OFFICE_SUPPLIES','ELECTRONICS_OFFICE')
  df$Department_E2<- str_replace_all(df$Department_E2, 'WIRELESS','ELECTRONICS_OFFICE')
  df$Department_E2<- str_replace_all(df$Department_E2, 'CAMERAS_AND_SUPPLIES','ELECTRONICS_OFFICE')
  
  df$Department_E2<- str_replace_all(df$Department_E2, 'BOOKS_AND_MAGAZINES', 'MOVIES_MUSIC_BOOKS')
  
  df$Department_E2<- str_replace_all(df$Department_E2, 'BEDDING', 'HOME_FORNITURE_APPLIANCES')
  df$Department_E2<- str_replace_all(df$Department_E2, 'CONCEPT_STORES','HOME_FORNITURE_APPLIANCES')
  df$Department_E2<- str_replace_all(df$Department_E2, 'COOK_AND_DINE','HOME_FORNITURE_APPLIANCES')
  df$Department_E2<- str_replace_all(df$Department_E2, 'FURNITURE','HOME_FORNITURE_APPLIANCES')
  df$Department_E2<- str_replace_all(df$Department_E2, 'HOME_DECOR','HOME_FORNITURE_APPLIANCES')
  df$Department_E2<- str_replace_all(df$Department_E2, 'HOME_MANAGEMENT','HOME_FORNITURE_APPLIANCES')
  df$Department_E2<- str_replace_all(df$Department_E2, 'LARGE_HOUSEHOLD_GOODS','HOME_FORNITURE_APPLIANCES')
  
  df$Department_E2<- str_replace_all(df$Department_E2, 'BOYS_WEAR','CLOTHING')
  df$Department_E2<- str_replace_all(df$Department_E2, 'BRAS_&_SHAPEWEAR','CLOTHING')
  df$Department_E2<- str_replace_all(df$Department_E2, 'GIRLS_WEAR_4_6X_AND_7_14','CLOTHING')
  df$Department_E2<- str_replace_all(df$Department_E2, 'JEWELRY_AND_SUNGLASSES','CLOTHING')
  df$Department_E2<- str_replace_all(df$Department_E2, 'LADIES_SOCKS','CLOTHING')
  df$Department_E2<- str_replace_all(df$Department_E2, 'LADIESWEAR','CLOTHING')
  df$Department_E2<- str_replace_all(df$Department_E2, 'MENSWEAR','CLOTHING')
  df$Department_E2<- str_replace_all(df$Department_E2, 'MENS_WEAR','CLOTHING')
  df$Department_E2<- str_replace_all(df$Department_E2, 'KIDSWEAR','CLOTHING')
  df$Department_E2<- str_replace_all(df$Department_E2, 'PLUS_AND_MATERNITY','CLOTHING')
  df$Department_E2<- str_replace_all(df$Department_E2, 'SHEER_HOSIERY','CLOTHING')
  df$Department_E2<- str_replace_all(df$Department_E2, 'SLEEPWEAR_FOUNDATIONS','CLOTHING')
  
  df$Department_E2<- str_replace_all(df$Department_E2, 'JEWELRY_AND_SUNGLASSES','SHOES_ACCESSORIES')
  df$Department_E2<- str_replace_all(df$Department_E2, 'SHOES','SHOES_ACCESSORIES')
  
  df$Department_E2<- str_replace_all(df$Department_E2, 'INFANT_CONSUMABLE_HARDLINES','BABY_TODDLER' )
  df$Department_E2<- str_replace_all(df$Department_E2, 'INFANT_APPAREL','BABY_TODDLER' )
  
  df$Department_E2<- str_replace_all(df$Department_E2,'BAKERY' ,'FOOD')
  df$Department_E2<- str_replace_all(df$Department_E2,'CANDY_TOBACCO_COOKIES' ,'FOOD')
  df$Department_E2<- str_replace_all(df$Department_E2,'COMM_BREAD' ,'FOOD')
  df$Department_E2<- str_replace_all(df$Department_E2,'DAIRY' ,'FOOD')
  df$Department_E2<- str_replace_all(df$Department_E2,'DSD_GROCERY' ,'FOOD')
  df$Department_E2<- str_replace_all(df$Department_E2,'FROZEN_FOODS' ,'FOOD')
  df$Department_E2<- str_replace_all(df$Department_E2,'GROCERY_DRY_GOODS','FOOD')
  df$Department_E2<- str_replace_all(df$Department_E2,'MEAT_FRESH_&_FROZEN' ,'FOOD')
  df$Department_E2<- str_replace_all(df$Department_E2,'PRE_PACKED_DELI' ,'FOOD')
  df$Department_E2<- str_replace_all(df$Department_E2,'PRODUCE' ,'FOOD')
  df$Department_E2<- str_replace_all(df$Department_E2,'SEAFOOD' ,'FOOD')
  df$Department_E2<- str_replace_all(df$Department_E2,'SERVICE_DELI' ,'FOOD')
  df$Department_E2<- str_replace_all(df$Department_E2,'LIQUORWINEBEER' ,'FOOD')
  
  df$Department_E2<- str_replace_all(df$Department_E2,'HOUSEHOLD_CHEMICALS_SUPP' ,'HOUSEHOLD')
  df$Department_E2<- str_replace_all(df$Department_E2,'HOUSEHOLD_PAPER_GOODS' ,'HOUSEHOLD')
  
  df$Department_E2<- str_replace_all(df$Department_E2,'PHARMACY_OTC' ,'PHARMA_OPTICAL')
  df$Department_E2<- str_replace_all(df$Department_E2,'PHARMACY_RX' ,'PHARMA_OPTICAL')
  df$Department_E2<- str_replace_all(df$Department_E2,'OPTICAL_FRAMES' ,'PHARMA_OPTICAL')
  df$Department_E2<- str_replace_all(df$Department_E2,'OPTICAL_LENSES' ,'PHARMA_OPTICAL')
  
  df$Department_E2<- str_replace_all(df$Department_E2,'HEALTH_AND_BEAUTY_AIDS' ,'BEAUTY')
  df$Department_E2<- str_replace_all(df$Department_E2,'BEAUTY' ,'BEAUTY')
  df$Department_E2<- str_replace_all(df$Department_E2,'PERSONAL_CARE' ,'BEAUTY')
  df$Department_E2<- str_replace_all(df$Department_E2,'BATH_AND_SHOWER' ,'BEAUTY')
  
  df$Department_E2<- str_replace_all(df$Department_E2,'SPORTING_GOODS' ,'SPORTS_FIT_OUTDOORS')
  df$Department_E2<- str_replace_all(df$Department_E2,'SWIMWEAR_OUTERWEAR' ,'SPORTS_FIT_OUTDOORS')
  
  df$Department_E2<- str_replace_all(df$Department_E2,'AUTOMOTIVE' ,'AUTO_TIRES_INDUSTRIAL')
  
  df$Department_E2<- str_replace_all(df$Department_E2,'1_HR_PHOTO' ,'PHOTO_PERSONALIZED')
  
  df$Department_E2<- str_replace_all(df$Department_E2,'CELEBRATION' ,'ART_CRAFT_PARTY')
  df$Department_E2<- str_replace_all(df$Department_E2,'FABRICS_AND_CRAFTS' ,'ART_CRAFT_PARTY')
  df$Department_E2<- str_replace_all(df$Department_E2,'SEASONAL' ,'ART_CRAFT_PARTY')
  
  
  df$Department_E2<- str_replace_all(df$Department_E2,'TOYS_VIDEOGAMES_VIDEOGAMES' ,'TOYS_VIDEOGAMES')
  
  df$Department_E2<- str_replace_all(df$Department_E2,'ELECTRONICS_OFFICE_OFFICE' ,'ELECTRONICS_OFFICE')
  
  df$Department_E2<- str_replace_all(df$Department_E2,'IMPULSE_MERCHANDISE' ,'OTHER_DEPARTMENTS')
  
  df$Department_E2<- str_replace_all(df$Department_E2,'PETS_AND_SUPPLIES' ,'OTHER_DEPARTMENTS')
  
  return(df)
  
  
}


change_description <- function(df){
  
  df$DepartmentDescription<- str_replace_all(df$DepartmentDescription,'MENSWEAR' ,'MENS_WEAR')
  df$DepartmentDescription<- str_replace_all(df$DepartmentDescription,'HEALTH_AND_BEAUTY_AIDS' ,'BEAUTY')
  df$DepartmentDescription<- str_replace_all(df$DepartmentDescription,'LADIES_SOCKS' ,'LADIESWEAR')
  df$DepartmentDescription<- str_replace_all(df$DepartmentDescription,'BRAS_&_SHAPEWEAR' ,'LADIESWEAR')
  df$DepartmentDescription<- str_replace_all(df$DepartmentDescription,'SHEER_HOSIERY' ,'LADIESWEAR')
  df$DepartmentDescription<- str_replace_all(df$DepartmentDescription,'SLEEPWEAR_FOUNDATIONS' ,'LADIESWEAR')
  df$DepartmentDescription<- str_replace_all(df$DepartmentDescription,'PLUS_AND_MATERNITY' ,'LADIESWEAR')
  df$DepartmentDescription<- str_replace_all(df$DepartmentDescription,'BRAS_&SHAPEWEAR' ,'LADIESWEAR')
  df$DepartmentDescription<- str_replace_all(df$DepartmentDescription,'GIRLS_WEAR_4_6X_AND_7_14' ,'KIDSWEAR')
  df$DepartmentDescription<- str_replace_all(df$DepartmentDescription,'BOYS_WEAR' ,'KIDSWEAR')
  return(df)
}

