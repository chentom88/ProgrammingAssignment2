## This function creates a special 'matrix' that 
## can cache it's inverse matrix after the first
## time the inverse is computed
makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    
    set <- function(y) {
        x <<- y
        i <<- NULL
    }
    get <- function() x

    setInverse <- function(inv) i <<- inv
    getInverse <- function() i

    list(set=set, get=get,
         setInverse=setInverse,
         getInverse=getInverse
    )
}

## This function will calculate the inverse of
## any special 'matrix' created by the
## makeCacheMatrix function. It will return the cached
## inverse if the inverse has already been computed
## for that particular 'matrix'
cacheSolve <- function(x, ...) {
    i <- x$getInverse()
    if (!is.null(i)) {
        message("getting cached inverse")
        return(i)
    }

    data <- x$get()
    i <- solve(data, ...)
    x$setInverse(i)
    i
}
