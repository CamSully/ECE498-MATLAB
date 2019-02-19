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
    % Whatever input array is provided, convert it to a single-row vector.
    x = reshape(x,1,[]);

    % If the user enters 'min', find the minimum points, where the second derivative is positive.
    if (str == 'min')
        % Shift the array right one and add flintmax onto the beginning and end. +flintmax allows minima to be located.
        % Obtained from https://www.mathworks.com/matlabcentral/answers/59432-how-to-shift-arrays-to-the-right
        x = [flintmax, x(1:end), flintmax];
        
        % Recalculate the differences with the newly-appended array.
        differences = diff(x);
        
        % Locate the max and min by finding the second derivative. The > 0 is necessary to prevent double-calculation of a maxima or minima.
        second_deriv = diff(differences>0);
        
        idx = find(second_deriv > 0);
    end
    
    % If the user enters 'max', find the maximum points, where the second derivative is negative.
    if (str == 'max')
        % Add -flintmax to the beginning and end of the array to allow maxima to be located at the first and last index.
        x = [-flintmax, x(1:end), -flintmax];
        differences = diff(x);
        
        % Locate the max and min by finding the second derivative. The > 0 is necessary to prevent double-calculation of a maxima or minima.
        second_deriv = diff(differences>0);
        
        idx = find(second_deriv < 0);
    end
end
return;