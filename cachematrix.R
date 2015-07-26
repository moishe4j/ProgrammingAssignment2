## store a list of functions and then use those functions to  
## check if cached inverted matrix prior to creating the inverted
## matrix to save time

## store a list of functions get, set, setmatrix, getmatrix 

makeCacheMatrix <- function(x = matrix()) { 
        m <- NULL
        set <- function(y) {
                x<<-y
                m<<- NULL
        }
        get<-function() x
        setmatrix<-function(solve) m<<- solve
        getmatrix<-function() m
        list(set = set, get = get, setmatrix = setmatrix,
             getmatrix = getmatrix)
} 


## check if inverted matrix is cache, if TRUE use cached values, if
## FALSE then make the inverted matrix and cache it

cacheSolve <- function(x, ...) { 
        m<-x$getmatrix()
        if(!is.null(m)) {
                message("getting cached matrix")
                solve(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setmatrix(m)
        m
} 
