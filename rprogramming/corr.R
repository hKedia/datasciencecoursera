corr <- function(directory, threshold = 0) {
    files_list <- list.files(directory, full.names=TRUE)
    dat <- c()
    for(i in 1:332){
        file <- read.csv(files_list[i])
        nobs <- sum(complete.cases(file))
        if (nobs > threshold){
            value <- cor(file[,"nitrate"], file[,"sulfate"], use="complete.obs")
            dat <- c(dat,value)
        }
    }
    dat
}