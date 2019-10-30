
# Pakiet ggplot2 ----------------------------------------------------------

library(ggplot2)

# Dane ilościowe ----------------------------------------------------------

dane<-data.frame(x=1:100,y=ceiling(runif(100,0,49)))   #generowanie danych losowych
kwartyle<-c(quantile(dane$y,0.25), 
            median(dane$y),quantile(dane$y,0.75))      #obliczenia kwartyli

kolor<-!(dane$y>kwartyle[[3]] | dane$y<kwartyle[[1]])  #czy poza kwartylami - to inny kolor
kształt<-!kolor                                        #czy poza kwartylami - to inny kształt
ggplot(dane, aes(x=x, y=y,color=kolor,shape=kształt))+ #wykres punktowy
  geom_point()+theme(legend.position = "none")+        #bez legendy
  geom_hline(yintercept = kwartyle,col=c("red","green","red"))+ #z liniami na poziomi kwartyli
  ggtitle("Wykres punktowy")                           #tytuła wykresu


ggplot(dane)+geom_histogram(aes(y,fill=kolor),bins=49)+#histogram o dla 49 przedziałów
  theme_minimal()+theme(legend.position = "none")+     #bez legendy o motywie minimalistycznym
  geom_vline(xintercept = kwartyle,col=c("red","green","red"))#z liniami pionowymi wyznaconymi przez kwartyle

# Dane ilosciowe z czynnikiem ---------------------------------------------
#wczytanie danych z pliku
dane<-read.table("./Dane/05 - Oceny.txt",stringsAsFactors = F)
dane<-cbind(rownames(dane),stack(dane))               #zmiana ukladu danych z tabeli krzyzowej do ukladu bazodanowego
colnames(dane)<-c("Przedmiot","Ocena","Osoba")        #zmiana nazw kolumn

ggplot(dane)+geom_violin(aes(y=Ocena,x=Osoba,fill=Osoba))+#wykres skrzypcowy ocen z podziałem na osoby
  ggtitle("Wykres dla ocen")+xlab("Osoba")+ylab("Oceny")+#tytuł wykresu i etykiety osi x i y
  geom_hline(yintercept = median(dane$Ocena),
             col="red",linetype="dashed")+            #linia pozioma przerywana o wartości mediany
  geom_text(aes(x=3,y=median(dane$Ocena)+2,           #dodanie tekstu powyżej linii
                label=paste("mediana=",median(dane$Ocena))),col="red",size=3)#definicja rozmiaru i koloru tekstu

ggplot(dane) + geom_point(aes(x=Przedmiot,y=Ocena))+  #wykres punktowy ocen dla przedmiotów
  facet_grid(Osoba~.) +                               #dla kazdej osoby
  geom_hline(yintercept = median(dane$Ocena),col="red",#linia pozioma na wysokości mediany
             linetype="dotted")+  coord_flip()+       #linia przerywana i odwrócenie osi
  theme_bw() + scale_y_continuous(limits = c(0,100))+ #motym czarno biały i skali osi x (po odwróceniu)
  geom_text(aes(x=1,y=median(dane$Ocena),             #dodanie tekst do linii pionowej (po odwróceniu)
                label=median(dane$Ocena)),col="red",size=3)+
  theme(text=element_text(size=10))+                  #wielkość czcionki tytułu wykresu
  ggtitle("Oceny uczniów ze wszystkich przedmiotów")  #tytuł wykresu


# Kreślenie map -----------------------------------------------------------

library(maps)

kraje<-map_data("world")                      #pobranie z bazy danych wszystkich krajów
kraje<-subset(kraje,region %in% c("Poland"))  #przefiltrowanie dla Polski
miasta<-world.cities                          #pobranie z bazy wszystkich miast
miasta<-subset(miasta, country.etc =="Poland" & pop>150000)#filtrowanie dla Polski i powyżej 150tys

ggplot()+                                     #mapa Polski z miastami i nazwami miast
  geom_polygon(data=kraje,mapping=aes(x=long,y=lat,fill=region))+
  theme(legend.position = "off")+             #wyłaczenie legendy
  geom_point(data=miasta,mapping=aes(x=long,y=lat),size=1,col="green")+
  coord_map(projection = "mercator")+         #ustawienie układu współrzędnych
  geom_text(data=miasta,mapping=aes(x=long,y=lat,label=name),size=3)


# Pakiet ggplotAssist -----------------------------------------------------

library(ggplotAssist)

# Ćwiczenia ---------------------------------------------------------------
rm(list=ls())
library(ggplot2)
# wczytać plik "01 - Titanic.csv" i w sposób graficzny przedstawić:
dane<-read.csv("01 - Titanic.csv")
dane$pclass<-factor(dane$pclass)
dane$survived<-factor(dane$survived)
levels(dane$survived)<-c("Nie","Tak")
levels(dane$sex)<-c("Kobieta","Mężczyzna")
levels(dane$pclass)<-c("Klasa 1","Klasa 2","Klasa 3")
# ilość kobiet i mężczyzn w każdej klasie z podziałem na tych którzy przeżyli
ggplot(dane)+geom_bar(aes(x=interaction(pclass,sex),fill=survived)) + 
  scale_x_discrete(labels=c(paste(levels(dane$pclass),levels(dane$sex)[1],sep="\n"),
                            paste(levels(dane$pclass),levels(dane$sex)[2],sep="\n")))
# histogram wieku w każdej klasie
ggplot(dane)+geom_histogram(aes(age,fill=age>=18))+
  scale_fill_discrete(name="",labels=c("Dziecko","Dorosły"))+facet_grid(pclass~.)
# procentową ilość dorosłych i dzieci w każdej klasie
ggplot(dane[complete.cases(dane$age),],aes(x=pclass,fill=age>=18))+geom_bar(position="fill") +
  scale_fill_discrete(name="",labels=c("Dziecko","Dorosły"))+ 
  geom_text(aes(label=..count..),stat="count",position=position_fill(vjust=0.5))
