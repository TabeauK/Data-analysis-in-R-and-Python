analiza_plci<-function(Wej){
  dane <- rep(0,3)
  for(i in 1:dim(Wej)[1]){
    if(Wej[i,9]==1){
      dane[1]<- dane[1]+1
    }
    else if(Wej[i,9]==2){
      dane[2]<- dane[2]+1
    }
    else if(Wej[i,9]==0){
      dane[3]<- dane[3]+1
    }
  }
  return(dane)
}
statistic_plci <- function(rok, pora, miesiac, num_miesiac){
  readfile <- "./Zmodyfikowane_dane/NY_"
  readfile <-paste(readfile,rok,sep = "")
  readfile <-paste(readfile,num_miesiac,sep = "")
  readfile <-paste(readfile,".csv",sep = "")
  
  Wej <- read.csv(readfile)
  Wyj<- data.frame(plec= c("mezczyzni","kobiety","niezdefiniowana"),liczba=analiza_plci(Wej), miesiac=rep(miesiac,3))
  
  if(miesiac=="grudzien"){
    rok<-rok+1
  }
  writefile <-"./Analiza/"
  writefile <-paste(writefile,pora,sep = "")
  writefile <-paste(writefile,"/",sep = "")
  writefile <-paste(writefile,rok,sep = "")
  writefile <-paste(writefile,"/plec/statistics_",sep = "")
  writefile <-paste(writefile,miesiac,sep = "")
  writefile <-paste(writefile,".csv",sep = "")
  write.csv(Wyj,writefile, row.names = FALSE)
}
for(i in 1:5){
  statistic_plci(2014+i,"lato","czerwiec","06")
  
  statistic_plci(2014+i,"lato","lipiec","07")
  
  statistic_plci(2014+i,"lato","sierpien","08")
  
  statistic_plci(2014+i,"zima","grudzien","12")
  
  statistic_plci(2015+i,"zima","styczen","01")
  
  statistic_plci(2015+i,"zima","luty","02")
}

