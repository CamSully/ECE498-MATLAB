function out=getdigits(in)
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

