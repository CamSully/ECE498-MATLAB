function out=narcissistic(D)
%NARCISSISTIC returns narcissistic numbers
% Y = NARCISSISTIC(D) returns all the narcissitic numbers having D digits.
%
% A narcissistic number is an N-digit number that is the sum of the Nth power of its digits.
% For example: 153 = 1^3 + 5^3 + 3^3 is a narcissistic number.
% 
% Examples: NARCISSISTIC(1) returns [0 1 2 3 4 5 6 7 8 9]
%           NARCISSISTIC(2) returns [] (There are no 2-digit narcissistic numbers).
%           NARCISSISTIC(3) returns [153 370 371 407]
%
% Input Arguments
% D is the number of digits for which D-digit narcissistic numbers will be returned.
% The maximum value of D that can be entered is 60, because there are no narcissistic numbers with more than 60 digits.
% An error is returned when D is not a positive, real, scalar value. 
%
% The previously-written getdigits() function is used to provide the digits of each number of D digits.
%
% helpful links:
% http://mathworld.wolfram.com/NarcissisticNumber.html
% https://en.wikipedia.org/wiki/Narcissistic_number

% Input error checking.
if nargin == 0 || nargin > 1
    error('Incorrect number of arguments provided. One input argument is required...')
end
if length(D) ~= 1 || ~isnumeric(D) || isnan(D) || ~isscalar(D) || ~isreal(D) || fix(D) ~= D || D > 60 || D < 1
    error('Input value must be a single real, positive, numeric, integer that is less than 60.')
end

% Allocate 10 zeros for the result.
% 10 zeros is enough because the max number of narcissistic numbers for up to D = 39 is 10.
out = zeros(1,10);

% A variable for the index to store the next narcissistic number.
narcissistic_index = 1;

% D == 1 needs a separate loop because of the zero case. 
% If the same for-loop was used for D == 2, number would start at 9, which is not a 2-digit number.
if (D == 1)
    % Loop through all numbers that have D digits.
    for number = 10^(D-1)-1:10^(D)-1                % UNIQUE FOR-LOOP INDICES FOR D == 1.
        % Get the digits of the number.
        digits = getdigits(number);

        % Calculate the narcissistic value of the number to determine if it is truly narcissistic.
        narcissistic_num = sum(digits.^D);

        % If the number and its narcissitic form are equal, the number is a narcissistic number!
        if(number == narcissistic_num)
            % Add the number to the output array.
            out(narcissistic_index) = number;
            % Iterate the narcissistic counter to the next index to store the next narcissistic number.
            narcissistic_index = narcissistic_index + 1;
        end
    end

% If D > 1...
else
    for number = 10^(D-1):10^(D)-1
        digits = getdigits(number);

        narcissistic_num = sum(digits.^D);

        if(number == narcissistic_num)

            out(narcissistic_index) = number;
            narcissistic_index = narcissistic_index + 1;
        end
    end
    % If there are not 10 narcissistic numbers in the output, clear the excess zeros.
    out((narcissistic_index):end) = [];
end