
# Prognozowanie szeregów czasowych metodą Wintersa ------------------------
##Wczytanie danych i zamiana na szereg czasowy-----------------------------
rm(list=ls())                               #usuwanie danych
dane<-read.table("./Dane/02 - Szereg sprzedaż.txt",h=T)
library(forecast)
szereg<-ts(dane$Sales,start=2002,frequency = 12)

# Budowanie modeli prognostycznych  ---------------------------------------
mNaiwny<-snaive(szereg)
mWinterADD<-hw(szereg,seasonal = "additive")
mWinterMUL<-hw(szereg,seasonal = "multiplicative")
mDekomp<-stlm(szereg)
mArima<-auto.arima(szereg)
mTBATS<-tbats(szereg)
mNeuron<-nnetar(szereg)

# Tabela błędów -----------------------------------------------------------
ERRORS<-accuracy(forecast(mNaiwny))
ERRORS<-rbind(ERRORS,accuracy(forecast(mWinterADD)))
ERRORS<-rbind(ERRORS,accuracy(forecast(mWinterMUL)))
ERRORS<-rbind(ERRORS,accuracy(forecast(mDekomp)))
ERRORS<-rbind(ERRORS,accuracy(forecast(mArima)))
ERRORS<-rbind(ERRORS,accuracy(forecast(mTBATS)))
ERRORS<-rbind(ERRORS,accuracy(forecast(mNeuron)))
rownames(ERRORS)<-c("Naiwna z sezon","Winters Add","Winters Mul","Dekompozycja",
                    "ARIMA","TBATS","Sieć neuronowa")
ERRORS<-data.frame(ERRORS)
round(ERRORS,4)

# Wizualizacja modelu -----------------------------------------------------
library(ggplot2)
ggseasonplot(szereg,year.labels=TRUE, year.labels.left=TRUE)
ggmonthplot(szereg)
autoplot(szereg) +
  autolayer(forecast(mNaiwny),series="Naiwny z sezon", PI=FALSE) +
  autolayer(forecast(mWinterADD),series="Winters Add", PI=FALSE) +
  autolayer(forecast(mWinterMUL),series="Winters Mul", PI=FALSE) +
  autolayer(forecast(mDekomp),series="Dekompozycja", PI=FALSE) +
  autolayer(forecast(mArima),series="ARIMA", PI=FALSE) +
  autolayer(forecast(mTBATS),series="TBATS", PI=FALSE) +
  autolayer(forecast(mNeuron),series="Sieć neuron.", PI=FALSE) +
  ggtitle("Poziom sprzedaży") +
  xlab("Rok") +ylab("Sprzedaż")+ guides(colour=guide_legend(title="Prognoza"))

autoplot(szereg)+
  autolayer(100*(szereg-mWinterADD$fitted)/szereg,series = "Winters Add")+
  autolayer(100*(szereg-mWinterMUL$fitted)/szereg,series="Winters Mul") +
  autolayer(100*(szereg-mDekomp$fitted)/szereg,series="Dekompozycja") +
  autolayer(100*(szereg-mArima$fitted)/szereg,series="ARIMA") +
  autolayer(100*(szereg-mTBATS$fitted)/szereg,series="TBATS") +
  autolayer(100*(szereg-mNeuron$fitted)/szereg,series="Sieć neuron") +
  coord_fixed(ratio=1/7,ylim =c(-20,20))+
  ggtitle("Poziom sprzedaży",subtitle = "Dopasowanie modelu") +
  theme(plot.title = element_text(hjust = 0.5),plot.subtitle = element_text(hjust = 0.5))+
  xlab("Rok") +ylab("Procentowy błąd")+ guides(colour=guide_legend(title="Metoda oraz MAPE"))

autoplot(szereg)+autolayer(mNeuron$fitted,series="Sieć neuron")+
  xlab("Rok") +ylab("Sprzedaż")+guides(colour=guide_legend(title="Metoda"))

# Wizualizacja błedów -----------------------------------------------------
ggplot(ERRORS,aes(y=RMSE,x=rownames(ERRORS),fill=RMSE>min(RMSE)))+geom_bar(stat = "identity")+
  geom_text(aes(label=round(RMSE,2)),position=position_fill(vjust=2))+
  theme(legend.position = "off")+xlab("Metoda") +ylab("RMSE")
ggplot(ERRORS,aes(y=MAPE,x=rownames(ERRORS),fill=MAPE>min(MAPE)))+geom_bar(stat = "identity")+
  theme(legend.position = "off")+xlab("Metoda") +ylab("MAPE [%]")+
  geom_text(aes(label=round(MAPE,2)),position=position_fill(vjust=2))

# Ćwiczenia ---------------------------------------------------------------
#Wykonaj prognozowanie sprzedaży butelek win - zestaw wineind
#Wykonaj prognozowanie przewiezionych pasażerów linii lotniczych - zestaw AirPassengers
#Wykonaj prognozowanie plam na Słońcu - zestaw sunspots.month
