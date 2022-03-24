library(dplyr)

knn <- function(X, y, Z, k, p = 2) {
  stopifnot(is.matrix(X) & is.numeric(X))
  stopifnot(ncol(X) > 0 & nrow(X) > 0)
  stopifnot(is.numeric(y))
  stopifnot(length(y) > 0)
  stopifnot(nrow(X) == length(y))
  stopifnot(is.matrix(Z) & is.numeric(Z))
  stopifnot(ncol(Z) > 0 & nrow(Z) > 0)
  stopifnot(is.numeric(k) & length(k) == 1 & 0 < k & k <= nrow(X))
  stopifnot(is.numeric(p) & length(p) == 1 & 0 < p)
  
  X <- as.data.frame(X)
  
  w <- apply(Z,1, function(z){
    dist <- apply(X,1,function(w) {MinkowskyDistance(z,w,p)}) 
    X2 <- X
    X2 <- cbind(X2, dist)
    X2 <- cbind(X2, y)
    X2 %>% top_n(-k,dist) -> X2
    X2 <- X2[order(X2$dist, decreasing = FALSE), ]
    head(X2$y,k)
  })
  if(k == 1) return(as.matrix(w)) else return(t(as.matrix(w)))
}

MinkowskyDistance <- function(x, y, p) {
  stopifnot(is.numeric(x) & length(x) > 0)
  stopifnot(is.numeric(y) & length(y) > 0)
  
  if(is.infinite(p)) max(abs(x-y)) else {
    sum(abs(x - y)**p)**(1/p)
  }
}
