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

% First Name, Last Name (change this line!)
% 2019/01/XX (change XX to the date completed)