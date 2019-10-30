
# Instrukcje warunkowe ----------------------------------------------------
# Zastosowanie instrukcji if w pe³nej sk³¹dni
dzieñ_miesi¹c<-format.Date(Sys.Date(),"%m%d")
if (dzieñ_miesi¹c<"0321" || dzieñ_miesi¹c>="1221")
{
  print("zima")
} else if (dzieñ_miesi¹c>"0321" && dzieñ_miesi¹c<="0621")
{
  print("wiosna")
} else if (dzieñ_miesi¹c>"0621" && dzieñ_miesi¹c<="0921")
{
  print("lato")
} else
  print("jesieñ")
# Instrukcja if w wersji wektorowej
dane<-round(runif(10,0,100),0)
dane<-cbind(dane,egzamin=ifelse(dane>50,"zda³","nie zda³"))

# Pêtle -------------------------------------------------------------------

# Przyk³ad pêtli for
ile_zda³o<-0
for (i in 1:10)
{
  if (dane[i,2]=="zda³") ile_zda³o<-ile_zda³o+1
}
# Pêtla odporna na zerow¹ d³ugoœæ wektora
x<-NULL
for (i in seq_along(x))
{
  print(x[i])
}
# Pêtla while
x<-as.numeric(readline("Podaj liczb¹ "))  #Pobranie danych z klawiatury
x<-10
dane<-NULL
while (x<9)                               #Pêtla wykonuj¹ca siê do momentu gdy x<9
{
  print(x)
  dane<-rbind(dane,x)                     #Do³acz x do zmiennej dane
  x<-as.numeric(readline("Podaj liczb¹ ")) #Pobierz dane z klawiatury
}
# Wektoryzacja ------------------------------------------------------------

# Porównanie czasów obliczeñ zadania, 
# na których pozycjach wektora jest wartoœæ zadana -
# wersja z pêtl¹
x<-round(runif(100000000,0,100000),0) #Generowanie wektora liczb losowych
co<-10                                #Wartoœæ zadana
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
# Porównanie czasów obliczeñ zadania, 
# obliczaj¹cego œredni¹ w ka¿dym wierszu macierzy -
# wersja z pêtlami
x<-round(runif(10000000,0,10),0)
œrednia1<-1:100*0
m<-matrix(x,100,100000)
system.time(
  {
    for (i in 1:nrow(m))
      for (j in 1:ncol(m))
        œrednia1[i]<-œrednia1[i]+m[i,j]/ncol(m)
  }
)
# wersja wektorowa
system.time(œrednia2<-apply(m,1,mean))
head(œrednia1)
head(œrednia2)


# Funkcje -----------------------------------------------------------------

pole_ko³a<-function(r) pi*r^2       #deklaracja prostej funkcji
pole_ko³a(10)                       #wywo³anie funkcji
formals(pole_ko³a)                  #lista argumentów funkcji
body(pole_ko³a)                     #cia³o funkcji
environment(pole_ko³a)              #lokalizacja funkcji
                                    #wykorzystanie funkcji anonimowej
apply(matrix(1:10,2,5),1,function(x) quantile(x,0.25))
x<-333   
pole_prostok¹t<-function(a,b=a)     #deklaracja argumentu domyœlnie takiego jak a
{
  x<-555                            #zmiana wartoœci zmiennej lokalnej
  x<<-444                           #zmiana wartoœci zmiennej globalnej
  return (a*b)
}
pole_prostok¹t(10)                  #wywo³anie funkcji z wartoœci¹ domyœln¹ b
pole_prostok¹t(10,20)               #wywo³anie funkcji z dwoma argumentami
moja_suma<-function(...)            #deklaracja funkcji ze zmienn¹ liczba argumentów
{
  return(
    cat("Podano",...length(),"argumenty, z których pierwszy to",
        ..1,"a ich suma to",sum(...)))
}
moja_suma(1,2,3)                    #wywo³anie funkcji podaj¹c 3 argumenty

# Æwiczenia ---------------------------------------------------------------
rm(list=ls())
# Do wczytanego pliku "02 - Szereg sprzeda¿.txt" do³acz kolumnê status
# w której przekroczenie wartoœci 40 w kolumnie Sales to s³owo OK
sprzedaz<-read.delim("./Dane/02 - Szereg sprzeda¿.txt",header = T)
sprzedaz<-cbind(sprzedaz,status=ifelse(sprzedaz$Sales>40,"ok","---"))
# W pêtli wyœwietliæ daty tylko tych danych ze statusem "ok"
for (i in 1:nrow(sprzedaz))
   if (sprzedaz$status[i]=="ok") print (sprzedaz[i,])
# Napisz wersjê wektorow¹ poprzedniego zadania
sprzedaz[sprzedaz$status=="ok",]
# Napisz funkcjê licz¹c¹ œredni¹ sprzeda¿ w podanym miesi¹cu
œrednia_miesiêczna<-function(dane,nr_mies)
{
  cat(month.name[nr_mies],mean(dane$Price[format.Date(dane$Date,"%m")
                        ==sprintf("%02d", nr_mies)]))
  
}
œrednia_miesiêczna(sprzedaz,5)
