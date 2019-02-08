% ECE498, approximate pi by throwing darts at a square dartboard
%
% Consider a square dartboard with each side having dimension equal to 2.
% Centered inside this square place a circle having radius 1.
%
% Now throw N = 1e4 darts at the dartboard in a random fashion so that they
% are uniformly distributed over the surface of the dartboard.
%
% The area of the circle is pi*radius^2. Given a radius of 1, the area of
% the circle is equal to pi.
% The area of the square is 2 * 2 = 4
%
% The ratio of the circle area to the square area is pi/4. If this value is
% multiplied by 4, the result is pi.
%
% Since the darts are uniformly distributed over the dartboard, the ratio
% of the darts that are in the circle to the total number must approximate
% pi/4. So, multiplying this ratio by 4 will give an approximation to pi.

% No For or While loops permitted.
% No extraneous output to the Command Window.

% Cameron, Sullivan (change this line!)
% 2019/01/XX (change XX to the date completed)

% This is NOT a function M-file; it is a script M-file

% Simulate random dart throws.
% Plot square with circle and points for dart throws.
% Plot graph of approximated pi value versus dart number.

% Useful functions: rand, hypot, sum, cumsum, subplot, plot, semilogx, axis, title, xlabel, text, sprintf
close all;

% Plot the randomly generated points on the dartboard.
x_coords = (rand([1 10000]) * 2) - 1;
y_coords = (rand([1 10000]) * 2) - 1;
figure('Position', [10 10 300 300]);
scatter(x_coords, y_coords,'.r');

hold on;

% Plot the circle.
Hrect = rectangle('Position',[-1, -1 2 2],'Curvature',1);
Hrect.LineWidth = 2;
title("N = 10000 Darts");
yticks([-1 -0.5 0 0.5 1]);

% Pi estimation
% Find number of darts in the circle.
% Find number of darts outside the circle.
% Take ratio and multiply by 4.

% Pi estimation plot
% semilogx();
% xlabel("Dart Number");
% title('\pi \approx 3.xxx');