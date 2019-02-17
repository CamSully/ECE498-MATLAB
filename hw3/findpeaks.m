function idx = findpeaks(x,str)
%FINDPEAKS Find Indices of Relative Extremes
% FINDPEAKS(X) or FINDPEAKS(X,'max') returns the indices where X(:) has
% local maxima.
% FINDPEAKS(X,'min') returns the indices where X(:) has local minima.
% The first and last data points in X(:) are returned when appropriate.
%
% Report an appropriate error message is the input X is inappropriate or
% when the second input argument is invalid.
%
% No For or While loops permitted.
% No extraneous output to the Command Window.

% potentially helpful functions
% find, sign, diff, strncmpi, case

% Cameron, Sullivan (change this line!)
% 2019/02/17 (change XX to the date completed)

% Error checking
if nargin == 0 || nargin == 1
    error('Not enough arguments provided. Two input arguments are required...');
elseif isempty(x)
    idx = [];
    disp('Empty input vector provided. Please provide an array of input values...');
    return
elseif ~isnumeric(x) || sum(isnan(x)) || ~isreal(x) || sum(x(1:end) > flintmax)
    error('Input value must be a real, positive, numeric, integer...');
elseif ~strcmpi(str, 'max') && ~strcmpi(str, 'min')
    error('String input must be either "max" or "min"');

% If the input is acceptable, find max or min values.
else
    % Obtain an array of the indices where the value of the array changes.
    differences = diff(x);
    change_indices = find(differences ~= 0)

    % If all of the values in the array are the same value, return the first value.
    if (isempty(change_indices))
        idx = x(1);
        return
    end

    % To determine if the first or last value is a max or min, pad the first and last values with the first value with a non-zero slope.
    % e.g. [1 2] becomes [2 1 2 1] to allow for easy calculation that index 1 is a minimum and index 2 is a maximum.
    first_value = x(change_indices(1) + 1)
    last_value = x(change_indices(end));
    % Shift the array right one and add the first value on, add the last value on the end.
    % Obtained from https://www.mathworks.com/matlabcentral/answers/59432-how-to-shift-arrays-to-the-right
    x = [first_value, x(1:end), last_value]


    % Recalculate the differences with the newly-appended array.
    differences = diff(x)
    % Locate the max and min by finding the second derivative. The > 0 is necessary to prevent double-calculation of a maxima or minima.
    second_deriv = diff(differences>0)

    % If the user enters 'min', find the minimum points, where the second derivative is greater than 0.
    if (str == 'min')
        idx = find(second_deriv > 0);
    end
    % If the user enters 'max', find the minimum points, where the second derivative is less than 0.
    if (str == 'max')
        idx = find(second_deriv < 0);
    end
end
return;