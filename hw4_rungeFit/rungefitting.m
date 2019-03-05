%% fitting a polynomial to the runge function
% code section 1

% run this in code sections so you can view each section independent of the
% others

% this is a famous but very simple function
runge = @(x) 1./(1+25*x.^2);

% first evaluate the function between -1 and +1
% single letter variables are fine here since this is a math problem where
% x and y are commonly used for the range and domain of a function
% create some simple data so the runge function can be visualized
x = linspace(-1,1);
y = runge(x);

% make a simple plot of it
plot(x,y)

% label the axis and add a title
xlabel x
ylabel y
title('Runge Function')

% your job is to fit a polynomial to the Runge function using polyfit,
% then evaluate that polynomial at the interpolation data points

xi = linspace(-1,1,1000);

% then compare the polynomial results at these data points to evaluation of
% the function itself.

% here is the evaluation of the Runge function evaluated at xi
yi = runge(xi);

% your goal is to minimize the maximum error between the Runge function
% and the polynomial over the range -1 to +1

% polyfit works like this
% p = polyfit(x,y,n)
% x and y are data points that you get to choose by evaluating y = runge(x)
% n is the degree or order of the polynomial, e.g., n = 2 is a quadratic

% if p = polyfit(x,y,n) is the polynomial returned by polyfit, then the
% evaluation of this polynomial at xi is
% yp = polyval(p,xi)
%
% the error between these two is
% fiterr = yi-yp;
% the maximum absolute error is
% maxfiterr = max(abs(fiterr));

% plot the two interpolations on one subplot and the error on a second
% subplot(2,1,1)
% plot(xi,yi,xi,yp)
% xlabel x
% title('Runge Function and Polynomial Fit')
%
% subplot(2,1,2)
% plot(xi,fiterr)
% xlabel x
% title(['Maximum Polynomial Fitting Error = ' sprintf('%6.4f',maxfiterr)])

%% here is an example trial (Code Section 2)
close all;
% you get to choose the data points x and the polynomial order n

% for N = 26:150
% try these points between -1 and 1
N = 100;
x = linspace(-1,1,N);
y = runge(x);

% try a nth order polynomial
n = 26;
p = polyfit(x,y,n);
% The data points x and polynomial order n are entirely up to you.
% The data points x need not be uniformly distributed between -1 and 1.

% Does the error go down or up if the points are not uniformly distributed?

% Pay attention to any warnings that the function polyfit returns if you
% push it too hard. If polyfit spits out a warning message for some specifc
% case, that solution is not acceptable.

% What is the minimum number of data points N required for a specified
% polynomial order n? What happens if more than the minimum number of data
% points are used?

% evaluate the polynomial at the interpolation points xi
yp = polyval(p,xi);

% compute the error between the runge function and the polynomial fit
fiterr = yi-yp;

% the maximum absolute error is
format long
N
maxfiterr = max(abs(fiterr))
% end

% plot the two interpolations on one subplot and the error on a second
subplot(2,1,1)
plot(xi,yi,xi,yp)
xlabel x
title('Runge Function and Polynomial Fit');
legend('Runge function', 'Polynomial fit');

subplot(2,1,2)
plot(xi,fiterr)
xlabel x
title(sprintf('Maximum Polynomial Fitting Error = %6.4f',maxfiterr))

% what I want to see is five solutions to this problem. Each of them should
% demonstrate something you learned from your choice of data points x and
% polynomial order n. One should be the your best one that minimizes the
% maximum error maxfiterr.

% To create these five solutions simply iterate using this M-file and save
% the graphical results of the ones you want me to see. Then print the
% saved graphics and write on them what you used for data points x in terms
% of the number of points and their distribution over the range -1<=x<=1,
% and note what the polynomial degree or order was.

% So there are 5 sheets of paper stapled together to be turned in.

% This assignment is less about coding in MATLAB and more about fitting
% polynomials to data and getting an understanding of the strengths,
% weaknesses, and considerations that guide curve fitting.

% Fitting data to a polynomial is often done when data is gathered from
% some experiment (rather than simply evaluating a function as we are doing
% here) and there is a desire to represent the data as a function that can
% be manipulated.



