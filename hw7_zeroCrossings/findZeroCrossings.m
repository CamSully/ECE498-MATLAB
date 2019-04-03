% ECE 498 - Cameron Sullivan - HW7 findZeroCrossings.m
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



% Create an inline function based on Hanselman's function. This can be passed in to fzero().
fun = @zerocrossings;

x = zeros(2000, 1);
% Make the first 500 points of x from -10 to -4.15, and the last 500 points from -4.1 to 10.
% "Zoom in" on the discontinuity by taking 1,000 points on the rough interval of the discontinuity.
x = [linspace(-10, -4.15, 500) linspace(-4.15, -4.1, 1000) linspace(-4.1, 10, 500)];
y = zerocrossings(x);

% Find zero crossings using fzero().
% I visually approximated the rough location of each zero.
xzero = zeros(9, 1);
xzero(1) = fzero(fun, -4.549);
% For the second zero: fzero() provides a close x-value (off by only 0.00001), but the wrong y-values.
% This is caused by the discontinuity. The function cannot possibly evaluate to zero at the discontinuity.
xzero(2) = fzero(fun, -4.124);
xzero(3) = fzero(fun, -3.507);
xzero(4) = fzero(fun, -2.826);
xzero(5) = fzero(fun, 2.385);
xzero(6) = fzero(fun, 3.106);
xzero(7) = fzero(fun, 3.25);
xzero(8) = fzero(fun, 3.828);
xzero(9) = fzero(fun, 5.07)

yzero = zerocrossings(xzero)

% First subplot: zerocrossings function, zero-crossing points approximated by fzero().
subplot(2,1,1);
% scatter(x,y);
plot(x,y, xzero,yzero,'ko','linewidth',2);
set(gca, 'fontsize', 20);
grid on;
title('Zerocrossings Function & Approximated Zero Crossings');
ylabel('Y');
xlabel('X');

% Second subplot: only the fzero() approximated zero-crossings.
subplot(2,1,2);
plot(xzero, yzero, 'k.', 'markersize', 25);
grid on;
set(gca, 'fontsize', 20);
title('Approximated Zero Crossings');
ylabel('Y');
xlabel('X');
xlim([-10 10]);
ylim([-0.25 1.5]);