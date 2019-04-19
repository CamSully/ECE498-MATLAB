function out=getdigits(in)
% ADD MORE HELP TEXT! #################################################
%GETDIGITS returns digits from a scalar integer value.
% Y = GETDIGITS(X) returns the digits in integer X in the row vector Y.
%
% Fractional portions in X are ignored.
%
% Example: GETDIGITS(25) returns [2 5]
%          GETDIGITS(907) returns [9 0 7]
%          GETDIGITS(pi) returns an error
%          GETDIGITS(-10) returns an error

% make sure to return an error is not a positive scalar real integer value.
% you may NOT use num2str, str2num, or int2str
% roll your own code if you need to do these conversions

% Input error checking.
if nargin == 0 || nargin > 1
    error('Incorrect number of arguments provided. One input argument is required...')
end
if length(in) ~= 1 || isnan(in) || ~isscalar(in) || ~isnumeric(in) || ~isreal(in) || in < 1 || fix(in) ~= in || in > flintmax
    error('Input value must be a single real, positive, numeric, integer...')
end

num_digits = 0;
% Divide the input integer by 10 until the value is 0.
while (in >= 1)
    in = in / 10;
    % Count each division by 10 as one digit of the input integer.
    num_digits = num_digits + 1;
end

out = num_digits;