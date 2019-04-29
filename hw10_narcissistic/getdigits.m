function out=getdigits(in)
%GETDIGITS returns digits from a scalar integer value.
% Y = GETDIGITS(X) returns the digits in integer X in the row vector Y.
% Fractional portions in X are ignored.
%
% Examples: GETDIGITS(25) returns [2 5]
%          GETDIGITS(907) returns [9 0 7]
%          GETDIGITS(pi) returns an error
%          GETDIGITS(-10) returns an error
%
% Input Arguments
% X is the number for which the digits will be returned.
% The maximum acceptable value of X is flintmax.
% An error is returned when X is not a positive scalar real integer value.
%
% num2str, str2num, and int2str are not used in this function.

% Input error checking.
if nargin == 0 || nargin > 1
    error('Incorrect number of arguments provided. One input argument is required...')
end
if length(in) ~= 1 || isnan(in) || ~isscalar(in) || ~isnumeric(in) || ~isreal(in) || fix(in) ~= in || in > flintmax
    error('Input value must be a single real, positive, numeric, integer...')
end

% The maximum number of digits in a number less than flintmax is 16.
digits = zeros(1, 16);
digit_index = 1;

% Deal with the zero case independently.
if (in == 0)
    out = 0;
    return
end

% Divide the input integer by 10 until the value is 0.
while (in >= 1)
    % The current digit is the floor of the remainder of the input value divided by 10.
    digits(digit_index) = floor(mod(in,10));
    % Divide the input number by 10 to determine the next-highest digit.
    in = in / 10;
    % Count each division by 10 as one digit of the input integer.
    digit_index = digit_index + 1;
end

% Remove the extra zeros from the array of the digits.
digits(digit_index:end) = [];
% The digits are stored in reverse order, so they need to be flipped for the final output.
out = flip(digits);