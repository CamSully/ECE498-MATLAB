function out=factorsCS(N)
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
% 2019/01/31 (change XX to the date completed)

% potentialFactors = 1:N
% divisors = N./potentialFactors
% 
% % This is the problem. I need to evaluate each element separately without using a for-loop.
% if floor(divisors) == divisors
%     disp('factor found')
%     
% end

% Error checking.
if nargin == 0
    error('No arguments provided. One input argument is required...')
elseif isempty(N)
    out = [];
elseif isnan(N(1))
    out = nan;
elseif ~isscalar(N) || ~isnumeric(N) || ~isreal(N) || N < 1 || fix(N) ~= N || N > flintmax
    error('Input value must be a real, positive, numeric, integer...')

% If the input argument is a positive integer, find its factors.
else
    integers = 1:floor(sqrt(N));
    % Find all of the factors of N up to sqrt(N) and put them in a 1D array. This is the key statement to the whole program. 
    % Help from: https://www.mathworks.com/matlabcentral/answers/21542-find-divisors-for-a-given-number
    lower_divisors = integers(rem(N,integers) == 0);
    % Find the upper factors that correspond to the lower factors.
    upper_divisors = N ./ lower_divisors;
    out = [lower_divisors; upper_divisors];
end
