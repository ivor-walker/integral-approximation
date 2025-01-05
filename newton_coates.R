library(polynom)

#' Example function to integrate
#' @param x numeric vector
#' @return numeric vector
f <- function(x) {
  return(x^3)
}

#' Get the Lagrange polynomial estimate of a function for a set of points
#' @param xs x values
#' @param ys y values
#' @return estimated Lagrange polynomial
lagrange_polynomial_factory <- function(xs, ys) {
  # Check if input lengths match
  if (length(xs) != length(ys)) {
    stop("lagrange: input length mismatch")
  }

  n <- length(xs)

  # For each point, get a basis polynomial
  basis_polynomials <- lapply(1:n, function(i) {
    # For each basis polynomial, get the product of all terms
    product_terms <- lapply(1:n, function(j) {
      # If i == j, return a polynomial of 1
      if (i == j) {
        return(polynomial(1))
      # Otherwise, return a polynomial of (x - xj) / (xi - xj)
      } else {
        numerator <- c(-xs[j], 1)
        return (polynomial(numerator / (xs[i] - xs[j])))
      }
    })
    # Return the product of all terms
    return (Reduce(`*`, product_terms))
  })

  # Coefficient of each polynomial term is y multiplied by the basis polynomial
  terms <- lapply(1:n, function(i) {
    ys[i] * basis_polynomials[[i]]
  })

  # Return final polynomial
  p <- Reduce(`+`, terms)
  return (p)
}

#' Newton-Coates method of integral approximation
#' @param f function to integrate
#' @param lower_lim lower limit of integral
#' @param upper_lim upper limit of integral
#' @param n_x number of points to use
#' @return list with integral value and Lagrange polynomial
#' 
newton_coates <- function(f, lower_lim, upper_lim, n_x) {
  # Midpoint rule: if one point, use midpoint
  if (n_x == 1) {
    midpoint <- (lower_lim + upper_lim) / 2
    x <- c(midpoint)
  # Else, get sequence of x points between lower and upper lim
  } else {
    x <- seq(from = lower_lim, to = upper_lim, length.out = n_x)
  }

  # Calculate f(x)
  fx <- f(x)

  # Get Lagrange polynomial and wrap in a function compatible with integrate
  p <- lagrange_polynomial_factory(x, fx)
  p_function <- function(x) {
    predict(p, x)
  }
  
  # Integrate the polynomial
  integrate_p <- integrate(p_function, lower_lim, upper_lim)
  
  # Return polynomial and integral value
  return(list(
    value = integrate_p$value,
    polynomial = p
  ))
}

# Example usage
newton_coates(f, 0, 1, 3)