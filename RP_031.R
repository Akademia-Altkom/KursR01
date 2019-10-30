
# Tworzenie wektorów ------------------------------------------------------
1:10                        #utworzenie wektora liczb od 1 do 10
c(1:2,5:7,9)                #z³acznenie wektorów w jeden
seq(1,6, by=2)              #utworzenie wektora z sekwencji o podanej ró¿nicy ci¹gu arytmetycznego
seq(1,6, length=10)         #sekwencja z zadan¹ iloœci¹ elementów
rep(c(1,5),3)               #utworzenie wektora z zadan¹ liczba powtórzeñ
rep(c(1,5),3, each=2)       #utworzenie wektora z zadan¹ liczba powtórzeñ ka¿dego elementu

# Zamiana typów danych ----------------------------------------------------

a<-(1:10)*10
typeof(a)                   #typ zmiennej a
typeof(a/3)                 #konwersja niejawna typóW
b<-as.character(a)          #konwersja jawna typów
typeof(b)                   
dziœ<-Sys.Date()            #deklaracja zmiennej przechowuj¹cej datê dzisiejsz¹
print(dziœ)
attributes(dziœ)            #sprawdzenie w³aœciwoœci zmiennej dziœ
unclass(dziœ)               #wyœwietlenie rzeczywistej warrtoœci przechowywanej w zmiennej -jest to liczba dni od 1970-01-01

# Pobieranie wartoœci z wektorów ------------------------------------------

a[1]                        #pierwszy element wektora
a[c(5,2)]                   #pi¹ty i drugi element wektora
a[-10]                      #wszystkie elementy za wyj¹tkiem dziesi¹tego
a[length(a)]                #ostatni element wektora
a[a>40 & a<80]              #wszystkie wartoœci wektora z przedzia³u (40;80)
match(50,a)                 #na której pozycji wektora znajduje siê wartoœæ 50
50 %in% a                   #czy wartoœ 50 znajduje siê w wektorze a
which(a>50)                 #na których pozycjach w wektorze znajduj¹ siê elementy >50

# Modyfikowanie wartoœci z wektorów--------------------------------------------------

a[a>50]<-a[a>50]*100        #zast¹pienie wartoœci >50 stuktotn¹ wartoœci¹ poprzedni¹
print(a)
a[1]<-0                     #wpisanie do pierwszego elementu wartoœci 0
a<-a[-10]                   #usuniêcie 10tego elementu z wektora
print(a)

# Podstawowe operacja na wektorach ----------------------------------------

t(a)                        #operacja transpozycji (na wektorze w edytorze niewielka ró¿nica)
rev(a)                      #odwrócenie kolejnoœci
b<-a[c(3,5,8,2,6,1,2)]      #utworzenie wektora b zawieraj¹cego wymienione elementy z wektora a
print(b)
sort(b,decreasing = T)      #sortowanie wartoœci wektora w kolejnoœci malej¹cej
rank(b)                     #funkcja ranguj¹ca na postawie wartoœci elementów wektora
names(b)<-c("poniedzia³ek","wtorek","œroda","czwartek","pi¹tek","sobota","niedziela")
b["niedziela"]              #deklaracja nazw i dostêp do danych po nazwie
a*0.1+1                     #przemno¿enie ka¿dego elementu wektora przez 0.1 i dodanie 1
sum(a)                      #suma wszystkich elementów
min(a)                      #najmniejsza wartoœæ w wektorze
max(a)                      #najwiêksza wartoœæ w wektorze
mean(a)                     #wartoœæ œrednia
sd(a)                       #odchylenie standardowe w próbie
var(a)                      #wariancja w próbie
quantile(a,0.25)            #wartoœæ pierwszego kwartylu na podstawie danych w wektorze
summary(a)                  #podsuwanie wartoœci w wektorze
cumsum(a)                   #suma do dotychczasowej pozycji (kumulacyjnie)
diff(a)                     #ró¿nica wartoœci miêdzy s¹siednimi indeksami wektora
pmin(c(2,30,100),c(3,28,99))#wartoœæ minimalna (w wierszu) na tej samej pozycji w dwóch wektorach
d<-sample(a,9,replace = T)  #próbkowanie wektora ze zwracaniem
cor(a,d)                    #wspó³czynnik korelacji
cov(a,d)                    #kowariancja

# Æwiczenia ---------------------------------------------------------------

rm(list=ls())
# Zadeklaruj po jednej zmiennej dla ka¿dego typu
x<-1:1
y<-"szkolenie R"
z<-pi
a<-10>8
# Jedn¹ z zadeklarowanych zmiennych zamieñ po kolej na ka¿dy mo¿liwy typ struktury danych
as.matrix(x)
as.list(x)
as.table(x)
as.factor(x)
as.data.frame(x)
# Za pomoc¹ funkcji runif() utwórz wektor 365 ca³kowitych wartoœci losowych z przedzia³u -20..35
dane<-as.integer(runif(365,-20,35))
# Wyœwietl podstawowe funkcje statystyczne dla danych
summary(dane)
sd(dane)
sum(dane>20)
# Dodaj nazwy wierszy wynikaj¹ce z kolejnych dat
names(dane)<-0:364+as.Date("2019-01-01")
# Usuñ weekendy
dane<-dane[-which(weekdays(as.Date(names(dane)))  %in% c("sobota","niedziela"))]
# Do nowego wektora przeœlij dane, o wartoœciach pomiêdzy 15 a 25
nowe_dane<-dane[dane>15 & dane<25]
# Wyœwietl dla jakich dat zanotowano takie wartoœci
names(nowe_dane)

