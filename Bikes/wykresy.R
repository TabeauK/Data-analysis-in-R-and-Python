#biblioteki
library(dplyr)
library(ggplot2)
library(vctrs)
library(plotly)

#Funkcje pomocnicze
plot_plec<-function(rok){
  readSummer <- "./Analiza/lato/"
  readWinter <- "./Analiza/zima/"
  readSummer <-paste(readSummer,rok,sep = "")
  readWinter <-paste(readWinter,rok+1,sep = "")
  
  readJune <-paste(readSummer,"/plec/statistics_czerwiec.csv",sep = "")
  readJuly <-paste(readSummer,"/plec/statistics_lipiec.csv",sep = "")
  readAugust <-paste(readSummer,"/plec/statistics_sierpien.csv",sep = "")
  
  readDecember <-paste(readWinter,"/plec/statistics_grudzien.csv",sep = "")
  readJanuary <-paste(readWinter,"/plec/statistics_styczen.csv",sep = "")
  readFebruary <-paste(readWinter,"/plec/statistics_luty.csv",sep = "")
  
  june<-read.csv(readJune)
  july<-read.csv(readJuly)
  august<-read.csv(readAugust)
  
  december<-read.csv(readDecember)
  january<-read.csv(readJanuary)
  february<-read.csv(readFebruary)
  
  Wyj<- rbind(june,july,august,december,january,february)
  return(Wyj)
}
plot_wiek<-function(rok,miesiac, pora){
  readfile <- "./Analiza/"
  readfile <-paste(readfile,pora,sep = "")
  readfile <-paste(readfile,"/",sep = "")
  readfile <-paste(readfile,rok,sep = "")
  
  readfile <-paste(readfile,"/wiek/statistics_",sep = "")
  readfile <-paste(readfile,miesiac,sep = "")
  readfile <-paste(readfile,".csv",sep = "")
  
  sd<- read.csv(readfile)
  tmp <- sd[,c(1,3)]
  tmp[,3]<-"mezczyzni"
  colnames(tmp)[2]<-"liczba"
  colnames(tmp)[3]<-"plec"
  tmpX<-tmp
  tmp <- sd[,c(1,4)]
  tmp[,3]<-"kobiety"
  colnames(tmp)[2]<-"liczba"
  colnames(tmp)[3]<-"plec"
  tmpX<-rbind(tmpX,tmp)
  tmp <- sd[,c(1,5)]
  tmp[,3]<-"niezdefiniowane"
  colnames(tmp)[2]<-"liczba"
  colnames(tmp)[3]<-"plec"
  tmpX<-rbind(tmpX,tmp)
  return(tmpX)
}

#wykres płci
plots_plec <- function(){
  
  steps <- list()
  fig <- plot_ly()
  
  for (i in 1:5) {
    dff <- plot_plec(2014+i)
    df <- dff[dff$gender == "mezczyzni",]
    fig <- add_bars(fig, x = df$miesiac, y = df$liczba, visible = (i==1), 
                    name = "mezczyzni", hoverinfo = 'name', showlegend = T, xaxis = "miesiac", yaxis = "liczba")
    df <- dff[dff$gender == "kobiety",]
    fig <- add_bars(fig,x=df$miesiac,  y=df$liczba, visible = (i==1), 
                    name = "kobiety", hoverinfo = 'name', showlegend = T, xaxis = "miesiac", yaxis = "liczba")
    df <- dff[dff$gender == "niezdefiniowana",]
    fig <- add_bars(fig,x=df$miesiac,  y=df$liczba, visible = (i==1), 
                    name = "niezdefiniowana", hoverinfo = 'name', showlegend = T, xaxis = "miesiac", yaxis = "liczba")
    
    step <- list(args = list('visible', rep(FALSE, 15)),
                 method = 'restyle')
    step$args[[2]][i * 3 - 2] = TRUE
    step$args[[2]][i * 3 - 1] = TRUE
    step$args[[2]][i * 3] = TRUE
    step$label = i + 2014
    steps[[i * 3 - 2]] = step
  }  
  # add slider control to plot
  fig <- fig %>%
    layout(sliders = list(list(y=-0.05,active = 0,
                               currentvalue = list(prefix = "Year: "),
                               steps = steps)),
           updatemenus = list(
             list(
               y = 0.5,
               x = -0.2,
               buttons = list(
                 list(method = "restyle",
                      args = list("type", "bar"),
                      label = "Bars"),
                 
                 list(method = "restyle",
                      args = list("type", "scatter"),
                      label = "Scatters")
               )
             )
           ),
           title = "Plec"
    )
  
  return(fig)
}
plots_plec()

#wykres wieku

plots_wiek<-function(rok,miesiac,pora){
  steps <- list()
  fig <- plot_ly()
  for (i in 1:5) {
    dff <- plot_wiek(rok+i, miesiac,pora)
    df <- dff[dff$plec == "mezczyzni",]
    fig <- add_bars(fig, x = df$wiek, y = df$liczba, visible = (i==1), 
                    name = "mezczyzni", hoverinfo = 'name', showlegend = T, xaxis = "miesiac", yaxis = "liczba")
    df <- dff[dff$plec == "kobiety",]
    fig <- add_bars(fig,x=df$wiek,  y=df$liczba, visible = (i==1), 
                    name = "kobiety", hoverinfo = 'name', showlegend = T, xaxis = "miesiac", yaxis = "liczba")
    df <- dff[dff$plec == "niezdefiniowane",]
    fig <- add_bars(fig,x=df$wiek,  y=df$liczba, visible = (i==1), 
                    name = "niezdefiniowana", hoverinfo = 'name', showlegend = T, xaxis = "miesiac", yaxis = "liczba")
    
    step <- list(args = list('visible', rep(FALSE, 15)),
                 method = 'restyle')
    step$args[[2]][i * 3 - 2] = TRUE
    step$args[[2]][i * 3 - 1] = TRUE
    step$args[[2]][i * 3] = TRUE
    step$label = i + rok
    steps[[i * 3 - 2]] = step
  }  
  # add slider control to plot
  fig <- fig %>%
    layout(sliders = list(list(active = 0,
                               currentvalue = list(prefix = "Year: "),
                               steps = steps)),
           updatemenus = list(
             list(
               y = 0.5,
               x = -0.2,
               buttons = list(
                 list(method = "restyle",
                      args = list("type", "bar"),
                      label = "Bars"),
                 
                 list(method = "restyle",
                      args = list("type", "scatter"),
                      label = "Scatters")
               )
             )
           ),
           title = miesiac
    )
  
  return(fig)
  
}

plots_wiek(2014,"czerwiec","lato")
plots_wiek(2014,"lipiec","lato")
plots_wiek(2014,"sierpien","lato")

plots_wiek(2015,"grudzien","zima")
plots_wiek(2015,"styczen","zima")
plots_wiek(2015,"luty","zima")



###Koniec