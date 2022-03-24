#20.05.2020
#Wczytywanie i modyfikacja zbiorów do danych nam potrzebych

###Grudzień
Wej <- read.csv("./Poczatkowe_dane/201512-citibike-tripdata.csv")
Wyj <- Wej[,-c(5:7,9:11)]
Wyj[,10]<-d
colnames(Wyj)[10]<-"Distance"
write.csv(Wyj,"./Zmodyfikowane_dane/NY_201512.csv", row.names = FALSE)

Wej <- read.csv("./Poczatkowe_dane/201612-citibike-tripdata.csv")
Wyj <- Wej[,-c(5:7,9:11)]
Wyj[,10]<-sqrt((Wej[,6]-Wej[,10])^2+(Wej[,7]-Wej[,11])^2)
colnames(Wyj)[10]<-"Distance"
write.csv(Wyj,"./Zmodyfikowane_dane/NY_201612.csv", row.names = FALSE)

Wej <- read.csv("./Poczatkowe_dane/201712-citibike-tripdata.csv")
Wyj <- Wej[,-c(5:7,9:11)]
Wyj[,10]<-sqrt((Wej[,6]-Wej[,10])^2+(Wej[,7]-Wej[,11])^2)
colnames(Wyj)[10]<-"Distance"
write.csv(Wyj,"./Zmodyfikowane_dane/NY_201712.csv", row.names = FALSE)

Wej <- read.csv("./Poczatkowe_dane/201812-citibike-tripdata.csv")
Wyj <- Wej[,-c(5:7,9:11)]
Wyj[,10]<-sqrt((Wej[,6]-Wej[,10])^2+(Wej[,7]-Wej[,11])^2)
colnames(Wyj)[10]<-"Distance"
write.csv(Wyj,"./Zmodyfikowane_dane/NY_201812.csv", row.names = FALSE)

Wej <- read.csv("./Poczatkowe_dane/201912-citibike-tripdata.csv")
Wyj <- Wej[,-c(5:7,9:11)]
Wyj[,10]<-sqrt((Wej[,6]-Wej[,10])^2+(Wej[,7]-Wej[,11])^2)
colnames(Wyj)[10]<-"Distance"
write.csv(Wyj,"./Zmodyfikowane_dane/NY_201912.csv", row.names = FALSE)

###Styczeń
Wej <- read.csv("./Poczatkowe_dane/201601-citibike-tripdata.csv")
Wyj <- Wej[,-c(5:7,9:11)]
Wyj[,10]<-sqrt((Wej[,6]-Wej[,10])^2+(Wej[,7]-Wej[,11])^2)
colnames(Wyj)[10]<-"Distance"
write.csv(Wyj,"./Zmodyfikowane_dane/NY_201601.csv", row.names = FALSE)

Wej <- read.csv("./Poczatkowe_dane/201701-citibike-tripdata.csv")
Wyj <- Wej[,-c(5:7,9:11)]
Wyj[,10]<-sqrt((Wej[,6]-Wej[,10])^2+(Wej[,7]-Wej[,11])^2)
colnames(Wyj)[10]<-"Distance"
write.csv(Wyj,"./Zmodyfikowane_dane/NY_201701.csv", row.names = FALSE)

Wej <- read.csv("./Poczatkowe_dane/201801-citibike-tripdata.csv")
Wyj <- Wej[,-c(5:7,9:11)]
Wyj[,10]<-sqrt((Wej[,6]-Wej[,10])^2+(Wej[,7]-Wej[,11])^2)
colnames(Wyj)[10]<-"Distance"
write.csv(Wyj,"./Zmodyfikowane_dane/NY_201801.csv", row.names = FALSE)

Wej <- read.csv("./Poczatkowe_dane/201901-citibike-tripdata.csv")
Wyj <- Wej[,-c(5:7,9:11)]
Wyj[,10]<-sqrt((Wej[,6]-Wej[,10])^2+(Wej[,7]-Wej[,11])^2)
colnames(Wyj)[10]<-"Distance"
write.csv(Wyj,"./Zmodyfikowane_dane/NY_201901.csv", row.names = FALSE)

Wej <- read.csv("./Poczatkowe_dane/202001-citibike-tripdata.csv")
Wyj <- Wej[,-c(5:7,9:11)]
Wyj[,10]<-sqrt((Wej[,6]-Wej[,10])^2+(Wej[,7]-Wej[,11])^2)
colnames(Wyj)[10]<-"Distance"
write.csv(Wyj,"./Zmodyfikowane_dane/NY_202001.csv", row.names = FALSE)

###Luty
Wej <- read.csv("./Poczatkowe_dane/201602-citibike-tripdata.csv")
Wyj <- Wej[,-c(5:7,9:11)]
Wyj[,10]<-sqrt((Wej[,6]-Wej[,10])^2+(Wej[,7]-Wej[,11])^2)
colnames(Wyj)[10]<-"Distance"
write.csv(Wyj,"./Zmodyfikowane_dane/NY_201602.csv", row.names = FALSE)

Wej <- read.csv("./Poczatkowe_dane/201702-citibike-tripdata.csv")
Wyj <- Wej[,-c(5:7,9:11)]
Wyj[,10]<-sqrt((Wej[,6]-Wej[,10])^2+(Wej[,7]-Wej[,11])^2)
colnames(Wyj)[10]<-"Distance"
write.csv(Wyj,"./Zmodyfikowane_dane/NY_201702.csv", row.names = FALSE)

Wej <- read.csv("./Poczatkowe_dane/201802-citibike-tripdata.csv")
Wyj <- Wej[,-c(5:7,9:11)]
Wyj[,10]<-sqrt((Wej[,6]-Wej[,10])^2+(Wej[,7]-Wej[,11])^2)
colnames(Wyj)[10]<-"Distance"
write.csv(Wyj,"./Zmodyfikowane_dane/NY_201802.csv", row.names = FALSE)

Wej <- read.csv("./Poczatkowe_dane/201902-citibike-tripdata.csv")
Wyj <- Wej[,-c(5:7,9:11)]
Wyj[,10]<-sqrt((Wej[,6]-Wej[,10])^2+(Wej[,7]-Wej[,11])^2)
colnames(Wyj)[10]<-"Distance"
write.csv(Wyj,"./Zmodyfikowane_dane/NY_201902.csv", row.names = FALSE)

Wej <- read.csv("./Poczatkowe_dane/202002-citibike-tripdata.csv")
Wyj <- Wej[,-c(5:7,9:11)]
Wyj[,10]<-sqrt((Wej[,6]-Wej[,10])^2+(Wej[,7]-Wej[,11])^2)
colnames(Wyj)[10]<-"Distance"
write.csv(Wyj,"./Zmodyfikowane_dane/NY_202002.csv", row.names = FALSE)

###Czerwiec
Wej <- read.csv("./Poczatkowe_dane/201506-citibike-tripdata.csv")
Wyj <- Wej[,-c(5:7,9:11)]
Wyj[,10]<-sqrt((Wej[,6]-Wej[,10])^2+(Wej[,7]-Wej[,11])^2)
colnames(Wyj)[10]<-"Distance"
write.csv(Wyj,"./Zmodyfikowane_dane/NY_201506.csv", row.names = FALSE)

Wej <- read.csv("./Poczatkowe_dane/201606-citibike-tripdata.csv")
Wyj <- Wej[,-c(5:7,9:11)]
Wyj[,10]<-sqrt((Wej[,6]-Wej[,10])^2+(Wej[,7]-Wej[,11])^2)
colnames(Wyj)[10]<-"Distance"
write.csv(Wyj,"./Zmodyfikowane_dane/NY_201606.csv", row.names = FALSE)

Wej <- read.csv("./Poczatkowe_dane/201706-citibike-tripdata.csv")
Wyj <- Wej[,-c(5:7,9:11)]
Wyj[,10]<-sqrt((Wej[,6]-Wej[,10])^2+(Wej[,7]-Wej[,11])^2)
colnames(Wyj)[10]<-"Distance"
write.csv(Wyj,"./Zmodyfikowane_dane/NY_201706.csv", row.names = FALSE)

Wej <- read.csv("./Poczatkowe_dane/201806-citibike-tripdata.csv")
Wyj <- Wej[,-c(5:7,9:11)]
Wyj[,10]<-sqrt((Wej[,6]-Wej[,10])^2+(Wej[,7]-Wej[,11])^2)
colnames(Wyj)[10]<-"Distance"
write.csv(Wyj,"./Zmodyfikowane_dane/NY_201806.csv", row.names = FALSE)

Wej <- read.csv("./Poczatkowe_dane/201906-citibike-tripdata.csv")
Wyj <- Wej[,-c(5:7,9:11)]
Wyj[,10]<-sqrt((Wej[,6]-Wej[,10])^2+(Wej[,7]-Wej[,11])^2)
colnames(Wyj)[10]<-"Distance"
write.csv(Wyj,"./Zmodyfikowane_dane/NY_201906.csv", row.names = FALSE)

###Lipiec
Wej <- read.csv("./Poczatkowe_dane/201507-citibike-tripdata.csv")
Wyj <- Wej[,-c(5:7,9:11)]
Wyj[,10]<-sqrt((Wej[,6]-Wej[,10])^2+(Wej[,7]-Wej[,11])^2)
colnames(Wyj)[10]<-"Distance"
write.csv(Wyj,"./Zmodyfikowane_dane/NY_201507.csv", row.names = FALSE)

Wej <- read.csv("./Poczatkowe_dane/201607-citibike-tripdata.csv")
Wyj <- Wej[,-c(5:7,9:11)]
Wyj[,10]<-sqrt((Wej[,6]-Wej[,10])^2+(Wej[,7]-Wej[,11])^2)
colnames(Wyj)[10]<-"Distance"
write.csv(Wyj,"./Zmodyfikowane_dane/NY_201607.csv", row.names = FALSE)

Wej <- read.csv("./Poczatkowe_dane/201707-citibike-tripdata.csv")
Wyj <- Wej[,-c(5:7,9:11)]
Wyj[,10]<-sqrt((Wej[,6]-Wej[,10])^2+(Wej[,7]-Wej[,11])^2)
colnames(Wyj)[10]<-"Distance"
write.csv(Wyj,"./Zmodyfikowane_dane/NY_201707.csv", row.names = FALSE)

Wej <- read.csv("./Poczatkowe_dane/201807-citibike-tripdata.csv")
Wyj <- Wej[,-c(5:7,9:11)]
Wyj[,10]<-sqrt((Wej[,6]-Wej[,10])^2+(Wej[,7]-Wej[,11])^2)
colnames(Wyj)[10]<-"Distance"
write.csv(Wyj,"./Zmodyfikowane_dane/NY_201807.csv", row.names = FALSE)

Wej <- read.csv("./Poczatkowe_dane/201907-citibike-tripdata.csv")
Wyj <- Wej[,-c(5:7,9:11)]
Wyj[,10]<-sqrt((Wej[,6]-Wej[,10])^2+(Wej[,7]-Wej[,11])^2)
colnames(Wyj)[10]<-"Distance"
write.csv(Wyj,"./Zmodyfikowane_dane/NY_201907.csv", row.names = FALSE)

###Sierpień
Wej <- read.csv("./Poczatkowe_dane/201508-citibike-tripdata.csv")
Wyj <- Wej[,-c(5:7,9:11)]
Wyj[,10]<-sqrt((Wej[,6]-Wej[,10])^2+(Wej[,7]-Wej[,11])^2)
colnames(Wyj)[10]<-"Distance"
write.csv(Wyj,"./Zmodyfikowane_dane/NY_201508.csv", row.names = FALSE)

Wej <- read.csv("./Poczatkowe_dane/201608-citibike-tripdata.csv")
Wyj <- Wej[,-c(5:7,9:11)]
Wyj[,10]<-sqrt((Wej[,6]-Wej[,10])^2+(Wej[,7]-Wej[,11])^2)
colnames(Wyj)[10]<-"Distance"
write.csv(Wyj,"./Zmodyfikowane_dane/NY_201608.csv", row.names = FALSE)

Wej <- read.csv("./Poczatkowe_dane/201708-citibike-tripdata.csv")
Wyj <- Wej[,-c(5:7,9:11)]
Wyj[,10]<-sqrt((Wej[,6]-Wej[,10])^2+(Wej[,7]-Wej[,11])^2)
colnames(Wyj)[10]<-"Distance"
write.csv(Wyj,"./Zmodyfikowane_dane/NY_201708.csv", row.names = FALSE)

Wej <- read.csv("./Poczatkowe_dane/201808-citibike-tripdata.csv")
Wyj <- Wej[,-c(5:7,9:11)]
Wyj[,10]<-sqrt((Wej[,6]-Wej[,10])^2+(Wej[,7]-Wej[,11])^2)
colnames(Wyj)[10]<-"Distance"
write.csv(Wyj,"./Zmodyfikowane_dane/NY_201808.csv", row.names = FALSE)

Wej <- read.csv("./Poczatkowe_dane/201908-citibike-tripdata.csv")
Wyj <- Wej[,-c(5:7,9:11)]
Wyj[,10]<-sqrt((Wej[,6]-Wej[,10])^2+(Wej[,7]-Wej[,11])^2)
colnames(Wyj)[10]<-"Distance"
write.csv(Wyj,"./Zmodyfikowane_dane/NY_201908.csv", row.names = FALSE)
