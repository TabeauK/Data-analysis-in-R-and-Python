source("funkcje_agregujace.R")
source("bledy.R")

library(randomForest)

przetworz_randomrainforest <- function(DF) {
  splits <- split(1:nrow(DF), cut(seq_along(1:nrow(DF)), 5, labels = FALSE))
  W <- lapply(splits, function(range){
    range <- unlist(range)
    X <- as.matrix(DF[,-1])
    X1 <- X[ -range, ]
    y <- DF[-range,1]
    Z <- X[  range, ]

    w <- randomForest(x = Z,y = DF[range,1], xtest = X1, ytest = y) 
    w <- round(w$predicted)
    
    err <- ERR(w, DF[range,1])
    mad <- MAD(w, DF[range,1])
    mse <- MSE(w, DF[range,1])
    c(err,mad,mse)
  })
  out <- t(as.data.frame(rowSums(as.data.frame(W))/5))
  rownames(out) <- NULL
  colnames(out) <- c("ERR","MAD","MSE")
  return(out)
}

library(MASS)

przetworz_polr <- function(DF) {
  splits <- split(1:nrow(DF), cut(seq_along(1:nrow(DF)), 5, labels = FALSE))
  W <- lapply(splits, function(range){
    range <- unlist(range)
    
    df <- DF[-range, ]
    z <- DF[range, ]
    
    w <- MASS::polr(as.factor(response) ~  ., data = df)
    w <- as.numeric(predict(w, z[,-1]))
    
    err <- ERR(w, z[,1])
    mad <- MAD(w, z[,1])
    mse <- MSE(w, z[,1])
    c(err,mad,mse)
  })
  out <- t(as.data.frame(rowSums(as.data.frame(W))/5))
  rownames(out) <- NULL
  colnames(out) <- c("ERR","MAD","MSE")
  return(out)
}

przetworz_polr(glass)

library(class)

przetworz_class_knn <- function(DF) {
  splits <- split(1:nrow(DF), cut(seq_along(1:nrow(DF)), 5, labels = FALSE))
  W <- lapply(splits, function(range){
    range <- unlist(range)
    X <- as.matrix(DF[,-1])
    X1 <- X[ -range, ]
    y <- DF[-range,1]
    Z <- X[  range, ]
    
    w <- class::knn(X1,Z, cl = y, k = 20)
    w <- as.integer(as.vector(w))
    
    err <- ERR(w, DF[range,1])
    mad <- MAD(w, DF[range,1])
    mse <- MSE(w, DF[range,1])
    c(err,mad,mse)
  })
  out <- t(as.data.frame(rowSums(as.data.frame(W))/5))
  rownames(out) <- NULL
  colnames(out) <- c("ERR","MAD","MSE")
  return(out)
}



