#!/bin/bash
# baja datos walmart desde kaggle
wget -O ./sample_submission.zip "https://www.kaggle.com/c/walmart-recruiting-trip-type-classification/download/DXw5lsnzoDOErHI9ex0b%2Fversions%2FCsdBkuvDBmi8KMBgDEFT%2Ffiles%2Ftest.csv.zip"
wget -O ./test.zip "https://www.kaggle.com/c/walmart-recruiting-trip-type-classification/download/DXw5lsnzoDOErHI9ex0b%2Fversions%2FCsdBkuvDBmi8KMBgDEFT%2Ffiles%2Ftest.csv.zip"
wget -O ./train.zip "https://www.kaggle.com/c/walmart-recruiting-trip-type-classification/download/DXw5lsnzoDOErHI9ex0b%2Fversions%2FCsdBkuvDBmi8KMBgDEFT%2Ffiles%2Ftrain.csv.zip"
#Descomprime los datos descargados
for i in $(ls *.zip); do unzip $i; done
rm *.zip