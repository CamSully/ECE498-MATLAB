% testfindpeaks

% create some data
% xaxis data with plenty of data points
x = linspace(0,10,500);

% y axis data is an underdamped sinusoid
y = exp(-x/3).*cos(2*pi*x - pi/2);

% get the maximum peak indices
imax = findpeaks(y);

% get the minimum peak indices
imin = findpeaks(y,'min');

% plot the underdamped sinusoid and the maximum and minimum peaks
plot(x,y,'k',...               % the underdamped sinusoid in black
     x(imax),y(imax),'vr',...  % the maximum peaks marked
     x(imin),y(imin),'^g')     % the minimum peaks marked