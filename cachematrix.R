## Put comments here that give an overall description of what your
## functions do
## Both functions are used to compute inverse of the matrix and store it in the object. It can be used again from cache without the need for computing it again.
## Write a short comment describing this function

## makeCache Matrix is used to create the necessary get and set functions. It also used to initialize variables.
makeCacheMatrix <- function(x = matrix()) {
	invMat<- NULL 
	##Initially invMat is set to null
	set<-function(y){
		x<<-y
		invMat<<-NULL 
		## From the example given, I ascertained that set is one of the functions that makeCacheMatrix Object must have. Here x is assigned new value by y and invMat(the inverse) has to be calculated again for new matrix. So it is set to NULL.
	}
	get <- function() x
	## get function to return data
	setInv <- function(Inv) invMat <<- Inv
	## set Inverse for the matrix
	getInv <- function() invMat
	## get Inverse for the matrix. This function is used in cacheSolve
	list(set=set,get=get,setInv=setInv,getInv=getInv)
}


## Write a short comment describing this function
##cacheSolve is used to compute and store the inverse. It also checks for already computed inverse and retrieves it.
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
		invMat <- x$getInv()
		## getInv is called to get the Inverse of the matrix if it is already computed.
		if(!is.null(invMat)){
			## If it is already computed, it won't have the value NULL set before.
			message("Getting Inverse")
			return(objInv)
			## The inverse is returned and the function ends here
		}
		## What follows is the else part
		toInvert<- x$get()
		invMat <- solve(toInvert)
		## solve function as mentioned in the assignment page to compute inverse
		x$setInv(invMat)
		## after computing storing inverse of the matrix 
}
