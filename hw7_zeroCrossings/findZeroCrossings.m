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

% close all;
clc;

% Create an inline function based on Hanselman's function. This can be passed in to fzero().
fun = @zerocrossings;

x1 = linspace(-10, -4.15, 500);
y1 = zerocrossings(x1);
x_discontinuity = linspace(-4.15, -4.1, 1000);
y_discontinuity = zerocrossings(x_discontinuity);
x2 = linspace(-4.1, 10, 500);
y2 = zerocrossings(x2);

xzero(1) = fzero(fun, -4.549);
% fzero() provides the correct x-value, but wrong y-value.
% The y-value seems to be a continuation of the exponential line.
xzero(2) = fzero(fun, -4.124);
xzero(3) = fzero(fun, -3.507);
xzero(4) = fzero(fun, -2.826);
xzero(5) = fzero(fun, 2.385);
xzero(6) = fzero(fun, 3.106);
xzero(7) = fzero(fun, 3.25);
xzero(8) = fzero(fun, 3.828);
xzero(9) = fzero(fun, 5.07)
yzero = zerocrossings(xzero)

subplot(2,1,1);
% plot(x,y);
% scatter(x,y)
x_zero = linspace(-10, 10, 1000);
zero_func = zeros(1000, 1);
plot(x_zero, zero_func, 'k');
hold on;
plot(x_discontinuity, y_discontinuity);
plot(xzero,yzero,'ko');
% plot(x1,y1,'b',x_discontinuity,y_discontinuity,'b',x2,y2,'b',xzero,yzero,'ko')

% subplot(2,1,2);
% plot(xzero,yzero,'o');