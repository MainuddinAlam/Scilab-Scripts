// Scilab script to implement a Piecewise Cubic of type "monotone"
// Source code was written in Scilab online (https://cloud.scilab.in)
// Author: Mainuddin Alam Irteja 

//setting global variables
h = 2 * (%pi)
initialX = 0.0;
finalX = h;
//construct polynomial for each data set
for i=1:10
  x = [initialX:h:finalX]';
  y = sin(x);
  derivatives = splin(x, y, "monotone");
  xx = linspace(initialX, finalX, 2**(i-1) + 1);
  yy = interp(xx, x, y, derivatives);
//sample the error at midpoints
for j=1:length(x)-1
  //get the true midpoint value of the subinterval
  midX = (x(j) + x(j+1)) / 2.0;
  trueMidY(j) = sin(midX);
  //get the midpoint value from the interpolated polynomial
  interMidY(j) = interp(midX, x, y, derivatives);
  end;
  //calculate the error
  //infinity norm is used to get the maximum value of the error
  err = trueMidY - interMidY;
  errVal = abs(norm(err, 'inf'))
  if i < 10
  h = h / 2.0
  end;
end;






