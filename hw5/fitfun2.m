function [enorm, p] = fitfun2(x,td,yd)

E = [ones(size(td)) exp(x(1)*td) exp(x(2)*td)];
disp("Length of yd" + length(yd));
disp("Length of E" + length(E));
p = E\yd;

f = p(1) + p(2)*exp(x(1)*td) + p(3)*exp(x(2)*td);

enorm = norm(f-yd);