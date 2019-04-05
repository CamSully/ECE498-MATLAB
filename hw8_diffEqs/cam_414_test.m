% ECE 498 - Cameron Sullivan
clc;
clear;
% close all;

C = 125e-6;
L = 0.1;
R = 60;

% INITIAL CONDITIONS
% Initial current is 200 mA.
I_0 = 200e-3;
% Initial cap voltage is -12 V.
V_C0 = -12;
% Initial conditions in column form.
x0 = [I_0; V_C0];

time_span = [0 25e-3];

[t,x] = ode45(@cam_414_solver, time_span, x0);

figure(2);
subplot(2,1,1);
yyaxis left;
plot(t,x(:,1));
title('Series RLC: R = 60 \Omega, L = 100 mH, C = 125 \muF');
ylabel('Current, A');
yyaxis right;
plot(t,x(:,2));
ylabel('V_c , V');
xlabel('time, s');
grid on;

subplot(2,1,2);
wL = 0.5*L*(x(:,1)).^2; % (1/2)*L*i^2
wC = 0.5*C*(x(:,2)).^2;   % (1/2)*C*v^2
subplot(2,1,2);
% NOTE that energy is only plotted to 2.5*tau, not 5*tau
plot(t,wL,t,wC);
xlabel('time, s');
ylabel('Energy, J');
grid on;
legend('Inductor','Capacitor',...
 'Location','southeast');