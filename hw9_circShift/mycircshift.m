function Y = mycircshift(A,K)
%MYCIRCSHIFT Shift positions of elements circularly.
%  Y = MYCIRCSHIFT(A,K) where K is an integer scalar circularly shifts 
%  the elements in the array A by K positions.
%
%  If A is a vector and K is positive, then the values of A are circularly
%  shifted forward. If K is negative, they are shifted backward.
%
%  Y = MYCIRCSHIFT(A,K) circularly shifts the values in the array A by K
%  elements. K is a two element vector of integers K = [Kr Kc] where the
%  rows are shifted by Kr and the columns are shifted by Kc.
% 
%  Examples:
%
%  A = [ 1  2  3  4  5]
%
%  Y = MYCIRCSHIFT(A,2)  = [4 5 1 2 3];
%  Y = MYCIRCSHIFT(A,-4) = [5 1 2 3 4];
%  _ _ _ _ _ _ _ _ _ _ _ _ _ _
%
%  A = [ 1  2  3
%        4  5  6
%        7  8  9 ];
%
%  Y = MYCIRCSHIFT(A,1) % circularly shifts the rows down by 1.
%  Y =   7  8  9
%        1  2  3
%        4  5  6
%
%  Y = MYCIRCSHIFT(A,[1 -1]) % circularly shifts rows down 1
%                            % and columns left by 1.
%  Y =   8  9  7
%        2  3  1
%        5  6  4
%
%  Y = MYCIRCSHIFT(A,[0 1]) % does not shift rows
%                           % but shifts the colmuns right by 1.
%  Y =   3  1  2
%        6  4  5
%        9  7  8

% Last Name, First Name
% Year/Month/Day

% Be sure to include appropriate error checking on the input arguments
% Are they all there? Do they have appropriate dimensions and acceptable
% values?
% use the MATLAB function circshift to check your results
% no loops allowed

% dimensions do not change, i.e., size(Y) = size(A)

