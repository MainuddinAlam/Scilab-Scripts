// Scilab script to implement 3-point Gauss-Kronrod rule
// Source code was written in Scilab online (https://cloud.scilab.in)
// Author: Mainuddin Alam Irteja

// Scilab code to represent y = 1/(1 + (x ** 2))
function y = f(x), y = 1/(1 + (x ** 2)) ,endfunction

//true value of integrating y = 1/(1 + (x ** 2)) from -1 to 1.
trueValue = %pi / 2;

// Define points and weights for a 3-point Gauss-Kronrod rule
xGK3 = [0, -((3/5)**0.5), ((3/5)**0.5)];
wGK3 = [8/9, 5/9, 5/9];

// Compute 1-point Gauss rule
G1 = 2 * f(0)
// Compute 3-point Gauss-Kronrod rule
GK3 = wGK3(1)*f(xGK3(1)) + wGK3(2)*f(xGK3(2)) + wGK3(3)*f(xGK3(3))

// Error between G1 and true value
errorOfG1 = abs(trueValue - G1)

// Error between GK3 and true value
errorOfGK3 = abs(trueValue - GK3)

// Error estimate G1 and GK3
errorOfApproximations = abs(G1 - GK3)

