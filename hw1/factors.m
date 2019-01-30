function out=factors(N)
% FACTORS All Factors of an Integer
% FACTORS(N) returns all the factors of the positive integer N.
% For example:
%
% FACTORS(60) returns the 2 X 6 array [ 1  2  3  4  5  6
%                                      60 30 20 15 12 10]
%
% FACTORS(25) returns the 2 X 2 array [ 1  5
%                                      25  5]
%
% FACTORS(7) returns the 2 X 1 array  [1
%                                      7]
%
% If N is an empty array, an empty array is returned. If N is NaN, NaN is
% returned.
% If N is missing or not a real, positive, numeric, integer-valued scalar
% having value less than flintmax, an error string is returned by the
% function error that states what is wrong with the input argument.
%
% No For or While loops permitted.
% No extraneous output to the Command Window.
% Rename the function factorsXX where XX is your initials.

% Cameron, Sullivan (change this line!)
% 2019/01/XX (change XX to the date completed)

% potentialFactors = 1:N
% divisors = N./potentialFactors
% 
% % This is the problem. I need to evaluate each element separately without using a for-loop.
% if floor(divisors) == divisors
%     disp('factor found')
%     
% end

K = 1:N;
D = K(rem(N,K) == 0)
E = fliplr(D)
if rem(length(D),2) == 0 
    F = D(1:length(D)/2)
    G = E(1:length(E)/2)
else
    F = D(1:(length(D)/2 + 1))
    G = E(1:(length(E)/2 + 1))
end
my_factors = [F(:), G(:)]'
