ERR <- function(W,yz) {
  diff <- (W - yz)
  length(diff[diff != 0])/ length(diff)
}

MAD <- function(W,yz) {
  sum(abs(yz - W)) / length(W)
}

MSE <- function(W,yz) {
  sum(abs(yz - W)**2) / length(W)
}