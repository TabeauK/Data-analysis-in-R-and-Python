source("funkcje_agregujace.R")
source("knn.R")
source("bledy.R")

przetworz_1nn <- function(DF, p, FN) {
  range <- 1:nrow(DF)
  X <- as.matrix(DF[,-1])
  y <- DF[range,1]
  w <- knn(X,y,X,1,p)
  w <- FN(w)
  err <- ERR(w, y)
  mad <- MAD(w, y)
  mse <- MSE(w, y)
  W <- c(err,mad,mse)
  out <- t(as.data.frame(W))
  rownames(out) <- NULL
  colnames(out) <- c("ERR","MAD","MSE")
  return(out)
}

przetworz_knn <- function(DF, k, p, FN) {
  splits <- split(1:nrow(DF), cut(seq_along(1:nrow(DF)), 5, labels = FALSE))
  W <- lapply(splits, function(range){
    range <- unlist(range)
    X <- as.matrix(DF[,-1])
    X1 <- X[ -range, ]
    y <- DF[-range,1]
    Z <- X[  range, ]
    
    w <- knn(X1,y,Z,k,p)
    w <- FN(w)
    
    err <- ERR(w, DF[range,1])
    mad <- MAD(w, DF[range,1])
    mse <- MSE(w, DF[range,1])
    c(err,mad,mse)
  })
  out <- as.data.frame((rowSums(as.data.frame(W))/5))
  colnames(out) <- NULL
  rownames(out) <- c("ERR","MAD","MSE")
  return(out)
}

przetworz_test <- function(DF, p, FN) {
  k <- c(1, 3, 5, 7, 9, 11, 13, 15, 17, 19)
  w <- lapply(k, function(K){
    przetworz_knn(DF, K, p, FN)
  })
  w <- as.data.frame(w[1:length(k)])
  w <-rbind(k, w)
  rownames(w)[1] <- "k"
  colnames(w) <- NULL
  return(as.data.frame(t(w)))
}