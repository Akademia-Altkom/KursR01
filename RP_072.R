
# Wczytanie i transformaja danych -----------------------------------------
# Usuwanie danych
rm(list=ls())
dane<-read.table("05 - Oceny.txt",stringsAsFactors = F)
dane<-cbind(rownames(dane),stack(dane))               #zmiana ukladu danych z tabeli krzyzowej do ukladu bazodanowego
colnames(dane)<-c("Przedmiot","Ocena","Osoba")        #zmiana nazw kolumn

# Test na normalność rozkładów ocen dla wszystkch osób --------------------
tapply(dane$Ocena,dane$Osoba,shapiro.test)
# p-value>0.05 tzn. nie ma dowodów statystycznych na to, że rozkłady
# populacji mają inny rozkład niż rozkład normalny

# Test na równość wszystkich wariancji ------------------------------------
bartlett.test(dane$Ocena~dane$Osoba)
# p-value>0.05 tzn. nie ma dowodów statystycznych na to, że wariancje
# populacji nie są równe

# Test na równość średniej ------------------------------------------------
anova(aov(dane$Ocena~dane$Osoba))
# p-value<0.05 (Pr(>F)) tzn. conajmniej jedna osoba ma inną 
# średnią niż reszta osób - nie wiadomo która osoba

# Test post-hoc - każdy z każdym ------------------------------------------
TukeyHSD(aov(dane$Ocena~dane$Osoba))
plot(TukeyHSD(aov(dane$Ocena~dane$Osoba)))
# tylko dla par Bob-John, Anne-Mary, Bob-Dave brak dowodów
# statystycznych, że średnie ocen się różnią

# Wczytanie i transformaja danych -----------------------------------------
dane<-read.table("./Dane/06 - Analiza płac.csv",header = T,
                 dec=",",sep = ";",encoding = "UTF-8")
colnames(dane)[1]<-"Płeć"
colnames(dane)[5]<-"Płaca"

# Test na normalność rozkładów płacy dla kobiet i mężczyzn ----------------
tapply(dane$Płaca,dane$Płeć,shapiro.test)
# p-value<0.05, czyli rozład pensji w populacjach kobiet i mężczyzn
# nie jest rozkładem normalnym

# Test na równość median dla populacji kobiet i mężczyzn ------------------
wilcox.test(dane$Płaca~dane$Płeć)
# p-value<0.05, czyli mediany pensji w populacjach kobiet i mężczyzn
# nie są sobie równe - różnią się w sposób istatny statystycznie

# Test na proporcjonalność rozkładu płeć vs wykształcenie -----------------
# test zmiennej jakościowej
temp<-table(dane$Wykształcenie,dane$Płeć) #tabela krzyżowa
chisq.test(temp)
# p-value<0.05,czyli proporcjonalność rozkładu cechy wykszałcenie 
# dla kobiet i mężczyzn nie jest taka sama
chisq.test(temp)$expected #krzyżowa tabela oczekiwana
chisq.test(temp)$observed #krzyżowa tabela wejściowa

# Ćwiczenia ---------------------------------------------------------------
# Zbadać, czy nauka każdego przedmiotu jest na takim samm poziomie
# Zbadać, czy poziom wykształcenia ma wpływ na pensje
tapply(dane$Płaca,dane$Wykształcenie,shapiro.test)
kruskal.test(dane$Płaca~dane$Wykształcenie)
pairwise.wilcox.test(dane$Płaca,dane$Wykształcenie,p.adj="bonf")
library(ggplot2)
ggplot(dane,aes(y=dane$Płaca,x=dane$Wykształcenie))+geom_boxplot()
# Zbadać, czy poziom wykształcenia i płeć ma wpływ na pensję
temp<-aggregate(dane$Płaca,by=list(Płeć=dane$Płeć,
                                   Wykształcenie=dane$Wykształcenie),FUN=mean)
friedman.test(x~Wykształcenie|Płeć,data=temp)
ggplot(dane,aes(y=dane$Płaca,x=dane$Wykształcenie,fill=dane$Płeć))+
  geom_boxplot()
temp<-aggregate(dane$Płaca,by=list(Wykształcenie=dane$Wykształcenie,
                                   Płeć=dane$Płeć),FUN=mean)
friedman.test(x~Płeć|Wykształcenie,data=temp)
ggplot(dane,aes(y=dane$Płaca,x=dane$Płeć,fill=dane$Wykształcenie))+
  geom_boxplot()
# Zbadać wpływ leku na obniżenie poziomu bólu





