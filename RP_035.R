
# Tworzenie ramek ---------------------------------------------------------
                              #Utworzenie ramki z inicjalizacj� - faktory!!!
ramka1<-data.frame(Nazwisko=c("Nowak","Kowalski","Norman"),
                   Wiek=c(40,20,46))
                              #Utworzenie ramki z inicjalizacj� bez faktor�W
ramka2<-data.frame(Nazwisko=c("Nowak","Kowalski","Norman"),
                   Wiek=c(40,20,46),stringsAsFactors = FALSE)
wzrost<-c(150:170)        
ramka3<-as.data.frame(wzrost) #Konwersja wektora na ramk�
colnames(ramka1)              #Nazwy kolumn
rownames(ramka1)              #Nazwy wierszy
ncol(ramka1)                  #Ilo�� kolumn
nrow(ramka1)                  #Ilo�� wierszy
str(dimnames(ramka1))         #Nazwy kolumn i wierszy w ramce
class(ramka1)                 #Klasa struktury
str(ramka1)                   #Opis ramki1 - faktory!!!
str(ramka2)                   #Opis ramki2 bez faktor�w ale w ka�dym z tych przypadk�W wiek to napis

# Modyfikacja ramek -------------------------------------------------------

ramka2<-cbind(ramka2,P�e�=c("K","M","M")) #Dodanie kolumny - zmiennej
ramka2<-rbind(ramka2,c("Norris",60,"M"))  #Dodanie nowego wiersza - obserwacji

# Wybieranie  danych ------------------------------------------------------

ramka2$Nazwisko               #Wszystkie nazwiska
attach(ramka2)                #Pod�aczenie ramki, tak aby system korzysta� z nazw kolumn
Wiek[1]                       #Wiek pierwszej osoby
detach(ramka2)                #Od�aczenie ramki - od teraz trzeba podawa� nazw� ramki
ramka2[1,1]                   #Nazwisko pierwszej osoby
typeof(ramka2$Wiek)           #Typ danych kolumny wiek
length(ramka2)                #Ilo�� kolumn
length(ramka2$Nazwisko)       #Ilo�� wierszy
ramka2[ramka2$P�e�=="M",]     #Filtrowanie danych po zmiennej p�e�
subset(ramka2,P�e�=="K")      #Inny spos�b filtrowania

# Operacja na danych ------------------------------------------------------

ramka2$Wiek<-as.numeric(ramka2$Wiek) #zamiana kolumny wiek na warto�� liczbow�
mean(ramka2$Wiek)             #Obliczenie �redniej wieku
summary(ramka2)               #Podsumowania dla ramki
apply(ramka3,1,median)        #�rednia w wierszach
apply(ramka3,2,median)        #�rednia w kolumnach
aggregate(Wiek ~ P�e�,ramka2,mean)  #�rednia dla ka�dej p�ci

# �wiczenia ---------------------------------------------------------------
rm(list=ls())
# Wczytaj dane do�aczone do pakietu R - woman (wzrost i waga - miara anglosaska)
dane<-women
# Zmie� nazwy kolumn na nazwy polskie
colnames(dane)<-c("wzrost","waga")
# Przelicz wzrost i wag� na miary metryczne (1 cal=2,54 cm i 1 funt=0,4536 kg)
dane$wzrost=dane$wzrost*2.54
dane$waga=dane$waga*0.4536
# Dodaj kolumn� BMI (waga/wzrost[m]^2)
dane<-cbind(dane,BMI=round(dane$waga/(dane$wzrost/100)^2,2))
# Oblicz �redni� w ka�dej kolumnie
apply(dane,2,mean)
# Posortuj dane wzgl�dem BMI
dane1<-dane[order(dane$BMI,decreasing = F),]

