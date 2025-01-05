# Introduction
Integration approximation methods are useful for approximating the value of a definite integral which is difficult to evaluate exactly. I implemented the Riemann sum and Newton-Cotes methods in R. 

# Riemann Sum
The Riemann sum is the simplest method of approximating the value of a definite integral. The Riemann sum is defined as the sum of the areas of n rectangles under the curve of the function f(x) over the interval [a, b]. However, the Riemann sum is not efficient for approximating the value of a definite integral because it requires a large number of rectangles to achieve a reasonable approximation for complicated functions. 

# Newton-Cotes Method
Newton-Cotes is a method that approximates the value of a difficult integral by approximating the complex function with an easy-to-integrate polynomial. Special cases of the Newton-Cotes methods include the midpoint rule and Simpson's rule for one and two points, respectively. The general form of the Newton-Cotes methods is the Lagrange interpolating polynomial method, which uses n points to approximate the value of the definite integral. The value of the integral is approximated by integrating this simpler polynomial analytically. 

The Newton-Cotes methods are more efficient than the Riemann sum for approximating the value of a definite integral, as they require fewer function evaluations to achieve a reasonable approximation. 

