% find zero crossings

% your task in this problem is to find all the places in the range
% -10 <= x <= 10 where the function
% ece498function(x) crosses zero.

% gather the zero crossings in a vector named xzero
% evaluate the function at these zero locations
% ###########################################################
% yzero = zerocrossings(xzero)
% ###########################################################

% note that zerocrossings is a p-coded file. e.g., zerocrossing.p. That is
% it has been converted to binary and encrypted. You can't see what is in
% it, but you can evaluate it just like any other function.

% create two subplots
% in subplot(2,1,1) evaluate and plot the function over the given range
% x = linspace(-10,10,500);
% y = zerocrossings(x);
% and mark the zero locations
% plot(x,y,xzero,yzero,'ko')

% in the lower subplot(2,1,2) plot just the zero crossings
% plot(xzero,yzero,'o')

% can you find all the zero crossings?
% how accurately can you find them?

% useful function: fzero

% do your work in this M file.

close all;
clc;

% Find zero crossings
fun = @zerocrossings;

x = linspace(-10,10,500);
zero_func = zeros(500, 1);
y = zerocrossings(x);

xzero(1) = fzero(fun, -4.549);
% This zero crossing is within the only linear region of the graph, caused by a discontinuity in the function!
% Use interpolation to find the equation for the linear region between points.
xi = [-4.148 -4.108];
yinterp = interp1(x,y,xi,'linear');
myFit = polyfit(xi, yinterp, 1);
% Use an anonymous function to find xzero based on the linear interpolation function.
myFunc = @(input) polyval(myFit, input);

subplot(2,1,1);
plot(x, zero_func, 'k');
hold on;
% plot(xi, yinterp, 'linewidth', 2);
% Using interpolation provides the correct x-value, but wrong y-value.
% The y-value seems to be a continuation of the exponential line.
xzero(2) = fzero(myFunc, -4.145);
% Using the regular function provides the incorrect X & Y values.
% xzero(2) = fzero(fun, -4.145);

xzero(3) = fzero(fun, -3.507);
xzero(4) = fzero(fun, -2.826);
xzero(5) = fzero(fun, 2.385);
xzero(6) = fzero(fun, 3.106);
xzero(7) = fzero(fun, 3.828);
xzero(8) = fzero(fun, 5.07)
yzero = zerocrossings(xzero)

% subplot(2,1,1);
% plot(x,y);
% scatter(x,y)
plot(x,y,xzero,yzero,'ko')

% subplot(2,1,2);
% plot(xzero,yzero,'o');