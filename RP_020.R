# Podstawowe dzia³ania matematyczne ----------------------------------------

r<-10       
2*pi*r
pi*r^2
10/3                        #dzielenie rzeczywiste
10%/%3                      #dzielenie ca³kowitoliczbowe
10%%3                       #reszta z dzielenia
abs(-10)                    #wartoœæ bezwzglêdna
sqrt(10)                    #pierwiastek kwadratowy
10^0.5
sin(pi)                     #funkcje trygonometryczne
cos(pi)
acos(-1)
exp(1)                      #liczba e^1
log10(10^2)
log(exp(1))
ceiling(1234.56789)         #zaokr¹glenie w górê
floor(1234.56789)           #zaokr¹glenie w dó³
round(1234.56789,2)         #zaokr¹glenie matematyczne do 2 miejsc po przecinku
round(1234.56789,-2)        #zaokr¹glenie do cyfry setek
trunc(1234.56789)           #obciêcie cyfr po przecinku
signif(1234.56789,2)        #zaokr¹glenie do 2 cyfr znacz¹cych

# Funkcje porównania ------------------------------------------------------

10>7
1/2==0.5                    # poza tym s¹ jeszcze <,<=,==,!=,>=,>

# Operatory logiczne ------------------------------------------------------

1 && 1                      #iloczyn logiczny
c(0,0,1,1) & c(0,1,0,1)     #iloczyn logiczny wektorowy
1 || 1                      #suma logiczna
c(0,0,1,1) | c(0,1,0,1)     #suma logiczna wektorowa
!T                          #negacja prawdy
any(as.logical(c(0,1,0,1))) #prawda, jeœli conajmniej jedna prawda
all(c(T,F,F,F))             #prawda, jeœli wszystko jest prawd¹

# Operatory zbiorów -------------------------------------------------------

a<-c(1,2,3,4,5,6)           #przypisanie do zmiennej wektora z liczbami
b<-c(5,6,7,8,9)
union(a,b)                  #po³aczenie zbiorów
intersect(a,b)              #czêœæ wspólna zbiorów
setdiff(a,b)                #ró¿nica zbiorów
setdiff(b,a)
setequal(a,b)               #porównanie zbiorów

# Dzia³ania matematyczne na wektorze ---------------------------------------

sum(a)                      #suma elementów wektora a
mean(a)                     #œrednia
sd(a)                       #odchylenie standardowe
median(a)                   #mediana
summary(a)                  #statystyki wektora a

# Operacje na typie tekstowym ---------------------------------------------

print(month.name)           #nazwy miesiêcy - sta³a
print(LETTERS)              #wielkie litery - sta³a
paste(1,2,3,sep="---")      #³¹czenie tekstów
rok<-rep(2019,12)           #powtórzenie n krotne
print(rok)
paste(c(rok,rok+1),
      month.name,sep=" ")   #do³aczenie roku do miesiêcy
cat("Liczba pi wynosi",pi)  #po³aczenie i wyœwietlenie
napis<-"Szkolenie podstawowe w R"
strsplit(napis," ")         #podzia³ napisu z zadeklarowanym separatorem
data<-as.character(Sys.Date())#bie¿aca data jako tekst
strsplit(data,"-")          
nchar(napis)                #iloœæ znaków w tekœcie
substr(napis,1,2)           #fragment tekstu od pozycji 1 do 2

# Zmienne i typy danych ---------------------------------------------------

typeof(a)                   #typ danych
typeof(napis)
typeof(T)
typeof(as.integer(2))
10/0                        #nieskoñczonoœæ
0/0                         #wartoœæ nieoznaczona
NA                          #brak danych
1+1i                        #wartoœæ zespolona
sqrt(-1+0i)
is.na(NA)                   #prawda, jeœli brak danych
is.infinite(10/0)           #prawda, jeœli nieskoñczonoœæ
is.nan(0/0)                 #prawda, jeœli wartoœæ nieoznaczona
b<-c(NULL,10,10/0,0/0,NA)
sum(b,na.rm = T)            #suma bez wartoœci nieliczbowych
complete.cases(b)           #prawda, jeœli liczba (nieskoñczonoœæ te¿)
invisible(a^2)              #obliczenie bez wyœwietlania wyniku
.a<-10                      #utworzenie zmiennej tymczasowej a

# Komendy systemowe -------------------------------------------------------

ls()                        #lista zmiennych (bez tymczowych z .a)
rm(napis)                   #usuniêcie zmiennej napis
ls()      
rm(list=ls())               #usuniêcie wszystkich zmiennych
getwd()                     #bie¿¹cy folder
setwd("c:/")                #zmiana bie¿¹cego folderu
list.files()                #spis wszystkich plików w bie¿acym folderze
file.info("RP_02.R")        #informacje o podanym pliku
Sys.time()                  #aktualny czas
Sys.Date()                  #aktualna data

# Æwiczenia --------------------------------------------------------------
#Policz ile liter ma bie¿aca lokalizacja pliku
nchar(getwd())

#Utwórz wektor z³o¿ony z nazw "X1:X10"
paste("X",1:10,sep="")

#Zadeklaruj zmienn¹ przechowuj¹c¹ bie¿acy dzieñ
dzieñ<-substr(as.character(Sys.Date()),9,10)
dzieñ<-strftime(Sys.Date(),"%e")#inna metoda

#Oblicz za ile minut bêdzie przerwa
b<-strsplit(as.character(Sys.time())," ")
c<-as.vector(b)[[1]][2]
minuta<-as.integer(strsplit(c,":")[[1]][1])*60+
  as.integer(strsplit(c,":")[[1]][2])
cat("Przerwa za",21*60-minuta,"minut")
strptime("21:00","%H:%M")-Sys.time() #inna metoda

#Usuñ wszystkie zmienne
rm(list=ls())
