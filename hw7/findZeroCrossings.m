% find zero crossings

% your task in this problem is to find all the places in the range
% -10 <= x <= 10 where the function
% ece498function(x) crosses zero.

% gather the zero crossings in a vector named xzero
% evaluate the function at these zero locations
% yzero = zerocrossings(xzero)

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

