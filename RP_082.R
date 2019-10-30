
# Segmentacja danych metodą k-średnich ------------------------------------
# Wczytanie i przygotowanie danych ----------------------------------------
rm(list=ls())
dane<-read.csv("./Dane/10 - Reklama.csv")
dane<-dane[,-1]

# Dobór ilości segmentów --------------------------------------------------
k<-8
wss<-sapply(1:k,function(k){kmeans(dane, k)$tot.withinss})

#optymalny dobór to tam gdzie jest zagięcie wykresu - tzw łokieć
library(ggplot2)
ggplot()+geom_line(aes(x=1:8,y=wss))+xlab("Ilość segmentów")+ylab("Średnia z sumy kwadratów wewnątrz każdego segmentu")+
  geom_vline(xintercept = 3,col="red",linetype="dashed")+
  geom_text(aes(x=3,y=0,label="3"),hjust = "right")

# Podział na 3 segmenty ---------------------------------------------------
podzial<-kmeans(dane,3)
print(pod<-as.data.frame(podzial$centers))   #wsp. środków segmentów
dane<-cbind(dane,as.factor(podzial$cluster))
colnames(dane)[5]<-"Segment"
#wizualizacja
ggplot() + geom_point(data=dane,aes(x=TV,y=Sales,col=Segment))+
  geom_point(data=pod,aes(x=TV,y=Sales))+
  geom_point(data=pod,aes(x=TV,y=Sales),col=rownames(pod),size=52, alpha=.08)
#tabela przynależności do segmentów, pod względem przedziałów kwoty Sales
table(dane$Segment,cut(dane$Sales,breaks=10*(0:3))) 
#tabela przynależności do segmentów, pod względem wydatków na TV
table(dane$Segment,cut(dane$TV,breaks=100*(0:3)))  

# Ćwiczenia ---------------------------------------------------------------
#Wykonaj sgmentacje drzew z pliku 11 - Drzewa.csv ze wzgledu zmierzone parametry
# usunięcie zmiennych
rm(list=ls())
# wczytanie danych
dane<-read.csv("./Dane/11 - Drzewa.csv",sep=";",dec = ",")
#skalowanie danych
dS<-scale(dane[,1:3])
colnames(dane)[1]<-"Fatty.Acids"
colnames(dS)[1]<-"Fatty.Acids"
wss<-NULL
for (i in 1:8)
{
  wss<-c(wss,mean(kmeans(dS,i)$withinss))
}
library(ggplot2)
ggplot()+geom_line(aes(x=1:8,y=wss))+
  geom_vline(xintercept = 3,col="red",linetype="dashed")+
  geom_text(aes(x=3,y=0,label="3"),hjust = "right")

podzial<-kmeans(dS,3)
pod<-as.data.frame(podzial$centers)
dane<-cbind(dane,as.factor(podzial$cluster))
colnames(dane)[6]<-"Segment"
ggplot() + geom_point(data=dane,aes(x=Alkaline,y=Fatty.Acids,col=Segment))+
  geom_text(data=dane,aes(x=Alkaline,y=Fatty.Acids,label=Status,col=Segment))
table(dane$Segment,dane$Status) 
#Wykonaj segmentacje płac z pliku 06 - Analiza płac.csv