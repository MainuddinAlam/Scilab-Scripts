// Scilab script to implement Standard Lagrange Interpolant with uniform points
// Source code was written in Scilab online (https://cloud.scilab.in)
// Author: Mainuddin Alam Irteja (A00446752)

// Construct standard Lagrange interpolant to data set x = [-1.0, -4.0/5.0, -3.0/5.0,
// -2.0/5.0, -1.0/5.0, 0, 1.0/5.0, 2.0/5.0, 3.0/5.0, 4.0/5.0, 1.0],
// y = {y = 1/(1 + 25*x.^2)}, i=1,...,11. Plot interpolant on a fine grid over [-1.0,1.0].
// Also plot the function over this range. On a second plot, plot error of the interpolant
x = [-1.0, -4.0/5.0, -3.0/5.0, -2.0/5.0, -1.0/5.0, 0, 1.0/5.0, 2.0/5.0, 3.0/5.0, 4.0/5.0, 1.0]';
y = 1 ./(1 + 25*x.^2);
// Since this is a standard Lagrange interpolant the only preprocessing is
// to precompute the z_j = y_j/w_j values where w_j is the denominator of
// the jth Lagrange basis polynomial
for j = 1:11
 wprod = 1;
 for i=1:11
 if i <> j then 
 wprod = wprod*(x(j)-x(i)); 
 end;
 z(j) = y(j)/wprod;
 end;
end;
xeval = [-1.0:0.01:1.0]';
true = 1 ./(1 + 25*(xeval).^2);
// For each element of xeval, compute the corresponding Lagrange interpolant value
for j=1:length(xeval)
 // Evaluate the Lagrange interpolant at xeval(j)
 psum = 0.0;
 for i = 1:11
 // Evaluate l_i, the ith Lagrange basis polynomial, at xeval(j) and contribute
 // the product of z_i*l_i to p_j to psum
 pprod = 1;
 for k = 1:11
 if i <> k then 
 pprod = pprod*(xeval(j)-x(k));
 end; 
 end;
 psum = psum + z(i)*pprod;
 end;
 p(j) = psum;
end;
// Use this next statement to plot the interpolant and the exact function
plot(xeval,p, "blue",xeval,true, "red")
//calculate error
e = abs(p-true);
// Use this next statement to plot the error of the interpolant
plot(xeval,e,"green")
//set title of plot
title("Runge function (Red), Lagrange Polynomial (Blue) and the Error Plot (Green)");

