
gc(reset=T)
start<-proc.time()
mydata<-read.table("./Dane/12 - bigdata.txt",header=T)
end<-proc.time()
gc()
total<-end-start
total[3]
# bigmemory
gc(reset=T)
start<-proc.time()
mydata<-read.big.matrix("./Dane/12 - bigdata.txt",header = F,type = "integer",sep =   
                          " ",backingfile = "bigdata.bin", descriptor = "bigdata.desc",  
                        ,shared=TRUE)
describe(mydata)
summary(mydata)
mean(mydata[,1])

end<-proc.time()
gc()
total<-end-start
total[3]
mean(mydata[mwhich(mydata,"customer",1,"eq"),3])
sort(unique(mydata[,2]))
model<-bigglm.big.matrix(ratings~customer,data=mydata,fc="customer")
# optymalizacja wybranych elementów
gc(reset=T)
wybrane<-which(mydata[,"customer"]==1)
gc()
gc(reset=T)
wybrane<-mwhich(mydata,"customer",1,"eq")
gc()
