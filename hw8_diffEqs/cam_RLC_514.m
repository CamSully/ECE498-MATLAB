% ECE 498 - Cameron Sullivan - HW8 Series RLC Circuit Solver Using ode45()

% Component values.
R = 60;
L = 0.1;
C = 125e-6;

% Initial conditions - calculated in ECE 210 HW
% Initial current is 200 mA.
I_0 = 200e-3;
% Initial cap voltage is -12 V.
V_C0 = -12;
% Initial conditions in column form.
x0 = [I_0; V_C0];

% Evaluate RLC circuit over a timespan of 25 ms.
time_span = [0 25e-3];

% Anonymous function for evaulating the voltage and current equations for the series RLC circuit.
% First equation is cap voltage, second equation is current.
series_rlc_equations = @(t,x) [(-1/L)*(x(2) + R*x(1)); x(1)/C];

% Use ode45 to solve the differential equations for voltage and current.
[t,x] = ode45(series_rlc_equations, time_span, x0);

% Use two subplots to plot V_c, I, W_c, and W_l.
figure(2);
subplot(2,1,1);
yyaxis left;
plot(t,x(:,1),'linewidth',2);
set(gca,'fontsize',20);
title('Series RLC: R = 60 \Omega, L = 100 mH, C = 125 \muF');
ylabel('Current, A');
yyaxis right;
plot(t,x(:,2),'linewidth',2);
ylabel('V_c , V');
xlabel('time, s');
grid on;

% Second subplot: energy.
subplot(2,1,2);
% Calculate energy from current and voltage.
wL = 0.5*L*(x(:,1)).^2; % (1/2)*L*i^2
wC = 0.5*C*(x(:,2)).^2;   % (1/2)*C*v^2
subplot(2,1,2);
plot(t,wL,t,wC,'linewidth',2);
set(gca,'fontsize',20);
xlabel('time, s');
ylabel('Energy, J');
grid on;
legend('Inductor','Capacitor',...
 'Location','southeast');