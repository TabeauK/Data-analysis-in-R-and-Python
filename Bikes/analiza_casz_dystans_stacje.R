summer <- lapply(6:8, function(month){
  lapply(2015:2019, function(year){
    read.csv(paste("Zmodyfikowane_dane//NY_",year,"0",month,".csv", sep = ""))
  })
})

winter <- lapply(c("12","01","02"), function(month){
  lapply(2016:2020, function(year){
    path = paste("Zmodyfikowane_dane//NY_",year,month,".csv", sep = "")
    if(month == "12"){
      path = paste("Zmodyfikowane_dane//NY_",year - 1,month,".csv", sep = "")
    }
    x = read.csv(path)
    colnames(x) <- c("tripduration",	"starttime",	"stoptime",	"start.station.id",	"end.station.id",	"bikeid",	"usertype",	"birth.year",	"gender",	"Distance")
    x
  })
})

do_time <- function(vector) {
  vector <- na.omit(vector)
  c(length(vector),
    mean(vector),
    max(vector),
    min(vector),
    length(vector[vector < 600]),
    length(vector[(vector >= 600) & (vector < 3600)]),
    length(vector[(vector >= 3600)]),
    length(vector[vector >= (3600 * 24)]))
}

do_distance <- function(vector) {
  scale <- 84.47
  vector <- na.omit(vector)
  c(length(vector),
    mean(vector) * scale,
    max(vector) * scale,
    min(vector) * scale,
    length(vector[vector * scale < 1]),
    length(vector[(vector * scale >= 1) & (vector * scale < 2)]),
    length(vector[vector * scale >= 2]),
    length(vector[vector * scale >= 10]))
}

Mode <- function(x) {
  ux <- unique(x)
  return(ux[which.max(tabulate(match(x, ux)))])
}

do_stations <- function(df) {
  x <- df$start.station.id
  s1 <- Mode(x)
  s2 <- Mode(x[x!=s1])
  s3 <- Mode(x[(x!=s1) & (x!=s2)])
  
  x <- df$end.station.id
  e1 <- Mode(x)
  e2 <- Mode(x[x!=e1])
  e3 <- Mode(x[(x!=e1) & (x!=e2)])
  
  se1 <- Mode(df[df$start.station.id == s1, 5])
  se2 <- Mode(df[df$start.station.id == s2, 5])
  se3 <- Mode(df[df$start.station.id == s3, 5])
  
  es1 <- Mode(df[df$end.station.id == e1, 4])
  es2 <- Mode(df[df$end.station.id == e2, 4])
  es3 <- Mode(df[df$end.station.id == e3, 4])
  
  cbind(c(s1,s2,s3),c(se1,se2,se3),c(e1,e2,e3),c(es1,es2,es3))
}

main <- function(df, season, month_names, years, create = T) {
  for(j in 1:5){
    try(dir.create(paste("Analiza//",season,"//",years[j],"//czas", sep = "")))
    try(dir.create(paste("Analiza//",season,"//",years[j],"//dystans", sep = "")))
    try(dir.create(paste("Analiza//",season,"//",years[j],"//stacje", sep = "")))
  }
  for(i in 1:3){
    df1 <- unlist(df[i], recursive = F)
    month <- month_names[i]
    print(month)
    for(j in 1:5){
      year <- years[j]
      print(year)
      df2 <- as.data.frame(unlist(df1[j], recursive = F))
      
      time <- rbind(do_time(df2[, 1]),
                    do_time(df2[df2$gender == 1, 1]),
                    do_time(df2[df2$gender == 2, 1]),
                    do_time(df2[df2$gender == 0, 1]))
      rownames(time) <- c("wszyscy","mezczyzni","kobiety","niezdefiniowane")
      colnames(time) <- c("suma","srednia","maksimum","minimum","<10m","10m-1h","1h<","24h<")
      write.csv(time,paste("Analiza//",season,"//",year,"//czas//statistics_",month,".csv", sep = ""))
      
      dist <- rbind(do_distance(df2[, 10]),
                    do_distance(df2[df2$gender == 1, 10]),
                    do_distance(df2[df2$gender == 2, 10]),
                    do_distance(df2[df2$gender == 0, 10])) 
      rownames(dist) <- c("wszyscy","mezczyzni","kobiety","niezdefiniowane")
      colnames(dist) <- c("suma","srednia","maksimum","minimum","<1km","1-2km","2km<","10km<")
      write.csv(dist,paste("Analiza//",season,"//",year,"//dystans//statistics_",month,".csv", sep = ""))
      
      stations <- do_stations(df2)
      colnames(stations) <- c("Najpopularniejsza stacja poczatkowa",
                              "Najpopularniejsza stacja koncowa dla odpowiednich stacji poczatkowych",
                              "Najpopularniejsza stacja koncowa",
                              "Najpopularniejsza stacja poczatkowa dla odpowiednich stacji koncowych")
      rownames(stations) <- c(1,2,3)
      write.csv(stations,paste("Analiza//",season,"//",year,"//stacje//statistics_",month,".csv", sep = ""))
    }
  }
}

main(summer,"lato",c("czerwiec","lipiec","sierpien"),  2015:2019)
print("fall")
main(winter,"zima",c("grudzien","styczen","luty"),  2016:2020)
  