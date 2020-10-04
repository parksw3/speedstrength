# Units are days

gen <- function(sat, sMean=5, sShape=3
	, step = 0.1, window=200
){
	time <- seq(step, window, by=step)
	d0 <- (
		dgamma(time, shape=sShape, scale=sMean/sShape)
		* time/(time+sat)
	)
	return(data.frame(
		time, density=d0/sum(step*d0)
	))
}
