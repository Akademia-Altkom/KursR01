
# Tworzenie faktor�w ------------------------------------------------------
                                      #Wygenerowanie wektora z losowymi powt�rzeniami 
x<-rep(c("Tata","Mama","Dziadek","Babcia"),#cz�onk�w rodziny
       trunc(runif(1,1,10)),each=trunc(runif(1,1,10)))
rodzina<-factor(x)                    #Utworzenie faktora ze zwyk�ego wektora
liczby<-as.factor(c(1:10,5:10))       #Utworzenie przez konwersj�
rodzina_waga<-ordered(x,              #Faktor w skali porz�dkowej
                      levels=c("Tata","Mama","Dziadek","Babcia"))
p<-runif(length(rodzina),2000,7000)               #Wektor pomocniczy z wylosowanymi pensjami
pensje<-factor(p)                     #Utworzenie faktora z wylosowanych liczb
pensje<-cut(p,c(0,3000,5000,8000))    #Faktor z przedzia�ami liczb

# Pobieranie informacji ---------------------------------------------------

length(rodzina)                       #Ilo�� element�w w faktorze
class(rodzina)                        #Klasa
typeof(rodzina)                       #Ka�dy faktor to na poziomie atomowym liczba naturalna
rodzina[1:10]                         #10 pierwszych element�w faktora
levels(rodzina)                       #Spis kategorii w faktorze
table(rodzina)                        #Ilo�� element�w ka�dej kategorii
prop.table(table(rodzina))            #Procentowa tablica proporcjonalno�ci
table(pensje)                         #Ilo�� element�w w faktorze pensja

# Modyfikowanie faktor�w --------------------------------------------------

levels(rodzina)[5]<-"Prababcia"       #Dodanie kolejnej kategorii
rodzina[10]<-"Prababcia"              #Modyfikacja 10tego elementu (nie zadzia�a bez utworzenia nowej kategorii)
rodzina[1:10]                         #10 pierwszych element�w faktora
levels(rodzina)[5]<-"Pradziadek"      #Modyfikacja kategorii
unique(rodzina)                       #Unikatowe warto�ci w faktorze
as.numeric(rodzina)                   #Wy�wietlenie danych jako warto�ci ca�kowitych
levels(pensje)<-c("Ma�o","�rednio","Du�o")#Modyfikacja kategorii
table(pensje)                         #Ilo�� element�w w ka�dej kategorii

# Operacje na faktorach ---------------------------------------------------

tapply(p,rodzina,mean)                #�rednia pensja z podzia�em na grupy
table(rodzina,pensje)                 #Tablica kontyngencji
prop.table(table(rodzina,pensje))     #Procent ca�o�ci
prop.table(table(rodzina,pensje),1)   #Procent wiersza
prop.table(table(rodzina,pensje),2)   #Procent kolumny

# �wiczenia ---------------------------------------------------------------
rm(list=ls())
# Utw�rz faktor stuelementowy z�o�ony z losowych dat z kilku lat
data<-as.Date(runif(100,as.Date("1989-01-01"),as.Date("1998-01-01")),
                  origin = "1970-01-01")
dane<-as.factor(data)
# Utw�rz wektor z losowymi temperaturami
temp<-runif(100,-20,40)
# Pogrupuj daty na pory roku
miesi�c<-as.numeric(format.Date(data,"%m"))
pora<-NULL
pora[miesi�c %in% c(1,2,12)]<-"zima"
pora[miesi�c>=3 & miesi�c<=5]<-"wiosna"
pora[miesi�c>=6 & miesi�c<=8]<-"lato"
pora[miesi�c>=9 & miesi�c<=11]<-"jesie�"
dane<-as.factor(pora)
dane<-ordered(dane,c("zima","wiosna","lato","jesie�"))
# Oblicz �rednie temperatury w ka�dej porze roku
tapply(temp,dane,mean)
# Oblicz liczebno�� (tak�e procentow�) w ka�dej grupie
table(dane)
prop.table(table(dane))
