function xdot = cam_414_solver(t, x)
% ECE 498 - Cameron Sullivan - HW8: Series RLC Circuit Diff Eq Solver

C = 125e-6;
L = 0.1;
R = 60;

% Diff Eqs given by Hanselman.
xdot = [(-1/L)*(x(2) + R*x(1)); x(1)/C];
