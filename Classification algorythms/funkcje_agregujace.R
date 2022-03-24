moda <- function(W) {
  apply(W,1,FUN = function(x){
      if(length(x) == 1) x else {
      ux <- unique(x)
      tab <- tabulate(match(x, ux))
      maxes <- ux[tab == max(tab)]
      maxes <- sample(maxes,1)
    }
  })
}

srednia_a <- function(W)
  apply(W,1, FUN = function(x){
    if(length(x) == 1) x else {
      sample(c(floor(mean(x)), ceiling(mean(x))) ,1)
    }
  })

mediana <- function(W) {
  apply(W,1,FUN =  function(x){
    if(length(x) == 1) x else {
      y <- sort(x)
      sample(c(y[floor(length(y)/2)], y[ceiling(length(y)/2)]) ,1)
    }
  })
}

minkara <- function(W,p) {
  apply(W,1,FUN =  function(x){
    if(length(x) == 1) x else {
      y <- lapply(x, function(z) {
          sum(abs(x-z)**p)
      })
      x[which.min(y)]
    }
  })
}

minkara1.5 <- function(W) {
  minkara(W,1.5)
}

minkara3 <- function(W) {
  minkara(W,3)
}

minkara10 <- function(W) {
  minkara(W,10)
}


srednia_parzytych <- function(W) {
  apply(W,1,FUN =  function(x){
      y <- lapply(x, function(z) { if (z %% 2 == 0) z else 0 })
      y <- unlist(y)
      y <- y[y != 0]
      if(length(y) > 0) {
        sample(c(floor(mean(y)), ceiling(mean(y))) ,1)
      } else 0
  })
}

srednia_nieparzytych <- function(W) {
  apply(W,1,FUN =  function(x){
      y <- lapply(x, function(z) { if (z %% 2 == 1) z else 0 })
      y <- unlist(y)
      y <- y[y != 0]
      if(length(y) > 0) {
        sample(c(floor(mean(y)), ceiling(mean(y))) ,1)
      } else 0
  })
}
