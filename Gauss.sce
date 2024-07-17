// Scilab script to verify convergence of 3-point Gauss-Kronrod rule
// Source code was written in Scilab online (https://cloud.scilab.in)
// Author: Mainuddin Alam Irteja 

// Scilab code to represent y = 1/(1 + (x ** 2))
function y = f(x), y = 1/(1 + (x ** 2)) ,endfunction

//true value of integrating y = 1/(1 + (x ** 2)) from -1 to 1.
trueValue = %pi / 2;
initialX = -1;
finalX = 1;
h = finalX - initialX;
//for loop to conduct a number of convergence for the 3-point Gauss Kronrod rule
//first iteration will divide interval to 2 parts, then second iteration will divide interval to 4 parts and so on
for i = 1:5
intervals = 2 ** i;
disp(intervals, "Interval divided into = ");
//reduce the width of the interval
h = h / 2.0;
//get the end-points of each interval
xRange = [initialX:h:finalX]';
//initialize GK3 to 0.0
GK3 = 0.0;
//Define points and weights for a 3-point Gauss-Kronrod rule
xGK3 = [0, -((3/5)**0.5), ((3/5)**0.5)];
wGK3 = [8/9, 5/9, 5/9];
// for loop to get the approximations of each
for j = 1:length(xRange)-1
intervalSum = 0.0;
// for loop to add each newWGK3 * f(newXGK3) to intervalSum
for k = 1:length(xGK3)
newXGK3 = (((xRange(j+1) - xRange(j)) / 2.0) * xGK3(k)) + ((xRange(j) + xRange(j+1)) / 2.0);
newWGK3 = wGK3(k) * ((xRange(j+1) - xRange(j)) / 2.0);
intervalSum = intervalSum + (newWGK3 * f(newXGK3));
end
//add each intervalSum to GK3
GK3 = GK3 + intervalSum;
end
GK3 = GK3
//check the error value and save it in the err(i) vector
errorValue = abs(trueValue - GK3)
err(i) = errorValue;
end
//code for observing error ratio
for i = 1:length(err)-1
errRatio = err(i) / err(i+1)
end
