
# Praca z folderami i plikami ---------------------------------------------

getwd()                           #Bie¿¹ca lokalizacja
dir("C:/",pattern = ".log")       #Spis plików o rozszerzeniu .log
list.dirs("C:/",recursive = F)    #Spis plików kolejna komenda
dir.create("./Nowy")              #Utworzenie nowego folderu
setwd("./Nowy")                   #Przejœcie do nowego podkatalogu
dir.exists("../Nowy")             #Sprawdzenie czy jest folder
dir("..",".csv")                  #Spis plików csv w folderze nadrzêdnym
file.create("ABC")                #Utworzenie pliku ABC
file.rename("ABC","CDE")          #Zmiana nazwy pliku z ABC na CDE
file.remove("CDE")                #Skasowanie pliku
file.exists("CDE")                #Sprawdzenie czy istnieje plik CDE
setwd("../")                      #Przejœcie do folderu nadrzêdnego
unlink("./Nowy",recursive = T)    #Skasowanie folderu Nowy

# Odczyt plików tekstowych ------------------------------------------------

titanic<-read.csv("./Dane/01 - Titanic.csv",stringsAsFactors = F)
sprzedaz<-read.delim("./Dane/02 - Szereg sprzeda¿.txt",header = T)
sprzedaz$Date<-as.Date(sprzedaz$Date) #Zamiana napisu na datê
filmy<-read.table("./Dane/03 - Dochodowe filmy.csv",header = T,
                     stringsAsFactors = F,sep = ",")

# Zapis plików tekstowych -------------------------------------------------

write.csv(filmy$Film,"./Dane/temp.csv",quote = F)
write.table(sprzedaz,"./Dane/temp.txt",quote = F,row.names = F)

# Zapis i odczyt plików binarnych -----------------------------------------

saveRDS(titanic,"./Dane/temp.rds")
head(readRDS("./Dane/temp.rds"))

# Odczyt i zapis do Excela ------------------------------------------------

library(xlsx)                     #Deklaracja biblioteki xlsx
warszawa<-read.xlsx("./Dane/04_Import/Warszawa.xlsx",1,
                    encoding="UTF-8")
write.xlsx(warszawa$Zamawiaj¹cy,"../Dane/04_Import/temp.xlsx",
           sheetName="osoby",row.names=F)
library(readxl)                   #Szybsza biblioteka do odczytu
poznan<-read_excel("./Dane/04_Import/Poznañ.xlsx",1)
library(writexl)                  #Szybsza bibliotek do zapisu
write_xlsx(poznan,"./Dane/Miasta/dane.xlsx",format_headers = T)

# Æwiczenia ---------------------------------------------------------------
rm(list=ls())
# Otwórz wszystkie pliki z folderu 04_Import
warszawa<-read.xlsx("./Dane/04_Import/Warszawa.xlsx",1,
                    encoding="UTF-8")
gdansk<-read.xlsx("./Dane/04_Import/Gdañsk.xlsx",1,
                    encoding="UTF-8")
katowice<-read.xlsx("./Dane/04_Import/Katowice.xlsx",1,
                    encoding="UTF-8")
library(readxl)
poznan<-read_excel("./Dane/04_Import/Poznañ.xlsx",1)
wroclaw<-read.xlsx("./Dane/04_Import/Wroc³aw.xlsx",1,
                    encoding="UTF-8")
# Po³¹cz dane w jedn¹ ramkê
dane<-rbind(gdansk,katowice,poznan,warszawa,wroclaw)
# Utwórz nowy podkatalog
dir.create("./Dane/Miasta")
# Zapisz dane jako plik csv i xlsx w nowym podkatalogu
write.csv(dane,"./Dane/Miasta/dane.csv",row.names = F, quote = F)
write.xlsx(dane,"./Dane/Miasta/dane.xlsx",row.names = F)
library(writexl)
write_xlsx(dane,"./Dane/Miasta/dane.xlsx",format_headers = T)
