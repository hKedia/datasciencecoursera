## makeCacheMatrix() has four functions get, setinverse, getinverse, set
## when a makeCacheMatrix() is called and assigned to a variable with appropriate data, the variable(say x) now has all four functions
## set() ad get() used to set inverse value and get variable's value respectively
## cacheSolve() first tries to retrive inverse from cache, if not presen then calculate it and set the new inverse.

## this function sets inverse initially to null
## set <- sets the new data nad resets the inverse to null
## get <- gets the data
## setinverse <- to set the inverse of matrix
## getinverse <- retriving inverse of matrix

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setinverse <- function(solve) m <<- solve
    getinverse <- function() m
    list(set=set, get=get, setinverse=setinverse,getinverse=getinverse)
}


## First it tries to get inverse from cache
## if inverse not null then then display it otherwise, calculate new inverse
## after calculating the inverse, setting the variable with this new inverse

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    m <- x$getinverse()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data)
    x$setinverse(m)
    m
}
