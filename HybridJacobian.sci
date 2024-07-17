// Scilab script to implement Hybrid Full/Fixed Jacobian method
// Source code was written in Scilab online (https://cloud.scilab.in)
// Author: Mainuddin Alam Irteja 

// Employ Hybrid Full/Fixed Jacobian iteration to solve
// f_1(x_1, x_2) = x^2_1+ x^2_2- 3=0,
// f_2(x_1, x_2) = x_1^2 +5x_2-6=0, with initial guess [1 1]'
// Set format to show lots of digits
format(25)
mprintf('Displaying inputs\n');
// Set initial guess
x = [1 1]'
true = [1.5855214248505042906601 0.6972243622680053265483]'
// Compute initial error
err = norm(x - true,'inf')
// Perform while loop to compute updates to x using Full Newton's
// method until norm of f = [f1 f2]' is less than tol
tol= 10^(-8)
f = [x(1)^2+x(2)^2-3, x(1)^2+5*x(2)-6]'
fnorm = norm(f,'inf')
// Fixed Jacobian
 J = [2*x(1) 2*x(2)
 2*x(1) 5]
currNorm = fnorm;

// Count number of iterations
mprintf('Displaying onputs\n');
i=0;
while (fnorm > tol)
 prevErr = err;
 i = i+1;
 // Solve J*dx = -f to get Newton correction dx
 dx=J\(-f);
 // Update x
 x = x + dx
 // Compute error
 err = norm(x - true,'inf')
 // Compute convergence
 convergence = err / prevErr
 // Update f
 f = [x(1)^2+x(2)^2-3, x(1)^2+5*x(2)-6]';
 //Update fnorm
 fnorm = norm(f,'inf')

 if (fnorm > (1.0/2.0) * currNorm) then
 J = [2*x(1) 2*x(2)
 2*x(1) 5]
 end
currNorm = fnorm;
end; // while
//display the number of iterations
mprintf('The number of iterations were: ' +  string(i));
