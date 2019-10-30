
# Zapis grafki do pliku pdf -----------------------------------------------
library(ggplot2)
pdf("./Dane/grafika.pdf")
grafika <- ggplot(mtcars, aes(wt, mpg)) + geom_point()
print(grafika)
dev.off()

# Zapis grafki do pliku png -----------------------------------------------
png("./Dane/myplot.png")
print(grafika)
dev.off()

# Zapis grafki do plików pdf i jpg z wykorzystaniem ggsave z ggplot2-------
ggplot(mtcars, aes(wt, mpg)) + geom_point()
ggsave("./Dane/wykres.pdf")    #zapis ostatniego wykresu
ggsave("./Dane/wykres.jpg")
