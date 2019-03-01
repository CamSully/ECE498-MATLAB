% Finding a signal in the noise.
%
% Open the file ECE498Data.mat. The variable 'data' contained in the file
% has two columns. The first column is a time vector; the second is
% experimentally gathered data.
%
% Once you have 'data' loaded, you can plot the function using

% Hanselman's .mat file automatically create variables, so I do not assign the load result to anything!
close all;
clc;

load('ECE498Data.mat');

t = data(:,1);
y = data(:,2);
disp("Length of input data: " + length(t));

plot(t,y);
hold on;

fun = @(x,t,y) norm(x(1)*cos(x(2)*t + x(3)) + x(4) - y);
fun1 = @(x) fun(x,t,y);

options = [];
x0 = [0,0,0,0];
x = fminsearch(fun1,x0,options)

y_fit = x(1)*cos(x(2)*t + x(3)) + x(4) - y;
plot(t,y_fit);

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