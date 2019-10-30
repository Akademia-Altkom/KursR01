
# Tworzenie ramek ---------------------------------------------------------
                              #Utworzenie ramki z inicjalizacj¹ - faktory!!!
ramka1<-data.frame(Nazwisko=c("Nowak","Kowalski","Norman"),
                   Wiek=c(40,20,46))
                              #Utworzenie ramki z inicjalizacj¹ bez faktoróW
ramka2<-data.frame(Nazwisko=c("Nowak","Kowalski","Norman"),
                   Wiek=c(40,20,46),stringsAsFactors = FALSE)
wzrost<-c(150:170)        
ramka3<-as.data.frame(wzrost) #Konwersja wektora na ramkê
colnames(ramka1)              #Nazwy kolumn
rownames(ramka1)              #Nazwy wierszy
ncol(ramka1)                  #Iloœæ kolumn
nrow(ramka1)                  #Iloœæ wierszy
str(dimnames(ramka1))         #Nazwy kolumn i wierszy w ramce
class(ramka1)                 #Klasa struktury
str(ramka1)                   #Opis ramki1 - faktory!!!
str(ramka2)                   #Opis ramki2 bez faktorów ale w ka¿dym z tych przypadkóW wiek to napis

# Modyfikacja ramek -------------------------------------------------------

ramka2<-cbind(ramka2,P³eæ=c("K","M","M")) #Dodanie kolumny - zmiennej
ramka2<-rbind(ramka2,c("Norris",60,"M"))  #Dodanie nowego wiersza - obserwacji

# Wybieranie  danych ------------------------------------------------------

ramka2$Nazwisko               #Wszystkie nazwiska
attach(ramka2)                #Pod³aczenie ramki, tak aby system korzysta³ z nazw kolumn
Wiek[1]                       #Wiek pierwszej osoby
detach(ramka2)                #Od³aczenie ramki - od teraz trzeba podawaæ nazwê ramki
ramka2[1,1]                   #Nazwisko pierwszej osoby
typeof(ramka2$Wiek)           #Typ danych kolumny wiek
length(ramka2)                #Iloœæ kolumn
length(ramka2$Nazwisko)       #Iloœæ wierszy
ramka2[ramka2$P³eæ=="M",]     #Filtrowanie danych po zmiennej p³eæ
subset(ramka2,P³eæ=="K")      #Inny sposób filtrowania

# Operacja na danych ------------------------------------------------------

ramka2$Wiek<-as.numeric(ramka2$Wiek) #zamiana kolumny wiek na wartoœæ liczbow¹
mean(ramka2$Wiek)             #Obliczenie œredniej wieku
summary(ramka2)               #Podsumowania dla ramki
apply(ramka3,1,median)        #Œrednia w wierszach
apply(ramka3,2,median)        #Œrednia w kolumnach
aggregate(Wiek ~ P³eæ,ramka2,mean)  #Œrednia dla ka¿dej p³ci

# Æwiczenia ---------------------------------------------------------------
rm(list=ls())
# Wczytaj dane do³aczone do pakietu R - woman (wzrost i waga - miara anglosaska)
dane<-women
# Zmieñ nazwy kolumn na nazwy polskie
colnames(dane)<-c("wzrost","waga")
# Przelicz wzrost i wagê na miary metryczne (1 cal=2,51 cm i 1 funt=0,4536 kg)
dane$wzrost=dane$wzrost*2.51
dane$waga=dane$waga*0.4536
# Dodaj kolumnê BMI (waga/wzrost[m]^2)
dane<-cbind(dane,BMI=round(dane$waga/(dane$wzrost/100)^2,2))
# Oblicz œredni¹ w ka¿dej kolumnie
apply(dane,2,mean)
# Posortuj dane wzglêdem BMI
dane1<-dane[order(dane$BMI,decreasing = F),]

