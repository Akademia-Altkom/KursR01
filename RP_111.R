library(ff)
# otwieranie pliku funkcją z biblioteki ff
system.time(dane1 <- read.csv.ffdf(file="./Dane/12 - bigdata.txt",sep=" "))
memory.size()
# sprawdzanie jakiej klasy jest obiekt dane
class(dane1)

library (bigmemory)
library (biganalytics)
# otwieranie pliku funkcją z biblioteki bigmemory
system.time(dane2<-read.big.matrix("./Dane/12 - bigdata.txt",header = F,type = "integer",sep =" ",
                                   backingfile = "bigdata.bin", descriptor = "bigdata.desc",
                                   shared=TRUE))
memory.size()
# informacje doyczące danych
describe(dane2)
# przykładowa operacja - suma, czyli dane są traktowane jak zwykły obiekt R
system.time(print(summary(dane1[,1])))
system.time(print(summary(dane2[,1])))
