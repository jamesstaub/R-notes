#edx exercise 2.2
#Create a function that takes a vector of numbers and returns the standardized
# values; ie. the data with the mean subtracted and rescaled so that the variance is 1.
x <- c(1:50, 1)

nrmlz<-function(x) { 
  x <- x - mean(x)
  x <- x / sd(x)
  return(x)
}
print(nrmlz(x))

#edx exercise 2.3
func<-function(x) {
  return (3 * sin(x/2) + x)
}

plotFunc<-function(){
  plot(func, -7:7)
}

