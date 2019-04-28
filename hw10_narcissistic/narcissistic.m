function out=narcissistic(D)
%NARCISSISTIC return narcissistic numbers
% Y = NARCISSISTIC(D) returns all the narcissitic numbers having D digits.
%
% complete the rest of this help text in an appropriate manner
%
% Be sure to do error checking and return appropriate errors.
%
% Call your getdigits function to get digits

% helpful links:
% http://mathworld.wolfram.com/NarcissisticNumber.html
% https://en.wikipedia.org/wiki/Narcissistic_number

% Error checking

% Allocate 10 zeros for the result.
% 10 zeros is enough because the max number of narcissistic numbers for up to D = 39 is 10.
out = zeros(1,10);

% A variable for the index to store the next narcissistic number.
narcissistic_index = 1;

% D == 1 needs a separate loop because of the zero case. 
% If the same for-loop was used for D == 2, number would start at 9, which is not a 2-digit number.
if (D == 1)
    % Loop through all numbers that have D digits.
    for number = 10^(D-1)-1:10^(D)-1
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

else
    % Loop through all numbers that have D digits.
    for number = 10^(D-1):10^(D)-1
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
end