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

% out = zeros(1,10);

narcissistic_counter = 1;

for i = 10^(D-1):10^(D)-1
    digits = getdigits(i)
    indices = 1:length(digits)
    original_num = sum(digits.*10.^(D-indices))
    
    narcissistic_num = sum(digits.^D);
    fprintf("Number = %d", narcissistic_num);
    
    if(original_num == narcissistic_num)
        out(narcissistic_counter) = original_num;
        narcissistic_counter = narcissistic_counter + 1;
    end
end