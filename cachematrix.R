
## Write a short comment describing this function: 
#To creates a special "matrix" object that can cache its inverse 

makeCacheMatrix <- function(x = matrix()) {
        inversion<-NULL
        set<-function(y){
                x<<-y
                inversion<<-NULL
        }
        
        get <-function() x
        setInverse<-function(solve)  inversion<<- solve()
        getInverse<-function() inversion
        list(set=set, get=get, setInverse=setInverse, getInverse=getInverse)
}


## Write a short comment describing this function:
##computes the inverse of the special "matrix" returned by makeCacheMatrix above.
#If the inverse has already been calculated (and the matrix has not changed), 
#then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inversion<-x$getInverse()
        if(!is.null(inversion)){
                message('getting cached data')
                return(inversion)
        }
        data<-x$get()
        inversion<-solve()
        x$setInverse(inversion)
}

