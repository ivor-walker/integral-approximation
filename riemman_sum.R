#' Example function to integrate
#' @param x numeric vector
#' @return numeric vector
f <- function(x) {
  return(x^3)
}

#' Calculate Riemman sum of a function
#' @param f function to integrate
#' @param lower_lim lower limit of integral
#' @param upper_lim upper limit of integral
#' @param n_x number of points to use
#' @param calculate_fx whether to calculate f(x) or not
#' @return estimated integral value
riemman <- function(f, lower_lim, upper_lim, n_x = 1000) {
  # Get sequence of x points between lower and upper lim
  x <- seq(from = lower_lim, to = upper_lim, length.out = n_x)
  # Calculate dx (width of each rectangle)
  dx <- diff(x)
  x <- x[-length(x)]

  fx <- f(x)

  # Calculate all rectangle areas
  rectangles <- fx * dx
  # Return sum of rectangle areas
  return(sum(rectangles))
}

# Test the function
riemman(f, 0, 1)
