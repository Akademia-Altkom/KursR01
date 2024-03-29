
# Tworzenie wektor�w ------------------------------------------------------
1:10                        #utworzenie wektora liczb od 1 do 10
c(1:2,5:7,9)                #z�acznenie wektor�w w jeden
seq(1,6, by=2)              #utworzenie wektora z sekwencji o podanej r�nicy ci�gu arytmetycznego
seq(1,6, length=10)         #sekwencja z zadan� ilo�ci� element�w
rep(c(1,5),3)               #utworzenie wektora z zadan� liczba powt�rze�
rep(c(1,5),3, each=2)       #utworzenie wektora z zadan� liczba powt�rze� ka�dego elementu

# Zamiana typ�w danych ----------------------------------------------------

a<-(1:10)*10
typeof(a)                   #typ zmiennej a
typeof(a/3)                 #konwersja niejawna typ�W
b<-as.character(a)          #konwersja jawna typ�w
typeof(b)                   
dzi�<-Sys.Date()            #deklaracja zmiennej przechowuj�cej dat� dzisiejsz�
print(dzi�)
attributes(dzi�)            #sprawdzenie w�a�ciwo�ci zmiennej dzi�
unclass(dzi�)               #wy�wietlenie rzeczywistej warrto�ci przechowywanej w zmiennej -jest to liczba dni od 1970-01-01

# Pobieranie warto�ci z wektor�w ------------------------------------------

a[1]                        #pierwszy element wektora
a[c(5,2)]                   #pi�ty i drugi element wektora
a[-10]                      #wszystkie elementy za wyj�tkiem dziesi�tego
a[length(a)]                #ostatni element wektora
a[a>40 & a<80]              #wszystkie warto�ci wektora z przedzia�u (40;80)
match(50,a)                 #na kt�rej pozycji wektora znajduje si� warto�� 50
50 %in% a                   #czy warto� 50 znajduje si� w wektorze a
which(a>50)                 #na kt�rych pozycjach w wektorze znajduj� si� elementy >50

# Modyfikowanie warto�ci z wektor�w--------------------------------------------------

a[a>50]<-a[a>50]*100        #zast�pienie warto�ci >50 stuktotn� warto�ci� poprzedni�
print(a)
a[1]<-0                     #wpisanie do pierwszego elementu warto�ci 0
a<-a[-10]                   #usuni�cie 10tego elementu z wektora
print(a)

# Podstawowe operacja na wektorach ----------------------------------------

t(a)                        #operacja transpozycji (na wektorze w edytorze niewielka r�nica)
rev(a)                      #odwr�cenie kolejno�ci
b<-a[c(3,5,8,2,6,1,2)]      #utworzenie wektora b zawieraj�cego wymienione elementy z wektora a
print(b)
sort(b,decreasing = T)      #sortowanie warto�ci wektora w kolejno�ci malej�cej
rank(b)                     #funkcja ranguj�ca na postawie warto�ci element�w wektora
names(b)<-c("poniedzia�ek","wtorek","�roda","czwartek","pi�tek","sobota","niedziela")
b["niedziela"]              #deklaracja nazw i dost�p do danych po nazwie
a*0.1+1                     #przemno�enie ka�dego elementu wektora przez 0.1 i dodanie 1
sum(a)                      #suma wszystkich element�w
min(a)                      #najmniejsza warto�� w wektorze
max(a)                      #najwi�ksza warto�� w wektorze
mean(a)                     #warto�� �rednia
sd(a)                       #odchylenie standardowe w pr�bie
var(a)                      #wariancja w pr�bie
quantile(a,0.25)            #warto�� pierwszego kwartylu na podstawie danych w wektorze
summary(a)                  #podsuwanie warto�ci w wektorze
cumsum(a)                   #suma do dotychczasowej pozycji (kumulacyjnie)
diff(a)                     #r�nica warto�ci mi�dzy s�siednimi indeksami wektora
pmin(c(2,30,100),c(3,28,99))#warto�� minimalna (w wierszu) na tej samej pozycji w dw�ch wektorach
d<-sample(a,9,replace = T)  #pr�bkowanie wektora ze zwracaniem
cor(a,d)                    #wsp�czynnik korelacji
cov(a,d)                    #kowariancja

# �wiczenia ---------------------------------------------------------------

rm(list=ls())
# Zadeklaruj po jednej zmiennej dla ka�dego typu
x<-1:1
y<-"szkolenie R"
z<-pi
a<-10>8
# Jedn� z zadeklarowanych zmiennych zamie� po kolej na ka�dy mo�liwy typ struktury danych
as.matrix(x)
as.list(x)
as.table(x)
as.factor(x)
as.data.frame(x)
# Za pomoc� funkcji runif() utw�rz wektor 365 ca�kowitych warto�ci losowych z przedzia�u -20..35
dane<-as.integer(runif(365,-20,35))
# Wy�wietl podstawowe funkcje statystyczne dla danych
summary(dane)
sd(dane)
sum(dane>20)
# Dodaj nazwy wierszy wynikaj�ce z kolejnych dat
names(dane)<-0:364+as.Date("2019-01-01")
# Usu� weekendy
dane<-dane[-which(weekdays(as.Date(names(dane)))  %in% c("sobota","niedziela"))]
# Do nowego wektora prze�lij dane, o warto�ciach pomi�dzy 15 a 25
nowe_dane<-dane[dane>15 & dane<25]
# Wy�wietl dla jakich dat zanotowano takie warto�ci
names(nowe_dane)

