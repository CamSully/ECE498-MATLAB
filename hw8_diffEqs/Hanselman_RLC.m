% Series RLC circuit Solution

% Enter Resistance R below
% R = 60;
R = 1.792;

% Enter Inductance L below
% L = 0.1;
L = 0.014;

% Enter Capacitance C below
% C = 125e-6;
C = 67.99e-6;

% Enter Initial Current I(0-) below
% Io = 0.2;
Io = 0;

% Enter Initial Capacitor Voltage Vc(0-) below
% This voltage polarity is defined so that
% PSC = True with respect to the current i
% Vco = -12;
Vco = -50;

% Choose Plot Type
% 0 for simple
% 1 for detailed
PlotType = 1;

% For Underdamped, choose if energy is plotted
% 0 for no energy plot
% 1 for engery plot
Energyplot = 1;

% Now do the computations, don't mess with lines below
%--------------------------------------------------------------------------
clf % create a figure window or clear the one opened

alpha = R/(2*L);     % damping factor
omegao = 1/sqrt(L*C);% resonant frequency

if alpha>omegao % true if overdamped
   % find the roots
   s1 = -alpha + sqrt(alpha^2 - omegao^2);
   s2 = -alpha - sqrt(alpha^2 - omegao^2);
   
   % set up equations A*x = y to find solution coefficients
   A = [1 1;s1 s2];           % two by two matrix
   y = [Io; -(Vco + Io*R)/L]; % right hand side column vector
   K = A\y;                   % solve simultaneous equations
   
   % create functions for the solution
   ifun1 = @(t) K(1)*exp(s1*t);
   ifun2 = @(t) K(2)*exp(s2*t);
   ifun  = @(t) ifun1(t) + ifun2(t);
   
   tau = -1/s1; % slowest time constant in solution
   
   % create time points to evaluate the solution
   t = linspace(0,5*tau,500); % 500 points from zero to 5*tau
   
   
   % plot the results
   if PlotType ~=0 % detailed plot
      plot(t,ifun(t),t,ifun1(t),'-.m',t,ifun2(t),'-.m')
   else % simple plot
      plot(t,ifun(t))
   end
   xlabel('time, s    (5\tau)')
   ylabel('Current, A')
   title(sprintf('Series RLC: R = %g, L = %g, C = %g',[R L C]))
   grid on
   
   % send data to the Command Window in pretty format
   fprintf('\n\nOverdamped Series RLC Results')
   fprintf('\nAlpha = %g',alpha)
   fprintf('\nOmegao = %g',omegao)
   fprintf('\nTau = %g',tau)
   fprintf('\nS1 = %g',s1)
   fprintf('\nS2 = %g',s2)
   fprintf('\nK1 = %g',K(1))
   fprintf('\nK2 = %g\n',K(2))
   
else % underdamped
   
   omegad = sqrt(omegao^2 - alpha^2); % damped resonant frequency
   
   % compute solution coefficients
   B1 = Io;
   didt0 = -(Vco + Io*R)/L;
   B2 = (didt0 + alpha*B1)/omegad;
   
   % create function for the current solution
   ifun = @(t) exp(-alpha*t).*(B1*cos(omegad*t) + B2*sin(omegad*t));
   
   tau = 1/alpha; % time constant is simple in this case
   
   % create time points to evaluate the solution
   t = linspace(0,5*tau,500); % 500 points from zero to 5*tau
   
   % generate coefficients for single sinusoid solution form
   d = complex(B1,B2);
   D = abs(d);
   phi = angle(d);
   
   % create upper and lower envelopes
   iup = @(t)  D*exp(-alpha*t);
   idn = @(t) -D*exp(-alpha*t);
   
   % create functions to evaluate component energies
   tw = linspace(0,2.5*tau,500);
   wL = @(t) 0.5*L*(ifun(t)).^2; % (1/2)*L*i^2
   Ms = sqrt(L/C);
   beta = atan(omegad*tau);
   Vc = @(t) -D*Ms*exp(-alpha*t).*cos(omegad*t - phi +beta);
   wC = @(t) 0.5*C*(Vc(t)).^2;   % (1/2)*C*v^2
   wR = @(t) wL(0) + wC(0) - wL(t) - wC(t); % resistor energy
   
   % plot the results
   if Energyplot % plot results and energy
      subplot(2,1,1)
      if PlotType ~=0 % detailed plot
         yyaxis left
         plot(t,ifun(t),t,iup(t),'-.m',t,idn(t),'-.m')
         ylabel('Current, A')
         yyaxis right
         plot(t,Vc(t))
         ylabel('V_c , V')
      else
         plot(t,ifun(t))
         ylabel('Current, A')
      end
      xlabel('time, s    (5\tau)')
      
      title(sprintf('Series RLC: R = %g, L = %g, C = %g',[R L C]))
      grid on
      subplot(2,1,2)
      % NOTE that energy is only plotted to 2.5*tau, not 5*tau
      plot(tw,wL(tw),tw,wC(tw),tw,wR(tw))
      xlabel('time, s    (2.5\tau)')
      ylabel('Energy, J')
      grid on
      legend('Inductor','Capacitor','Resistor',...
         'Location','southeast')
   else
      if PlotType ~=0 % detailed plot
         yyaxis left
         plot(t,ifun(t),t,iup(t),'-.m',t,idn(t),'-.m')
         ylabel('Current, A')
         yyaxis right
         plot(t,Vc(t))
         ylabel('V_c , V')
      else
         plot(t,ifun(t))
         ylabel('Current, A')
      end
      xlabel('time, s    (5\tau)')
      
      title(sprintf('Series RLC: R = %g, L = %g, C = %g',[R L C]))
      grid on
   end
   
   % send data to the Command Window in pretty format
   fprintf('\n\nUnderdamped Series RLC Results')
   fprintf('\nAlpha = %g',alpha)
   fprintf('\nOmegao = %g',omegao)
   fprintf('\nOmegad = %g',omegad)
   fprintf('\nTau = %g',tau)
   fprintf('\nB1 = %g',B1)
   fprintf('\nB2 = %g',B2)
   fprintf('\nD = %g',D)
   fprintf('\nPhi = %g\n',phi*180/pi)
   
   
   
end