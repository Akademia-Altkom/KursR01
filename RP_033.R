
# Deklaracja list ---------------------------------------------------------

mL1<-list()                             #Deklaracja pustej listy
mL2<-list(1:10,month.name,LETTERS[1:10])#Lista z�o�ona z 3 wektor�w (liczby,miesi�ce,litery)
x<-Sys.Date()                           #Deklaracja wektora jednoelementowego z dat�
mL3<-as.list(x)                         #Konwersja wektora na list�
.x=month.name[1:6]                      #Wektor pomocniczy sze�cioelementowy z nazwami miesi�cy
.y=runif(6,0,25)                        #Wektor pomocniczy z losowymi warto�ciami z przedzia�u (0,25)
mL4<-list(miesi�ce=.x,temperatura=.y)     #Uworzenie listy z nazwami wektor�w sk�adowych
print(mL4)                              #Wy�wietlenie wszystkich element�w listy
str(mL4)                                #Wy�wietlenie listy w wersji kompaktowej
length(mL4)                             #Ilo�� wektor�w sk�adowych listy
length(mL4[[1]])                        #D�ugo�� pierwszego wektora listy

# Pobieranie danych -------------------------------------------------------

typeof(mL4[[1]])                        #Typ pierwszego wektora w li�cie
typeof(mL4$temperatura)                 #Typ wektora o nazwie temperatura - sk�adnika listy
mL4[[1]]                                #Dost�p do ca�ego pierwszego wektora listy
mL4$miesi�ce                            #Dost�p poprzez nazw� wektora
mL4[[1]][1]                             #Dost�p do pierwszego miesi�ca na li�cie
mL4$temperatura[1]                      #Dost�p poprzez nazw� wektora do jego pierwszego elementu
c(mL4[[1]][1],mL4[[2]][1])              #Wy�wietlenie pierwszego miesiaca i odpowiedniej temperatury
                                        #Operator blokowy upraszczaj�cy dost�p do nazw w li�cie
with(mL4,paste(round(temperatura+273,0),"stopni Kelvina"))

# Modyfikacja struktury listy ---------------------------------------------
                                        #Dodanie nowego wektora do listy
mL4[[3]]<-c("pada","wieje","s�o�ce","�nieg","pada","s�o�ce")
mL4<-c(mL4,list(c(T,F,T,T,F,T)))        #Inny spos�b dodawania kolejnego wektora do listy
mL4<-mL4[-4]                            #Usuniecie czwartego wektora na li�cie
names(mL4)[3]<-"pogoda"                 #Nazwanie trzeciego wektora na li�cie
names(mL4)                              #Wy�wietlenie wszystkich nazw wektor�w
attach(mL4)                             #Pod��czenie do listy - skr�cenie dost�pu do nazw wewn�trz listy
pogoda<-pogoda[-6]                      #Uwaga!! - utworzenie nowego wektora z danymi poza list�
                                        #w systemie od teraz s� dwie nazwy pogoda
pogoda                                  #utworzony wektor pogoda zas�ania nazw� na li�cie
detach(mL4)                             #Od�aczenie listy - wy�aczenie skr�conego dostepu po nazwach wektor�w listy                

# Operacje na elementach listy ---------------------------------------------

lapply(mL4,`[[`,1)                      #Wy�wietlenie ka�dego pierwszego elementu sk�adowych wektor�w listy
str(lapply(mL4, function(x) x[1]))      #Inny spos�b
summary(mL4$temperatura)                #Podsumowanie po wektorze temperatura


# �wiczenia ---------------------------------------------------------------
rm(list=ls())
# Utw�rz list� opisuj�c� osoby (Nazwisko,Miasto, Sta�, Data_ur, Pensja)
dane<-list(Nazwisko=NULL,Miasto=NULL,Sta�=NULL,Data_ur=NULL,Pensja=NULL)
# Uzupe�nij dane do 5 os�b
.Nazwisko<-c("Nowak","Rudzki","Lewandowski","Boniek","Karaban")
.Miasto<-c("Pozna�","Warszawa","Wroc�aw","Pozna�","Wroc�aw")
.Sta�<-c(1:5)
.Data_ur<-as.Date(runif(5,as.Date("1989-01-01"),as.Date("1998-01-01")),
                      origin = "1970-01-01")
.Pensja<-runif(5,3000,7000)
dane$Nazwisko<-.Nazwisko
dane$Miasto<-.Miasto
dane$Sta�<-.Sta�
dane$Data_ur<-.Data_ur
dane$Pensja<-.Pensja
# Wypisz dane dla osoby z jednego miasta
attach(dane)
lapply(dane, function(x) x[which(Miasto=="Pozna�")])
# Policz �redni� pensj�
mean(Pensja)
# Dodaj wektor z wiekiem poszczeg�lnych os�b
dane[[6]]<-as.numeric(format.Date(Sys.Date(),"%Y"))-
  as.numeric(format.Date(Data_ur,"%Y"))
names(dane)[6]<-"Wiek"
# Usu� dane osoby najstarszej
.naj=which(dane$Wiek==max(dane$Wiek))
dane$Nazwisko<-dane$Nazwisko[-.naj]
dane$Pensja<-dane$Pensja[-.naj]
daneMiasto<-dane$Miasto[-.naj]
dane$Sta�<-dane$Sta�[-.naj]
dane$Wiek<-dane$Wiek[-.naj]
dane$Data_ur<-dane$Data_ur[-.naj]
#Usu� wektor Data_ur
dane<-dane[-4]
