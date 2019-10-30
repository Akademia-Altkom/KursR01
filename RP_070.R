
# Statystyczne miary opisowe ----------------------------------------------

library(readxl)                                  #Szybsza biblioteka do odczytu
poznan<-read_excel("./Dane/04_Import/Poznań.xlsx",1)  #Odczyt danych
poznan$Dział<-factor(poznan$Dział)               #Zamiana kolumny na typ factor
poznan$Zamawiający<-factor(poznan$Zamawiający)
poznan$Kategoria<-factor(poznan$Kategoria)
poznan$Towar<-factor(poznan$Towar)
attach(poznan)                                   #Podłaczenie zmiennej, tak aby można 
                                                 #bezpośrednio podawać nazwę kolumny
mean(Kwota)                                      #Wartość średnia
median(Kwota)                                    #Mediana
max(table(factor(Kwota)))                        #Wartość występujaca najcześciej
quantile(Kwota,probs = seq(0,1,0.1))             #Decyle od 1 do 10
IQR(Kwota)                                       #Odstęp międzyćwiartkowy
sd(Kwota)                                        #Odchylenie standardowe próby
var(Kwota)                                       #Wariancja próby
range(Kwota)                                     #Rozstęp, czyli różnica między max i min

sd(Kwota)/mean(Kwota)                            #Współczynnik zmienności klasyczny
IQR(Kwota)/2/median(Kwota)                       #Współczynnik zmienności pozycyjny
quantile(Kwota,0.75)[[1]]+IQR(Kwota)*1.5         #Górna granica wartości odstających
quantile(Kwota,0.25)[[1]]-IQR(Kwota)*1.5         #Dolna granica wartoścu odstających

sum((Kwota-mean(Kwota))^3)/                      #Skośność
  (length(Kwota)-1)/sd(Kwota)^3
sum((Kwota-mean(Kwota))^4)/(length(Kwota)-1)/
  var(Kwota)^2-3                                 #Kurtoza
summary(Kwota)
tapply(Kwota,Zamawiający,summary)                #Podsumowanie statystyk dla każdego zamawiającego

# Wykres pudełkowy --------------------------------------------------------
library(ggplot2)

ggplot(poznan,aes(x=Zamawiający,y=Kwota,fill=Zamawiający))+ #Wykres pudelkowy dla zamawiających
  geom_boxplot()+ geom_text(aes(label=Kwota),size=3,vjust=1)+
  theme(legend.position = "none")

spoz=mean(Kwota[Kategoria=="Spożywcze"])
biur=mean(Kwota[Kategoria=="Biurowe"])
ggplot(poznan,aes(x=Kategoria,y=Kwota,fill=Kategoria))+     #Wykres pudelkowy dla kategorii
  geom_boxplot()+ stat_summary(fun.y=mean,col="black",shape=7,geom="point")+
  geom_text(aes(label=Kwota),size=4,vjust=1,col="red")+
  theme(legend.position = "none")

ggplot(poznan,aes(x=1,y=Kwota))+                 #Wykres pudelkowy dla wszystkich danych
  geom_boxplot()+ geom_text(aes(label=Kwota),size=3,vjust=1,col="red")+
  theme(legend.position = "none")
