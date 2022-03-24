
k <- (1:20)

print_data <- function(df,name,k) {
  for(j in 1:length(df)) {
    L <- unlist(df[j], recursive = F)
    errors <- lapply(L, function(tab){
      tab$ERR
    })
    errors <- as.data.frame(errors)
    errors <- cbind(errors,k)
    colnames(errors) <- c(funsNames,"k")
    errors <- reshape2::melt(errors, id.vars = "k")
    colnames(errors) <- c("k","Funkcje","ERR")
    g <- ggplot(errors, aes(k,ERR, fill = Funkcje)) + geom_col(position = "dodge") +
      ylim(0,1) + scale_x_discrete(limits = k) + ggtitle(paste("Data frame =[",name,"] L =[",LNames[j],"] ",sep=""))
    print(g)
    
    errors <- lapply(L, function(tab){
      tab$MAD
    })
    errors <- as.data.frame(errors)
    errors <- cbind(errors,k)
    colnames(errors) <- c(funsNames,"k")
    errors <- reshape2::melt(errors, id.vars = "k")
    colnames(errors) <- c("k","Funkcje","MAD")
    g <- ggplot(errors, aes(k,MAD, fill = Funkcje)) + geom_col(position = "dodge") +
      scale_x_discrete(limits = k) + ggtitle(paste("Data frame =[",name,"] L =[",LNames[j],"] ",sep=""))
    print(g)
    
    errors <- lapply(L, function(tab){
      tab$MSE
    })
    errors <- as.data.frame(errors)
    errors <- cbind(errors,k)
    colnames(errors) <- c(funsNames,"k")
    errors <- reshape2::melt(errors, id.vars = "k")
    colnames(errors) <- c("k","Funkcje","MSE")
    g <- ggplot(errors, aes(k,MSE, fill = Funkcje)) + geom_col(position = "dodge") +
      scale_x_discrete(limits = k) + ggtitle(paste("Data frame =[",name,"] L =[",LNames[j],"] ",sep=""))
    print(g)
  }
}

