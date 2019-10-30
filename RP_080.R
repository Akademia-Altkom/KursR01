
# Regresja dla danych ilościowych -----------------------------------------
## Wczytanie i przygotowanie danych ----------------------------------------
rm(list=ls())                               #usuwanie danych
dane<-trees
dane[,1]<-dane[,1]*2.54                     #zamiana cali n cm
dane[,2]<-dane[,2]*2.54*12/100              #zamiana stóp na m
dane[,3]<-dane[,3]*(2.54*12/100)^3          #zamiana stop^3 na m^3
colnames(dane)<-c("Średnica","Wysokość","Objętość") #nadanie nazw kolumn

# Wizualizacja danych -----------------------------------------------------
library(ggplot2)
library(GGally)                             #podłączenie biblioteki wykresów parami
wykres<-ggpairs(dane)                       #wykres parami
wykres2<-ggplot(dane,aes(y=Wysokość,x=Średnica))+geom_point()+
  geom_smooth(method="lm")
wykres[2,1]<-wykres2                        #podmiana wykresu w 2 wierszu i 1 kolumnie
wykres2<-ggplot(dane,aes(y=Objętość,x=Średnica))+geom_point()+
  geom_smooth(method="lm")                  #wykres z linią regresji liniowej
wykres[3,1]<-wykres2
wykres2<-ggplot(dane,aes(y=Objętość,x=Wysokość))+geom_point()+
  geom_smooth(method="lm")
wykres[3,2]<-wykres2
wykres
print_if_interactive(wykres)                #odświeżenie wykresu parami

# Wyznaczanie modelu regresji liniowej ------------------------------------
model<-lm(data = dane,formula = Objętość~.) #regresja liniowa z uwzględnieniem wszystkich kolumn
summary(model)                              #parametry modelu regresji
anova(model)                                #analiza dokładności modelu (ANOVA)
print(RMSE<-sqrt(mean((dane$Objętość-model$fitted.values)^2))) #średni bład kwadratowy

# Optymalizacja modelu ----------------------------------------------------
step(model,direction = "both")              #metoda krokowa optymalizajci modelu

# Wykres modelu regresji --------------------------------------------------
rownanie<-paste("y=Średnica*",round(model$coefficients[[2]],3),"+Wysokość*",
  round(model$coefficients[[3]],3),"+(" ,round(model$coefficients[[1]],3),")",sep = "")
#punkty na wykresie to dane oryginalne,czerwona linia to dane z modelu
#słupki błedów to 95% przedział istotności
ggplot(dane,aes(y=Objętość,x=1:length(dane[,1])))+geom_point()+
  xlab("")+geom_errorbar(ymin=predict(model,dane,interval="confidence")[,2],
                         ymax=predict(model,dane,interval="confidence")[,3],col="green")+
  geom_line(aes(y=model$fitted.values,color="red"))+
  ggtitle(label="Regresja liniowa",subtitle=rownanie)+
  theme(plot.title = element_text(hjust = 0.5),plot.subtitle = element_text(hjust = 0.5))+
  theme(legend.position = "")

# Prognoza dla nowych danych ----------------------------------------------
predict(model,newdata = (data.frame(Wysokość=50,Średnica=25)),interval = "confidence")

# Regresja dla danych ilościowych z dodatkowym czynnikiem -----------------
## Wczytanie i transformaja danych ----------------------------------------
rm(list=ls())
dane<-read.table("./Dane/06 - Analiza płac.csv",header = T,
                 dec=",",sep = ";",encoding = "UTF-8")
colnames(dane)[1]<-"Płeć"
colnames(dane)[5]<-"Płaca"
dane<-dane[complete.cases(dane),]           #Wyrzucenie z danych niepełnych obserwacji NA

# Wizualizacja danych -----------------------------------------------------
ggpairs(dane)

# Wyznaczenie modelu ------------------------------------------------------
model<-lm(data=dane,formula=Płaca~.)
summary(model)

# Zmiana czynnika odniesienia ---------------------------------------------
contrasts(dane$Płeć)                        #wyświetlenie wartośći całkowitych przyporzadkowanych do czynników
dane$Płeć<-relevel(dane$Płeć,ref="Mężczyzna") #zmiana czynnika względem, 
dane$Wykształcenie<-relevel(dane$Wykształcenie,ref="Wyższe") #którego bedzie zbudowany model 

model<-lm(data=dane,formula=Płaca~.)
summary(model)
anova(model)
print(RMSE<-sqrt(mean((dane$Płaca-model$fitted.values)^2)))

# Prognoza dla nowych danych ----------------------------------------------
nowe_dane<-data.frame(Płeć=c("Kobieta","Mężczyzna"),Wykształcenie=c("Wyższe","Wyższe"),
                      Wiek=c(65,65),Staż.pracy=c(30,30))
print(prognoza<-predict(model,newdata = nowe_dane,interval = "confidence"))
diff(prognoza)                              #różnica między wierszami
summary(model)$coefficients                 #czyli współczynnik PłećKobieta to różnica

# Ćwiczenia ---------------------------------------------------------------
#Wykonać analizę za pomocą metody regresji liniowej danych w pliku "08 - Komis.txt"
#Plik to ceny w tys.zł jednej marki samochodów o podanym wieku (X1) i przebiegu w tys. km (x2)
#Ile należy zaplacić za 5 letnie auto o przebiegu 150tys. km.

#Wykonać analizę modelu regresji liniowej cen budynków z pliku "09 - Budynki.csv"

#Sprawdzić jak nakłady środków na reklamę (radio, tv, prasa) wpływa na sprzedaż (plik "10 - Reklama.csv")
