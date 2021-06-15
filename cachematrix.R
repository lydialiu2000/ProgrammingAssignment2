## Caching the Inverse of a Matrix


## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
        invrs <- NULL
## define the 4 different behaviors or functions for object of type
## makeCacheMatrix as follows:
## 1. set() takes an argument named y or any object name other
## than x. invrs is assumed to be a matrix.
        set <- function(y){
## Use the <<- operator to assign a value to an object in an
## environment that is different from the current environment.
## When set executes, first, this assigns the input argument
## to the x object in the parent environment,
                x <<- y
## and second, this assigns a value of NULL to the invrs object
## in the parent environment.
## this line, clears any value of invrs that had been cached by a
## prior execution of cacheSolve()
                invrs <<- NULL
      }
## 2. getter for the matrix x:
        get <- function()x
## 3 the setter for the inverse invrs
                setinverse <- function(inverse) invrs <<- inverse
## 4 the getter for the inverse invrs
                getinverse <- function()invrs
## Create the new special "matrix" object by returning a list()
## to assign each of these functions as an element within a list ()
## and returns it to the parent environment. Here we're naming the
## list elements, which allows to use the $ form of the extract
## operator to access the functions by name rather than by [[
                list(set = set, get = get,
                     setinverse = setinverse,
                     getinverse = getinverse)
                    
}


## his function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed), 
## then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
## Return a matrix that is the inverse of 'x'
## the function attempts to retrieve an inverse from the matrix
## object passed in as the argument. First, it calls the getinverse()
## function on the input object.
## Return a matrix that is the inverse of 'x'
           invrs <= x$getinverse()
## then it checks to see whether the result is NULL. Since
## makeCacheMatrix() sets the cached inverse to NULL whenever a new
## matrix is set into object, if the value here is not equal to NULL,
## we have a valid, cached inverse and can return it to the parent
## environment
           if(!is.null(invrs)){
                   message("getting cached data")
                   return(invrs)
}
## if the result of !is.null(invrs) is FALSE, cacheSolve() gets the matrix
## from the input object, calculates the solve(), uses the setinverse()
## function on the input object to set the inverse in the input object,
## and then returns the value of the inverse to the parent environment
## by printing the inverse object
        mat <- x$get()
        invrs <- solve(mat,...)
        x$setinverse(invrs)
        invrs
}
