actual_year<-2020

analiza_wieku<-function(Wej,aktualny_rok){
  dane <- data.frame(all=rep(0,7),niezdefiniowane=rep(0,7),mezczyzni=rep(0,7),kobiety=rep(0,7))
  for(i in 1:dim(Wej)[1]){
    wiek <-aktualny_rok-Wej[i,8]
    plec <- Wej[i,9]
    if (is.na(Wej[i,8]))
    {
      dane[1,1]<- dane[1,1]+1
      dane[1,plec+2]<- dane[1,plec+2]+1
    }
    else if(wiek>50){
      dane[7,1]<- dane[7,1]+1
      dane[7,plec+2]<- dane[7,plec+2]+1
    }
    else if(wiek<=50 & wiek>=36){
      dane[6,1]<- dane[6,1]+1
      dane[6,plec+2]<- dane[6,plec+2]+1
    }
    else if(wiek<=35 & wiek>=27){
      dane[5,1]<- dane[5,1]+1
      dane[5,plec+2]<- dane[5,plec+2]+1
    }
    else if(wiek<=26 & wiek>=19){
      dane[4,1]<- dane[4,1]+1
      dane[4,plec+2]<- dane[4,plec+2]+1
    }
    else if(wiek<=18 & wiek>=13){
      dane[3,1]<- dane[3,1]+1
      dane[3,plec+2]<- dane[3,plec+2]+1
    }
    else if(wiek<13){
      dane[2,1]<- dane[2,1]+1
      dane[2,plec+2]<- dane[2,plec+2]+1
    }
  }
  return(dane)
}

statistic_wieku <- function(rok, pora, miesiac, num_miesiaca){
  readfile <- "./Zmodyfikowane_dane/NY_"
  readfile <-paste(readfile,rok,sep = "")
  readfile <-paste(readfile,num_miesiaca,sep = "")
  readfile <-paste(readfile,".csv",sep = "")
  
  Wej <- read.csv(readfile)
  if(is.factor(Wej[,8])){
    Wej[,8]<-as.numeric(as.character(Wej[,8]))
  }
  tmp<-analiza_wieku(Wej,actual_year)
  Wyj<- data.frame(wiek= c("Brak","<13","13-18","19-26","27-35","36-50","50<"),liczba=tmp[,1],mezczyzni=tmp[,3],kobiety=tmp[,4],niezdefiniowane=tmp[,2])
  
  if(miesiac=="grudzien"){
    rok<-rok+1
  }
  writefile <-"./Analiza/"
  writefile <-paste(writefile,pora,sep = "")
  writefile <-paste(writefile,"/",sep = "")
  writefile <-paste(writefile,rok,sep = "")
  writefile <-paste(writefile,"/wiek/statistics_",sep = "")
  writefile <-paste(writefile,miesiac,sep = "")
  writefile <-paste(writefile,".csv",sep = "")
  write.csv(Wyj,writefile, row.names = FALSE)
}

for(i in 3:5){
  statistic_wieku(2014+i,"lato","czerwiec","06")
  
  statistic_wieku(2014+i,"lato","lipiec","07")

  statistic_wieku(2014+i,"lato","sierpien","08")

  statistic_wieku(2014+i,"zima","grudzien","12")

  statistic_wieku(2015+i,"zima","styczen","01")

  statistic_wieku(2015+i,"zima","luty","02")
}