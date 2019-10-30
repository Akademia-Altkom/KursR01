
#Standardowa funkcja odczytu read.csv ####
system.time(DF1 <- read.csv("./Dane/311_Service_Requests.csv",stringsAsFactors=FALSE))

#Optymalizowany odczyt funkcją read.csv ####
system.time(wiersze<-length(readLines("./Dane/311_Service_Requests.csv"))-1)
classes <- c("numeric",rep("character",40))
system.time(DF2 <- read.csv("./Dane/311_Service_Requests.csv", header = TRUE, sep = ",",  
                            stringsAsFactors = FALSE, nrow = wiersze, 
                            colClasses = classes))

#Odczyt funkcją fread ####
library(data.table)
system.time(DT1 <- fread("./Dane/311_Service_Requests.csv"))

# # wczytaj kilka rekordów pliku wejściowego, zidentyfikuj klasy pliku wejściowego 
# # i przypisz tę klasę kolumny do pliku wejściowego podczas odczytywania 
# # całego zestawu danych 
# bigfile.sample <- read.csv("311_Service_Requests.csv",  
#                            stringsAsFactors=FALSE, header=T, nrows=20)  
# # obliczyć przybliżoną liczbę wierszy zestawu danych na podstawie rozmiaru pliku, 
# # liczby pól w kolumnie (lub używając wc w wierszu poleceń) i zdefiniować parametr nrow 
# #bigfile.colclass <- sapply(bigfile.sample,class)
# classes <- c("numeric",rep("character",40))
# # zdefiniuj parametr comment.char 
# library(tibble)
# bigfile.raw <- tbl_df(read.csv("311_Service_Requests.csv", 
#                                stringsAsFactors=FALSE, header=T,nrow=2078174, 
#                                colClasses=classes, comment.char=""))  
# 
# 
#