
# Korelacja liniowa -------------------------------------------------------
library(ggplot2)                #Deklaracja bibiloteki graficznej
dane<-women                     #Załadowanie danych z wbudowanego zestawu ze wzrostem i wagą kobiet w USA
ggplot(dane,aes(x=height,y=weight))+
  geom_point()+geom_smooth(method="lm",se=F) # Wykres punktowy z aproksymacją liniową danych
cov(dane)                       #Współczynnik kowariancji
cor(dane,method = "pearson")    #Współczynnik korelacji Pearsona
cor(dane,method = "spearman")   #Współczynnik korelacji rang Spearmana

# Korelacja nieliniowa ----------------------------------------------------
dane<-data.frame(x=1:10,y=exp(-(1:10))) #Wygenerowanie danych nieliniowych
ggplot(dane,aes(x,y))+geom_point()+
  geom_smooth(method="lm",se=F) #Wykres punktowy z aproksymacją liniową danych
cov(dane)                       #Współczynnik kowariancji
cor(dane,method = "pearson")    #Współczynnik korelacji Pearsona
ggplot(dane,aes(rank(x),rank(y)))+
  geom_point()+geom_smooth(method="lm",se=F) #Wykres punktowy rang z aproksymacją liniową danych
cor(dane,method = "spearman")   #Współczynnik korelacji rang Spearmana

# Estymaja przedziałowa ---------------------------------------------------
dane<-women
colnames(dane)<-c("wzrost","waga")
dane$wzrost<-dane$wzrost*2.54
dane$waga<-dane$waga*0.4536
ufność<-qt(1-0.05/2,length(dane$wzrost)-1)*
  sd(dane$wzrost)/sqrt(length(dane$wzrost)-1)
przedział<-cbind(mean(dane$wzrost)-ufność,mean(dane$wzrost)+ufność)
cat("Przedział, w którym z 95% pawdopodobieństwem zawiera się \nśrednia wzrostu dla całej populacji to",przedział)


# Ćwiczenia ---------------------------------------------------------------
#Wykorzystać znane miary statystyk opisowych do oceny wagi (w kg) i wzrostu (w cm) kobiet
#Pokazać na dwóch osobnych wykresach wykres pudełkowy wagi i wzrostu
#Wykonać estymacje przedziałową wagi populacji kobiet na podstawie próby

