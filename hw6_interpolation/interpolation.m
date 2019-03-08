% exploring interpolation in MATLAB

% function to be used, an underdamped sinusoid
ece498fun = @(x) exp(-x/3).*cos(2*pi*x - pi/2);

%% first take a look at the function

% x axis data points
x = linspace(0,10,75);

% evaluate function
y = ece498fun(x);

% plot it
plot(x,y)
title 'Basic Function'

% the plot is choppy since too few data points have been used.

%% Assume that this data comes from some experiment and no other
% data is available to describe the function between the data points above

% Use interpolation to make guesses of what the function looks like between
% the data points

% Use these x axis data points to get guesses of what the function looks
% like between the given initial data points
xi = linspace(0,10,500);

% To see how good the interpolation works, get the exact values at the
% interpolation data points in xi.
yexact = ece498fun(xi);

%% Use the function interp1 using each of the methods
close all;
% 'linear' 'nearest' 'next' 'previous' 'pchip' 'makima' and 'spline'
%
% to compute interpolated values yinterp at the points in xi
yinterp = interp1(x,y,xi,'linear');

% for each method, create two subplots in a single figure window
% the top subplot should be
subplot(2,1,1)
plot(xi,yexact,xi,yinterp,x,y,'.','markersize',25,'MarkerEdgeColor','k','linewidth',2);
set(gca,'fontsize',20);
title('Decaying Sinusoid Data and Linear Interpolation');
xlabel('X');
ylabel('Y');
legend('Original Data', 'Interpolated Curve', 'Interpolated Points');

% this shows the interpolated points on top of the exact points and marks
% the original data points used in the interpolation

% in the bottom subplot plot the error
subplot(2,1,2)
plot(xi,yexact-yinterp,x,zeros(size(x)),'linewidth',2);
set(gca,'fontsize',20);
title('Error Plot');
xlabel('X');
ylabel('Error');
legend('Exact Data Error','Interpolation Error');

% this plots the error and shows where the original x axis data appears

% Remove the comments around executable code above and specify a method
%
% Duplicate the above executable code into 7 code sections, one for each
% method so each can be run separately from the editor.

% If you find it useful and beneficial to change how the above data is
% presented, please feel free to modify the above plot statements so the
% results are more visually appealing and demonstrative.

%% Nearest
close all;

yinterp = interp1(x,y,xi,'nearest');

subplot(2,1,1)
plot(xi,yexact,xi,yinterp,x,y,'.','markersize',25,'MarkerEdgeColor','k','linewidth',2);
set(gca,'fontsize',20);
title('Decaying Sinusoid Data and "Nearest" Interpolation');
xlabel('X');
ylabel('Y');
legend('Original Data', 'Interpolated Curve', 'Interpolated Points');

subplot(2,1,2)
plot(xi,yexact-yinterp,x,zeros(size(x)),'linewidth',2);
set(gca,'fontsize',20);
title('Error Plot');
xlabel('X');
ylabel('Error');
legend('Exact Data Error','Interpolation Error');

%% Next
close all;

yinterp = interp1(x,y,xi,'next');

subplot(2,1,1)
plot(xi,yexact,xi,yinterp,x,y,'.','markersize',25,'MarkerEdgeColor','k','linewidth',2);
set(gca,'fontsize',20);
title('Decaying Sinusoid Data and "Next" Interpolation');
xlabel('X');
ylabel('Y');
legend('Original Data', 'Interpolated Curve', 'Interpolated Points');

subplot(2,1,2)
plot(xi,yexact-yinterp,x,zeros(size(x)),'linewidth',2);
set(gca,'fontsize',20);
title('Error Plot');
xlabel('X');
ylabel('Error');
legend('Exact Data Error','Interpolation Error');

%% Previous
close all;

yinterp = interp1(x,y,xi,'previous');

subplot(2,1,1)
plot(xi,yexact,xi,yinterp,x,y,'.','markersize',25,'MarkerEdgeColor','k','linewidth',2);
set(gca,'fontsize',20);
title('Decaying Sinusoid Data and "Previous" Interpolation');
xlabel('X');
ylabel('Y');
legend('Original Data', 'Interpolated Curve', 'Interpolated Points');

subplot(2,1,2)
plot(xi,yexact-yinterp,x,zeros(size(x)),'linewidth',2);
set(gca,'fontsize',20);
title('Error Plot');
xlabel('X');
ylabel('Error');
legend('Exact Data Error','Interpolation Error');

%% Pchip
close all;

yinterp = interp1(x,y,xi,'pchip');

subplot(2,1,1)
plot(xi,yexact,xi,yinterp,x,y,'.','markersize',25,'MarkerEdgeColor','k','linewidth',2);
set(gca,'fontsize',20);
title('Decaying Sinusoid Data and Pchip Interpolation');
xlabel('X');
ylabel('Y');
legend('Original Data', 'Interpolated Curve', 'Interpolated Points');

subplot(2,1,2)
plot(xi,yexact-yinterp,x,zeros(size(x)),'linewidth',2);
set(gca,'fontsize',20);
title('Error Plot');
xlabel('X');
ylabel('Error');
legend('Exact Data Error','Interpolation Error');

%% Makima
close all;

yinterp = interp1(x,y,xi,'makima');

subplot(2,1,1)
plot(xi,yexact,xi,yinterp,x,y,'.','markersize',25,'MarkerEdgeColor','k','linewidth',2);
set(gca,'fontsize',20);
title('Decaying Sinusoid Data and Makima Interpolation');
xlabel('X');
ylabel('Y');
legend('Original Data', 'Interpolated Curve', 'Interpolated Points');

subplot(2,1,2)
plot(xi,yexact-yinterp,x,zeros(size(x)),'linewidth',2);
set(gca,'fontsize',20);
title('Error Plot');
xlabel('X');
ylabel('Error');
legend('Exact Data Error','Interpolation Error');

%% Spline
close all;

yinterp = interp1(x,y,xi,'spline');

subplot(2,1,1)
plot(xi,yexact,xi,yinterp,x,y,'.','markersize',25,'MarkerEdgeColor','k','linewidth',2);
set(gca,'fontsize',20);
title('Decaying Sinusoid Data and Spline Interpolation');
xlabel('X');
ylabel('Y');
legend('Original Data', 'Interpolated Curve', 'Interpolated Points');

subplot(2,1,2)
plot(xi,yexact-yinterp,x,zeros(size(x)),'linewidth',2);
set(gca,'fontsize',20);
title('Error Plot');
xlabel('X');
ylabel('Error');
legend('Exact Data Error','Interpolation Error');

%% In addition to the 7 figures you generate above
% annotate each one so the method used appears on the plot in some useful
% way.
%
% In addition to these plots your writeup for this assignment is to write
% actual paragraphs containing sentences comparing and contrasting the
% various interpolation methods. Your writeup should describe in simple
% terms what each of the methods are. This part of the writeup is NOT done
% in MATLAB but rather your writing program of choice. (LibreOffice is the
% best. Google Docs is good. MSWord sucks.)



