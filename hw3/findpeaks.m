function idx = findpeaks(x,str)
%FINDPEAKS Find Indices of Relative Extremes
% FINDPEAKS(X) or FINDPEAKS(X,'max') returns the indices where X(:) has
% local maxima.
% FINDPEAKS(X,'min') returns the indices where X(:) has local minima.
% FINDPEAKS(X,'all') returns the indices where X(:) has either minima or
% maxima.
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
% 2019/02/XX (change XX to the date completed)

% Use diff()
% sign(diff()) provides the sign of the slopes. This allows you to identify max or mins.
% Need to consider case with two consecutive max or mins. 
% Hanselman says either one can be called the max or min.
% If argument is not a 1D array, convert to a 1D array.
% Add more functions to findpeaks() for test cases.