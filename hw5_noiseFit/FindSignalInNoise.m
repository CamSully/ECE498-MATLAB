% Finding a signal in the noise.
%
% Open the file ECE498Data.mat. The variable 'data' contained in the file
% has two columns. The first column is a time vector; the second is
% experimentally gathered data.
%
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

close all;

% Hanselman's .mat file automatically create variables, so I do not assign the load result to anything!
load('ECE498Data.mat');

t = data(:,1);
y = data(:,2);
disp("Length of input data: " + length(t));

% This function is used to show the form of the desired waveform.
% In this case, y = Acos(omegat*t + theta) + B.
fun = @(x,t,y) norm(x(1)*cos(x(2)*t + x(3)) + x(4) - y);
% The fminsearch function requires a fit that only takes x.
% This function call provides fminsearch the required function, and uses t and y to fit the data.
fun1 = @(x) fun(x,t,y);

% I didn't use any options for this assignment.
options = [];

% Default 0 guess.
% x0 = [0,0,0,0];
% First rough guess from looking at data.
% x0 = [7.5,314,0,3];
% Second guess from using cursors to calculate values.
% x0 = [6.50,369.2,0,3.28];
% Final guess based on output from second guess.
x0 = [6.0962, 377.9243, -0.01761, 3.1543];

% Use fminsearch to approximate A, omega, theta, and B to fit the data to a cosine waveform.
x = fminsearch(fun1,x0,options);
disp("A: " + x(1));
disp("omega: " + x(2));
disp("theta: " + x(3));
disp("B: " + x(4));

% Obtain points for the fit cosine wave.
y_fit = x(1)*cos(x(2)*t + x(3)) + x(4);

% Plot original signal and cosine fit signal.
subplot(2,1,1);
plot(t,y,t,y_fit,'linewidth',2);
set(gca,'fontsize',20);
title('Approximation of a Noisy Signal with Fminsearch');
ylabel('Value');
xlabel('Time');
legend('Raw data', 'Cosine fit');

% Plot error.
subplot(2,1,2);
plot(t,y-y_fit,'linewidth',2);
set(gca,'fontsize',20);
title('Fit Error versus Time');
ylabel('Fit error');
xlabel('Time');

% Normal error indicates the overall success of the fit. 
% The objective is to minimize enorm.
enorm = fun1(x);
disp("enorm: " + enorm);