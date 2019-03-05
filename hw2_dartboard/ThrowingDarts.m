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
% 2019/02/08 (change XX to the date completed)

% This is NOT a function M-file; it is a script M-file

% Simulate random dart throws.
% Plot square with circle and points for dart throws.
% Plot graph of approximated pi value versus dart number.

% Useful functions: rand, hypot, sum, cumsum, subplot, plot, semilogx, axis, title, xlabel, text, sprintf
close all;
num_points = 10000;

% Plot the randomly generated points on the dartboard.
subplot(1,2,1);
x_coords = (rand([1 num_points]) * 2) - 1;
y_coords = (rand([1 num_points]) * 2) - 1;
scatter(x_coords, y_coords,15,'.r');



% Plot the circle.
Hrect = rectangle('Position',[-1, -1 2 2],'Curvature',1);
Hrect.LineWidth = 2;
title("N = 10000 Darts");
% Set up the axis ticks to match the example results.
xticks([-1 -0.5 0 0.5 1]);
yticks([-1 -0.5 0 0.5 1]);
% Make the dartboard square to match the example dartboard.
axis square;



% Pi estimation algorithm.
% Calculate the radius between each point and the origin.
radius = hypot(x_coords, y_coords);
% Create an array of booleans showing if each point is in the circle (1) or outside the circle (0).
in_circle = radius <= 1;
% Use a cumulative sum to show the number of points in the circle from index 1 to n.
num_in_circle = cumsum(in_circle);
% Find the ratio of the number of points in the circle to the total number of points (represented by the index number).
ratio = num_in_circle ./ (1:num_points);
% The ideal ratio of points is pi/4, so multiply by 4 to estimate pi.
pi_estimate = ratio * 4;



% Pi estimation plot
subplot(1,2,2);
% Plot the pi estimate versus index and a horizontal line showing pi.
semilogx(1:num_points, pi_estimate, [1,num_points], [pi, pi],'k');

% Set axis limits to match the example plot.
xlim([20 num_points]);
ylim([2.5 3.5]);

% Plot the pi symbol with the horizontal line as a label.
text(num_points + 300, pi, '\pi','fontsize',12);
xlabel("Dart Number");
% Generate a title string with the final estimate value of pi.
graph_title = sprintf('\\pi \\approx %.4f', pi_estimate(num_points));
title(graph_title);