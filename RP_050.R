
# Instrukcje warunkowe ----------------------------------------------------
# Zastosowanie instrukcji if w pe�nej sk��dni
dzie�_miesi�c<-format.Date(Sys.Date(),"%m%d")
if (dzie�_miesi�c<"0321" || dzie�_miesi�c>="1221")
{
  print("zima")
} else if (dzie�_miesi�c>"0321" && dzie�_miesi�c<="0621")
{
  print("wiosna")
} else if (dzie�_miesi�c>"0621" && dzie�_miesi�c<="0921")
{
  print("lato")
} else
  print("jesie�")
# Instrukcja if w wersji wektorowej
dane<-round(runif(10,0,100),0)
dane<-cbind(dane,egzamin=ifelse(dane>50,"zda�","nie zda�"))

# P�tle -------------------------------------------------------------------

# Przyk�ad p�tli for
ile_zda�o<-0
for (i in 1:10)
{
  if (dane[i,2]=="zda�") ile_zda�o<-ile_zda�o+1
}
# P�tla odporna na zerow� d�ugo�� wektora
x<-NULL
for (i in seq_along(x))
{
  print(x[i])
}
# P�tla while
x<-as.numeric(readline("Podaj liczb� "))  #Pobranie danych z klawiatury
x<-10
dane<-NULL
while (x<9)                               #P�tla wykonuj�ca si� do momentu gdy x<9
{
  print(x)
  dane<-rbind(dane,x)                     #Do�acz x do zmiennej dane
  x<-as.numeric(readline("Podaj liczb� ")) #Pobierz dane z klawiatury
}
# Wektoryzacja ------------------------------------------------------------

# Por�wnanie czas�w oblicze� zadania, 
# na kt�rych pozycjach wektora jest warto�� zadana -
# wersja z p�tl�
x<-round(runif(100000000,0,100000),0) #Generowanie wektora liczb losowych
co<-10                                #Warto�� zadana
system.time(
  {
  gdzie<-c()
  for (i in 1:length(x))
  {
    if (x[i]==co)
    {
      gdzie[length(gdzie)+1]<-i
    }
  }
}
)
# wersja wektorowa
system.time(which(x==co,x))
# Por�wnanie czas�w oblicze� zadania, 
# obliczaj�cego �redni� w ka�dym wierszu macierzy -
# wersja z p�tlami
x<-round(runif(10000000,0,10),0)
�rednia1<-1:100*0
m<-matrix(x,100,100000)
system.time(
  {
    for (i in 1:nrow(m))
      for (j in 1:ncol(m))
        �rednia1[i]<-�rednia1[i]+m[i,j]/ncol(m)
  }
)
# wersja wektorowa
system.time(�rednia2<-apply(m,1,mean))
head(�rednia1)
head(�rednia2)


# Funkcje -----------------------------------------------------------------

pole_ko�a<-function(r) pi*r^2       #deklaracja prostej funkcji
pole_ko�a(10)                       #wywo�anie funkcji
formals(pole_ko�a)                  #lista argument�w funkcji
body(pole_ko�a)                     #cia�o funkcji
environment(pole_ko�a)              #lokalizacja funkcji
                                    #wykorzystanie funkcji anonimowej
apply(matrix(1:10,2,5),1,function(x) quantile(x,0.25))
x<-333   
pole_prostok�t<-function(a,b=a)     #deklaracja argumentu domy�lnie takiego jak a
{
  x<-555                            #zmiana warto�ci zmiennej lokalnej
  x<<-444                           #zmiana warto�ci zmiennej globalnej
  return (a*b)
}
pole_prostok�t(10)                  #wywo�anie funkcji z warto�ci� domy�ln� b
pole_prostok�t(10,20)               #wywo�anie funkcji z dwoma argumentami
moja_suma<-function(...)            #deklaracja funkcji ze zmienn� liczba argument�w
{
  return(
    cat("Podano",...length(),"argumenty, z kt�rych pierwszy to",
        ..1,"a ich suma to",sum(...)))
}
moja_suma(1,2,3)                    #wywo�anie funkcji podaj�c 3 argumenty

# �wiczenia ---------------------------------------------------------------
rm(list=ls())
# Do wczytanego pliku "02 - Szereg sprzeda�.txt" do�acz kolumn� status
# w kt�rej przekroczenie warto�ci 40 w kolumnie Sales to s�owo OK
sprzedaz<-read.delim("./Dane/02 - Szereg sprzeda�.txt",header = T)
sprzedaz<-cbind(sprzedaz,status=ifelse(sprzedaz$Sales>40,"ok","---"))
# W p�tli wy�wietli� daty tylko tych danych ze statusem "ok"
for (i in 1:nrow(sprzedaz))
   if (sprzedaz$status[i]=="ok") print (sprzedaz[i,])
# Napisz wersj� wektorow� poprzedniego zadania
sprzedaz[sprzedaz$status=="ok",]
# Napisz funkcj� licz�c� �redni� sprzeda� w podanym miesi�cu
�rednia_miesi�czna<-function(dane,nr_mies)
{
  cat(month.name[nr_mies],mean(dane$Price[format.Date(dane$Date,"%m")
                        ==sprintf("%02d", nr_mies)]))
  
}
�rednia_miesi�czna(sprzedaz,5)
