% Finding a signal in the noise.
%
% Open the file ECE498Data.mat. The variable 'data' contained in the file
% has two columns. The first column is a time vector; the second is
% experimentally gathered data.
%
% Once you have 'data' loaded, you can plot the function using

% This does not work!
% data = load('ECE498Data.mat');
% whos

t = data(:,1);
y = data(:,2);
disp("Length of input data: " + length(t));

plot(t,y);

% Test data
A = 1;
omega = 1;
theta = 1;
B = 1;

xstar = [A;omega;theta;B];
timed = linspace(0,0.1,433);
yd = A*cos(omega*t + theta) + B;

% Initial guess
x0 = zeros(1,4);

fitfun1 = @(x) fitfun2(x,timed,yd);

options = [];

x = fminsearch(fitfun1,x0,options);

[enorm,p] = fitfun1(x);
enorm
pout = [p pstar]
xout = [x xstar]

% This week's task is to find the values of A, omega, theta and B that best
% fits the data where
%
% yfit = A*cos(omega*t + theta) + B;
% to evaluate this function, create an anonymous function

% Given your solution, make two subplots
% Let the upper subplot contain plot(t,y,t,yfit) to show the raw data and
% the fitted curve on top of each other
%
% Let the lower subplot contain plot(t,y-yp) to show the error in the fit.
%
% pretty the plots up appropriately and impress the instructor

% Use this script M-file to do your work.
% Useful reading: 32.12 Nonlinear Curve Fitting
% Useful functon: fminsearch