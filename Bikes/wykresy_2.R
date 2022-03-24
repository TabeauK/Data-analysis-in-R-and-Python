library(dplyr)
library(ggplot2)
library(plotly)
library(igraph)


get_data <- function(season, years, month_names, data){
  times <- lapply(years, function(year){
    t <- lapply(month_names, function(month){
      time <- read.csv(paste("Analiza//",season,"//",year,"//",data,"//statistics_",month,".csv", sep = ""))
      cbind(time,month, year)
    })
    bind_rows(t, .id = "column_label")
  })
  times <- bind_rows(times, .id = "column_label2")
  times <- times[,3:length(times)]
  return(times)
}

plot_data <- function(season, year, month, colnames) {
  colnames(season) <- c("gender",colnames,"month","year")
  dff <- season[season$year==year, -(2:5)]
  dff <- dff[dff$month == month, -((length(dff)-2):length(dff))]
  dff <- reshape2::melt(dff,id.vars = "gender")
  colnames(dff) <- c("gender","data","count")
  return(dff)
}

jumbo_plot <- function(season, startyear, month, type, colnames) {
  steps <- list()
  fig <- plot_ly()
  for (i in 1:5) {
    if(type == "time") {
      dff <- plot_data(season,i + startyear - 1, month, colnames)
      
    }else {
      dff <- plot_data(season,i + startyear - 1, month, colnames)
    }
    df <- dff[dff$gender == "mezczyzni",]
    fig <- add_bars(fig, x = df$data, y = df$count, visible = (i==1), 
                    name = "mezczyzni", hoverinfo = 'name', showlegend = T, xaxis = list(title = type), yaxis = "count")
    df <- dff[dff$gender == "kobiety",]
    fig <- add_bars(fig,x=df$data,  y=df$count, visible = (i==1), 
                    name = "kobiety", hoverinfo = 'name', showlegend = T, xaxis = list(title = type), yaxis = "count")
    df <- dff[dff$gender == "niezdefiniowane",]
    fig <- add_bars(fig,x=df$data,  y=df$count, visible = (i==1), 
                    name = "niezdefiniowane", hoverinfo = 'name', showlegend = T, xaxis = list(title = type), yaxis = "count")

    step <- list(args = list('visible', rep(FALSE, 15)),
                 method = 'restyle')
    step$args[[2]][i * 3 - 2] = TRUE
    step$args[[2]][i * 3 - 1] = TRUE
    step$args[[2]][i * 3] = TRUE
    step$label = i + startyear - 1
    steps[[i * 3 - 2]] = step
  }  
  
  # add slider control to plot
  fig <- fig %>%
    layout(sliders = list(list(active = 0,
                               currentvalue = list(prefix = "Rok: "),
                               steps = steps)),
           title = month)
  
  return(fig)
}

table_data <- function(season, years, month_names) {
  data <-  get_data(season,years,month_names, "stacje")
  data <- data[data$X == 1,-1]
  v <- unique(sort(as.vector(unlist(data[,1:4]))))
  n <- length(unique(as.vector(unlist(data[,1:4]))))
  g <- graph.empty (n, directed = T)
  for(i in 1:nrow(data)) {
    x <- data[i,]
    year <- as.numeric(x[6])
    x <- as.numeric(x[1:4])
    if(year==2015){
      g <- add_edges(g, c(which(v == x[1]),which(v == x[2])) , color = "purple")
      g <- add_edges(g, c(which(v == x[3]),which(v == x[4])) , color = "purple")
    } else if(year==2016){
      g <- add_edges(g, c(which(v == x[1]),which(v == x[2])) , color = "blue")
      g <- add_edges(g, c(which(v == x[3]),which(v == x[4])) , color = "blue")
    } else if(year==2017){
      g <- add_edges(g, c(which(v == x[1]),which(v == x[2])) , color = "green")
      g <- add_edges(g, c(which(v == x[3]),which(v == x[4])) , color = "green")
    } else if(year==2018){
      g <- add_edges(g, c(which(v == x[1]),which(v == x[2])) , color = "yellow")
      g <- add_edges(g, c(which(v == x[3]),which(v == x[4])) , color = "yellow")
    } else if(year==2019){
      g <- add_edges(g, c(which(v == x[1]),which(v == x[2])) , color = "orange")
      g <- add_edges(g, c(which(v == x[3]),which(v == x[4])) , color = "orange")
    } else if(year==2020){
      g <- add_edges(g, c(which(v == x[1]),which(v == x[2])) , color = "red")
      g <- add_edges(g, c(which(v == x[3]),which(v == x[4])) , color = "red")
    }
  }
  V(g)$label <- v
  title <- "Najczestsze przejazdy miedzy stacjami w zimie"
  if(season == "lato"){
    title <- "Najczestsze przejazdy miedzy stacjami w lecie"
  }
  l <- layout.fruchterman.reingold(g, niter=500, area=vcount(g)^4*10)
  plot(g, frame = T, layout=l, main =title, edge.arrow.size=0.5, 
       vertex.label.cex=1, 
       vertex.label.family="Helvetica",
       vertex.label.font=2,
       vertex.shape="circle", 
       vertex.size=1, 
       vertex.label.color="black", 
       edge.width=0.5,
       rescale = T)
}


