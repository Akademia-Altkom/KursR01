
# Deklaracja list ---------------------------------------------------------

mL1<-list()                             #Deklaracja pustej listy
mL2<-list(1:10,month.name,LETTERS[1:10])#Lista z³o¿ona z 3 wektorów (liczby,miesi¹ce,litery)
x<-Sys.Date()                           #Deklaracja wektora jednoelementowego z dat¹
mL3<-as.list(x)                         #Konwersja wektora na listê
.x=month.name[1:6]                      #Wektor pomocniczy szeœcioelementowy z nazwami miesiêcy
.y=runif(6,0,25)                        #Wektor pomocniczy z losowymi wartoœciami z przedzia³u (0,25)
mL4<-list(miesi¹ce=.x,temperatura=.y)     #Uworzenie listy z nazwami wektorów sk³adowych
print(mL4)                              #Wyœwietlenie wszystkich elementów listy
str(mL4)                                #Wyœwietlenie listy w wersji kompaktowej
length(mL4)                             #Iloœæ wektorów sk³adowych listy
length(mL4[[1]])                        #D³ugoœæ pierwszego wektora listy

# Pobieranie danych -------------------------------------------------------

typeof(mL4[[1]])                        #Typ pierwszego wektora w liœcie
typeof(mL4$temperatura)                 #Typ wektora o nazwie temperatura - sk³adnika listy
mL4[[1]]                                #Dostêp do ca³ego pierwszego wektora listy
mL4$miesi¹ce                            #Dostêp poprzez nazwê wektora
mL4[[1]][1]                             #Dostêp do pierwszego miesi¹ca na liœcie
mL4$temperatura[1]                      #Dostêp poprzez nazwê wektora do jego pierwszego elementu
c(mL4[[1]][1],mL4[[2]][1])              #Wyœwietlenie pierwszego miesiaca i odpowiedniej temperatury
                                        #Operator blokowy upraszczaj¹cy dostêp do nazw w liœcie
with(mL4,paste(round(temperatura+273,0),"stopni Kelvina"))

# Modyfikacja struktury listy ---------------------------------------------
                                        #Dodanie nowego wektora do listy
mL4[[3]]<-c("pada","wieje","s³oñce","œnieg","pada","s³oñce")
mL4<-c(mL4,list(c(T,F,T,T,F,T)))        #Inny sposób dodawania kolejnego wektora do listy
mL4<-mL4[-4]                            #Usuniecie czwartego wektora na liœcie
names(mL4)[3]<-"pogoda"                 #Nazwanie trzeciego wektora na liœcie
names(mL4)                              #Wyœwietlenie wszystkich nazw wektorów
attach(mL4)                             #Pod³¹czenie do listy - skrócenie dostêpu do nazw wewn¹trz listy
pogoda<-pogoda[-6]                      #Uwaga!! - utworzenie nowego wektora z danymi poza list¹
                                        #w systemie od teraz s¹ dwie nazwy pogoda
pogoda                                  #utworzony wektor pogoda zas³ania nazwê na liœcie
detach(mL4)                             #Od³aczenie listy - wy³aczenie skróconego dostepu po nazwach wektorów listy                

# Operacje na elementach listy ---------------------------------------------

lapply(mL4,`[[`,1)                      #Wyœwietlenie ka¿dego pierwszego elementu sk³adowych wektorów listy
str(lapply(mL4, function(x) x[1]))      #Inny sposób
summary(mL4$temperatura)                #Podsumowanie po wektorze temperatura


# Æwiczenia ---------------------------------------------------------------
rm(list=ls())
# Utwórz listê opisuj¹c¹ osoby (Nazwisko,Miasto, Sta¿, Data_ur, Pensja)
dane<-list(Nazwisko=NULL,Miasto=NULL,Sta¿=NULL,Data_ur=NULL,Pensja=NULL)
# Uzupe³nij dane do 5 osób
.Nazwisko<-c("Nowak","Rudzki","Lewandowski","Boniek","Karaban")
.Miasto<-c("Poznañ","Warszawa","Wroc³aw","Poznañ","Wroc³aw")
.Sta¿<-c(1:5)
.Data_ur<-as.Date(runif(5,as.Date("1989-01-01"),as.Date("1998-01-01")),
                      origin = "1970-01-01")
.Pensja<-runif(5,3000,7000)
dane$Nazwisko<-.Nazwisko
dane$Miasto<-.Miasto
dane$Sta¿<-.Sta¿
dane$Data_ur<-.Data_ur
dane$Pensja<-.Pensja
# Wypisz dane dla osoby z jednego miasta
attach(dane)
lapply(dane, function(x) x[which(Miasto=="Poznañ")])
# Policz œredni¹ pensjê
mean(Pensja)
# Dodaj wektor z wiekiem poszczególnych osób
dane[[6]]<-as.numeric(format.Date(Sys.Date(),"%Y"))-
  as.numeric(format.Date(Data_ur,"%Y"))
names(dane)[6]<-"Wiek"
# Usuñ dane osoby najstarszej
.naj=which(dane$Wiek==max(dane$Wiek))
dane$Nazwisko<-dane$Nazwisko[-.naj]
dane$Pensja<-dane$Pensja[-.naj]
daneMiasto<-dane$Miasto[-.naj]
dane$Sta¿<-dane$Sta¿[-.naj]
dane$Wiek<-dane$Wiek[-.naj]
dane$Data_ur<-dane$Data_ur[-.naj]
#Usuñ wektor Data_ur
dane<-dane[-4]
