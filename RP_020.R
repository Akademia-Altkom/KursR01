# Podstawowe dzia�ania matematyczne ----------------------------------------

r<-10       
2*pi*r
pi*r^2
10/3                        #dzielenie rzeczywiste
10%/%3                      #dzielenie ca�kowitoliczbowe
10%%3                       #reszta z dzielenia
abs(-10)                    #warto�� bezwzgl�dna
sqrt(10)                    #pierwiastek kwadratowy
10^0.5
sin(pi)                     #funkcje trygonometryczne
cos(pi)
acos(-1)
exp(1)                      #liczba e^1
log10(10^2)
log(exp(1))
ceiling(1234.56789)         #zaokr�glenie w g�r�
floor(1234.56789)           #zaokr�glenie w d�
round(1234.56789,2)         #zaokr�glenie matematyczne do 2 miejsc po przecinku
round(1234.56789,-2)        #zaokr�glenie do cyfry setek
trunc(1234.56789)           #obci�cie cyfr po przecinku
signif(1234.56789,2)        #zaokr�glenie do 2 cyfr znacz�cych

# Funkcje por�wnania ------------------------------------------------------

10>7
1/2==0.5                    # poza tym s� jeszcze <,<=,==,!=,>=,>

# Operatory logiczne ------------------------------------------------------

1 && 1                      #iloczyn logiczny
c(0,0,1,1) & c(0,1,0,1)     #iloczyn logiczny wektorowy
1 || 1                      #suma logiczna
c(0,0,1,1) | c(0,1,0,1)     #suma logiczna wektorowa
!T                          #negacja prawdy
any(as.logical(c(0,1,0,1))) #prawda, je�li conajmniej jedna prawda
all(c(T,F,F,F))             #prawda, je�li wszystko jest prawd�

# Operatory zbior�w -------------------------------------------------------

a<-c(1,2,3,4,5,6)           #przypisanie do zmiennej wektora z liczbami
b<-c(5,6,7,8,9)
union(a,b)                  #po�aczenie zbior�w
intersect(a,b)              #cz�� wsp�lna zbior�w
setdiff(a,b)                #r�nica zbior�w
setdiff(b,a)
setequal(a,b)               #por�wnanie zbior�w

# Dzia�ania matematyczne na wektorze ---------------------------------------

sum(a)                      #suma element�w wektora a
mean(a)                     #�rednia
sd(a)                       #odchylenie standardowe
median(a)                   #mediana
summary(a)                  #statystyki wektora a

# Operacje na typie tekstowym ---------------------------------------------

print(month.name)           #nazwy miesi�cy - sta�a
print(LETTERS)              #wielkie litery - sta�a
paste(1,2,3,sep="---")      #��czenie tekst�w
rok<-rep(2019,12)           #powt�rzenie n krotne
print(rok)
paste(c(rok,rok+1),
      month.name,sep=" ")   #do�aczenie roku do miesi�cy
cat("Liczba pi wynosi",pi)  #po�aczenie i wy�wietlenie
napis<-"Szkolenie podstawowe w R"
strsplit(napis," ")         #podzia� napisu z zadeklarowanym separatorem
data<-as.character(Sys.Date())#bie�aca data jako tekst
strsplit(data,"-")          
nchar(napis)                #ilo�� znak�w w tek�cie
substr(napis,1,2)           #fragment tekstu od pozycji 1 do 2

# Zmienne i typy danych ---------------------------------------------------

typeof(a)                   #typ danych
typeof(napis)
typeof(T)
typeof(as.integer(2))
10/0                        #niesko�czono��
0/0                         #warto�� nieoznaczona
NA                          #brak danych
1+1i                        #warto�� zespolona
sqrt(-1+0i)
is.na(NA)                   #prawda, je�li brak danych
is.infinite(10/0)           #prawda, je�li niesko�czono��
is.nan(0/0)                 #prawda, je�li warto�� nieoznaczona
b<-c(NULL,10,10/0,0/0,NA)
sum(b,na.rm = T)            #suma bez warto�ci nieliczbowych
complete.cases(b)           #prawda, je�li liczba (niesko�czono�� te�)
invisible(a^2)              #obliczenie bez wy�wietlania wyniku
.a<-10                      #utworzenie zmiennej tymczasowej a

# Komendy systemowe -------------------------------------------------------

ls()                        #lista zmiennych (bez tymczowych z .a)
rm(napis)                   #usuni�cie zmiennej napis
ls()      
rm(list=ls())               #usuni�cie wszystkich zmiennych
getwd()                     #bie��cy folder
setwd("c:/")                #zmiana bie��cego folderu
list.files()                #spis wszystkich plik�w w bie�acym folderze
file.info("RP_02.R")        #informacje o podanym pliku
Sys.time()                  #aktualny czas
Sys.Date()                  #aktualna data

# �wiczenia --------------------------------------------------------------
#Policz ile liter ma bie�aca lokalizacja pliku
nchar(getwd())

#Utw�rz wektor z�o�ony z nazw "X1:X10"
paste("X",1:10,sep="")

#Zadeklaruj zmienn� przechowuj�c� bie�acy dzie�
dzie�<-substr(as.character(Sys.Date()),9,10)
dzie�<-strftime(Sys.Date(),"%e")#inna metoda

#Oblicz za ile minut b�dzie przerwa
b<-strsplit(as.character(Sys.time())," ")
c<-as.vector(b)[[1]][2]
minuta<-as.integer(strsplit(c,":")[[1]][1])*60+
  as.integer(strsplit(c,":")[[1]][2])
cat("Przerwa za",21*60-minuta,"minut")
strptime("21:00","%H:%M")-Sys.time() #inna metoda

#Usu� wszystkie zmienne
rm(list=ls())
