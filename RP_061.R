
# Same dane ilościowe ----------------------------------------------------
                                      #dane losowe 
dane<-data.frame(x=1:10,y=100*1:10+runif(10,0,10)) 
attach(dane)                          #podłączenie do przestrzeni nazw ramki 'dane'
stare_ustawienia<-par(no.readonly = T)#zapamiętanie domyślnych ustawień grafiki
plot(x,y,                             #generowanie wykresu punktowego
     main="Wykres punktowy",sub="Podtytuł wykresu",#z tytułem, podtytułem
     xlab="Os x", ylab="Os y",        #etykietami osi x i y
     lwd=2,pch=1:10,                  #ustaloną szerokością i typem znaczników
     font.main=4,family="serif",      #pogrubioną czcionka i rodziną czcionek
     col.main="blue",col.lab="green", #kolor tytułu niebieski a etykiet osi zielony
     cex.axis=0.8,cex.lab=1.2,        #rozmiar czcionki znaczników osi i etykiet
     fg=rgb(1,0,0),bg="blue")         #kolor pierwszego planu czerwony i tła niebieski
lines(x,y,col="yellow")               #rysowanie lini o kolorze zółtym
abline(h=mean(y),lty=2,col="grey")    #linia szara przerywana pozioma na wysokoœci średniej z y
text(x=3,y=mean(y),                 #dodanie do wykresu tekstu na wysokosci średniej
     labels=paste("średnia=",round(mean(y),2)), #złożonego ze słowa "średnia" i wartości
     pos=3,col="red")                 #powyżej podanego punktu z kolorem czerwonym
axis(side=3,at=1:10,                  #dodanie dodatkowej osi na górze
     labels=LETTERS[1:10],col="red")  #złozonej z 10 wielkich liter w kolorze czerwonym
legend("topleft",legend=c("y","y"),   #dodanie legendy u góry po lewej stronie wykresu
       lty=c(0,1),pch=c(1,NA),        #ustalenie linii i punktów jako znaczników legendy
       col=c("black","yellow"),       #kolor znaczników
       title="legenda",cex=0.5,       #tytul okienka legendy i jego rozmiar
       text.width = 1,seg.len = 0.3)  #szerokość tekstu i linii znaczników              

par(mfcol=c(2,3))                     #podział obszaru kreślenia wykresów na 2 wiersze i 3 kolumny
plot(x,y,type="p",main="Wykres punktowy")
plot(x,y,type="l",main="Wykres liniowy")
plot(x,y,type="b",main="Wykres punktowo-liniowy")
plot(x,y,type="s",main="Wykres schodkowy")
plot(x,y,type="h",main="Wykres kreskowy")
plot(x,y,type="S",main="Wykres schodkowy")

par(mfcol=c(3,3))                     #podział obszaru kreślenia wykresów na 3 wiersze i 3 kolumny
curve(expr=sin(x)/x,                  #wykres funkcji symbolicznej sin(x)/x,
      from=-30,to=30,n=1000,lwd=3)    #w granicach od -30 do 30 dla 1000 punktów
title("Wykres funkcji symbolicznej")  #dodanie tytułu do wykresu
abline(v=0,h=0,lty=3,col=c("red","green")) #dodanie lini poziomej i pionowej i przypisanie kolorów
polygon(x=c(-pi,-pi,pi,pi),c(0,1,1,0),#kreślenie obszaru o podanych współrzednych
        border="blue")                #kolor obramowania niebieski

matplot(x,cbind(x,10/x),              #wykres dla kilku funkcji, pod które podstawiane sa dane$x
        type="l",col=c("blue","red"),lty=1) #określenie kolorów i typów linii
title("Wykres dla funkcji przy postawieniu x")#dodanie tytułu do wykresu
dotchart(x,round(y,2),main = "Wykres punktowy")#wykres punktowy

barplot(x,col=(y>600)*2,
        main="Wykres słupkowy")      #wykres słupkowy
barplot(x,col=(y>600)*2,horiz=T,
        main="Wykres słupkowy")      #wykres słupkowy

palette(rainbow(10))                  #zmiana palety kolorów i jej zakres
pie(y,labels=round(y,2),              #wykres kołowy wraz z etykietami
    col=x,radius = 1,main="Wykres kołowy") #przypisanie kolorów i promienia koła
palette("default")                    #powrót do domyślnej palety kolorów
pie(y,round(y,2),
    col=x,radius = 1,main="Wykres kołowy") #wykres kołowy

etykiety<-boxplot(y)$stats            #deklaracja wektora z obliczonymi kwartylami
title("Wykres pudełkowy")             #dodanie tytułu do poprzednio utworzonego wykresu
text(x=1,y=etykiety,labels=round(etykiety,2),#dodanie na wykres tekstu od pozycji x=1 w miejscu y
     pos=3,col="red")                 #wyjustowanie ustawione w pos i kolor czerwony
hist(y,col = heat.colors(10),main="Histogram")#histogram w kolorze ustawionym przez paletę heat.colors

par(stare_ustawienia)                 #załadowanie starych ustawień dla wykresów

# Zapis wykresu do pliku pdf ----------------------------------------------

pdf(file="./Dane/histogram.pdf",paper="A4")  #otwarcie przechwytywania do pliku pdf o ustalonej nazwie
hist(x=y,breaks=5,probability = T,    #utworzenie histogramu liczebności o danych y i 5 przedziałach
     col="green",angle=45,density=20, #przypisanie koloru i kąta nachylenia oraz gestości linii kreskowania
     border = "red", main="Histogram") #kolor obramowania i tytuł
dev.off()                             #wyłaczenia przechwytywania grafiki i zapis do pliku pdf

# Dane ilosciowe z czynnikiem ---------------------------------------------
                                      #wczytanie danych z pliku
dane<-read.table("./Dane/05 - Oceny.txt",stringsAsFactors = F)
dane<-cbind(rownames(dane),stack(dane))#zmiana ukladu danych z tabeli krzyzowej do ukladu bazodanowego
colnames(dane)<-c("Przedmiot","Ocena","Osoba")#zmiana nazw kolumn

layout(rbind(c(1, 1), c(2, 3)),       #ustawienie układu wykresów -2 wiersze, w pierwszym jedną w drugim 2 kolumny
       heights = c(3, 2))             #wysokość pierwszego wiersza 3 drugiego 2
boxplot(dane$Ocena~dane$Osoba,        #dane isslościowe Ocena dla czynnika Osoba
        horizontal=T)                 #pudexxxxxxłka na wykresie poziome
abline(v=median(dane$Ocena),          #dodanie lini poziomej dla x=medianie
       col="red",lty="dashed")        #linia czerwona przerywana
statystyka<-tapply(dane$Ocena,dane$Osoba,mean)#deklaracja wektora ze średnią ocen dla każdej osoby
pie(statystyka,                       #wykres kołowy wektowa ze średnia
    paste(names(statystyka),round(statystyka,1)),#etykieta zlozona z imienia oraz wartości średniej zaokrąglonej
    sub="Wykres kołowy dla średniej ocen osób",#podtytuł
    radius=1,font.sub=2,cex.sub=0.8,cex=0.5)  #promień kolo, czcionka i pogrubienie podtytułu
statystyka<-tapply(dane$Ocena,dane$Przedmiot,mean)#deklaracja wektora ze średnią ocen dla każdego przedmiotu
pie(statystyka,paste(names(statystyka),round(statystyka,1)),
    sub="Wykres kołowy dla sredniej ocen z przedmiotów",radius=1,font.sub=2,cex.sub=0.8,cex=0.5)

layout.show(layout(rbind(c(1, 1), c(2, 3)), #pokazanie układu wykresów dla 2 wierszy,pierwszy z jedną, drugi z 2 kolumnami
                   heights = c(3, 2)))#wysokość pierwszego wiersza 3 drugiego 2

layout(1)                             #powrót do jednego układu wykresu

