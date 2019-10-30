
# Tworzenie faktorów ------------------------------------------------------
                                      #Wygenerowanie wektora z losowymi powtórzeniami 
x<-rep(c("Tata","Mama","Dziadek","Babcia"),#cz³onków rodziny
       trunc(runif(1,1,10)),each=trunc(runif(1,1,10)))
rodzina<-factor(x)                    #Utworzenie faktora ze zwyk³ego wektora
liczby<-as.factor(c(1:10,5:10))       #Utworzenie przez konwersjê
rodzina_waga<-ordered(x,              #Faktor w skali porz¹dkowej
                      levels=c("Tata","Mama","Dziadek","Babcia"))
p<-runif(length(rodzina),2000,7000)               #Wektor pomocniczy z wylosowanymi pensjami
pensje<-factor(p)                     #Utworzenie faktora z wylosowanych liczb
pensje<-cut(p,c(0,3000,5000,8000))    #Faktor z przedzia³ami liczb

# Pobieranie informacji ---------------------------------------------------

length(rodzina)                       #Iloœæ elementów w faktorze
class(rodzina)                        #Klasa
typeof(rodzina)                       #Ka¿dy faktor to na poziomie atomowym liczba naturalna
rodzina[1:10]                         #10 pierwszych elementów faktora
levels(rodzina)                       #Spis kategorii w faktorze
table(rodzina)                        #Iloœæ elementów ka¿dej kategorii
prop.table(table(rodzina))            #Procentowa tablica proporcjonalnoœci
table(pensje)                         #Iloœæ elementów w faktorze pensja

# Modyfikowanie faktorów --------------------------------------------------

levels(rodzina)[5]<-"Prababcia"       #Dodanie kolejnej kategorii
rodzina[10]<-"Prababcia"              #Modyfikacja 10tego elementu (nie zadzia³a bez utworzenia nowej kategorii)
rodzina[1:10]                         #10 pierwszych elementów faktora
levels(rodzina)[5]<-"Pradziadek"      #Modyfikacja kategorii
unique(rodzina)                       #Unikatowe wartoœci w faktorze
as.numeric(rodzina)                   #Wyœwietlenie danych jako wartoœci ca³kowitych
levels(pensje)<-c("Ma³o","Œrednio","Du¿o")#Modyfikacja kategorii
table(pensje)                         #Iloœæ elementów w ka¿dej kategorii

# Operacje na faktorach ---------------------------------------------------

tapply(p,rodzina,mean)                #Œrednia pensja z podzia³em na grupy
table(rodzina,pensje)                 #Tablica kontyngencji
prop.table(table(rodzina,pensje))     #Procent ca³oœci
prop.table(table(rodzina,pensje),1)   #Procent wiersza
prop.table(table(rodzina,pensje),2)   #Procent kolumny

# Æwiczenia ---------------------------------------------------------------
rm(list=ls())
# Utwórz faktor stuelementowy z³o¿ony z losowych dat z kilku lat
data<-as.Date(runif(100,as.Date("1989-01-01"),as.Date("1998-01-01")),
                  origin = "1970-01-01")
dane<-as.factor(data)
# Utwórz wektor z losowymi temperaturami
temp<-runif(100,-20,40)
# Pogrupuj daty na pory roku
miesi¹c<-as.numeric(format.Date(data,"%m"))
pora<-NULL
pora[miesi¹c %in% c(1,2,12)]<-"zima"
pora[miesi¹c>=3 & miesi¹c<=5]<-"wiosna"
pora[miesi¹c>=6 & miesi¹c<=8]<-"lato"
pora[miesi¹c>=9 & miesi¹c<=11]<-"jesieñ"
dane<-as.factor(pora)
dane<-ordered(dane,c("zima","wiosna","lato","jesieñ"))
# Oblicz œrednie temperatury w ka¿dej porze roku
tapply(temp,dane,mean)
# Oblicz liczebnoœæ (tak¿e procentow¹) w ka¿dej grupie
table(dane)
prop.table(table(dane))
