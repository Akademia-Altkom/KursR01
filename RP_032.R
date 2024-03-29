
# Tworzenie macierzy i tablic ---------------------------------------------

X<-1:6                          #deklaracja wektora
dim(X)<-c(2,3)                  #zamiana wektora na macierz
Y<-rbind(c(100,200),c(300,400)) #utworzenie macierzy przez po�aczenie kolejnych wierszy
Z<-cbind(c("A","C"),c("B","D")) #utworzenie macierzy przez po�aczenie kolejnych kolumn
A<-matrix(LETTERS[1:12],3,4)    #utworzenie macierzy z kolejnymi wielkimi literami
B<-array(month.name,c(2,2,3))   #utworzenie tabicy tr�jwymiarowej

# Nadawanie nazw wymiarom -------------------------------------------------

colnames(A)<-paste("kolumna",1:4)#Przypisanie nazw kolumn
rownames(A)<-paste("wiersz",1:3)#Przypisanie nazw wierszy
dimnames(X)<-list(c("W1","W2"),c("K1","K2","K3"))#Nazwy wierszy i kolumn

# Adresowanie macierzy ----------------------------------------------------

X[1,1]                          #Warto�� macierzy w pierwszym wierszu i kolumnie
X[1,]                           #Pierwszy wiersz
X[,2]                           #Druga kolumna
X[,-3]                          #Wszystkie elementy macierzy opr�cz trzeciej kolumny
X[,"K2"]                        #Elementy macierzy z kolumny K2
X[6]                            #Sz�sty element wektora, na kt�rym opiera si� macierz
Y[1,]                           #Pierwszy wiersz macierzy Y
class(Y[1,])                    #Typ wyniku
Y[1,,drop=F]                    #Pierwszy wiersz macierzy Y bez niejawnej konwersji typ�w
class(Y[1,,drop=F])             #Typ wyniku
ncol(X)                         #Liczba kolumn
nrow(X)                         #Liczba wierszy

# Operacje na macierzach --------------------------------------------------

t(X)                            #Transpozycja macierzy
aperm(X)                        #Transpozycja tablicy z optymalizacj� zmiany wymiar�w
diag(X)                         #Przek�tna macierzy
X %*% t(X)                      #Iloczyn macierzowy
outer(1:10,1:10,FUN = "*")      #Operacja na elementach macierzy "ka�dy z ka�dym"
sum(X)                          #Suma wszystkich element�w macierzy
summary(X)                      #Podsumowanie danych, domy�lnie po kolumnach
summary(t(X))                   #Podsumowanie po wierszach

# Wektoryzacja operacji ---------------------------------------------------

apply(X, 1,sum)                 #Zastosowanie funkcji sumy dla ka�dego wiersza
apply(X, 2,sd)                  #Zastosowanie odch. std. dla kolumn
apply(X, 1,median)              #Mediana dla wierszy

# �wiczenia ---------------------------------------------------------------

rm(list=ls())
# Utw�rz losow� macierz z ocenami dla 4 os�b (20 wierszy)
oceny<-round(runif(4*20,1,6),0)
dim(oceny)<-c(20,4)
# Nadaj nazwy kolumnom podaj�c wymy�lone imiona
colnames(oceny)<-c("Jan","Maria","Stefan","Ola")
# Policz �redni�, median� i r�nic� mi�dzy trzecim i pierwszym kwartylem
statystyki<-apply(oceny,2,mean)
statystyki<-rbind(statystyki,apply(oceny,2,median))
Q1<-apply(oceny,2, function(x) quantile(x,0.25))
Q3<-apply(oceny,2, function(x) quantile(x,0.75))
statystyki<-rbind(statystyki,Q3-Q1)
print(statystyki)
rownames(statystyki)<-c("�rednia","Mediana","IQR")
# Skopiuj dane dla najlepszego ucznia do wektora o nazwie z jego imieniem
gdzie<-match(max(statystyki["�rednia",]),statystyki)
Best<-colnames(statystyki)[((gdzie-1) %/% nrow(statystyki))+1]
do.call("<-",list(Best,oceny[,Best]))
cat(Best,eval(parse(text=Best)))

