% ECE 498 - Cameron Sullivan - testfindpeaks.m - script to test findpeaks.m.
% Code originally written by Professor Hanselman.

% My own test case.
% input = [3 3 1 0 1 1 -1 1 -1 -1 -1 -2 0 -1 -1]';
% findpeaks(input,'max')

% create some data
% xaxis data with plenty of data points
x = linspace(0,10,500);

% y axis data is an underdamped sinusoid
y = exp(-x/3).*cos(2*pi*x - pi/2);

% get the maximum peak indices
imax = findpeaks(y,'max');

% get the minimum peak indices
imin = findpeaks(y,'min');

% plot the underdamped sinusoid and the maximum and minimum peaks
plot(x,y,'k',...               % the underdamped sinusoid in black
     x(imax),y(imax),'vr',...  % the maximum peaks marked
     x(imin),y(imin),'^g');    % the minimum peaks marked