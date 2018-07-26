## Test harness for the makeCacheMatrix
## and cacheSolve functions. Must source
## cachematrix.R for this function to work
testCacheMatrix <- function() {
    mtx <- matrix(rexp(100), ncol=10)
    
    message("original matrix")
    print(mtx)
    cat('\n')
    
    sut <- makeCacheMatrix(mtx)
    
    # Calculate for first time
    message("initial solve")
    cacheSolve(sut)
    print(sut$getInverse())
    cat('\n')
    
    # Now get cached
    cacheSolve(sut)
}