complete <- function(directory, id = 1:332) {
    files_list <- list.files(directory, full.names=TRUE)
    dat <- data.frame(id=numeric(), nobs=character())  
    for(i in seq_along(id)){
        file <- read.csv(files_list[id[i]])
        nobs <- sum(complete.cases(file))
        dat <- rbind(dat, c(id[i],nobs))
    }
    colnames(dat) <- c("id", "nobs")
    print(dat)
}