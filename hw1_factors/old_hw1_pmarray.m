% ECE 498 - Cameron Sullivan - HW1 pmarray.m
% Code originally written by Prof. Hanselman.

function out=pmarray(m,n,k,alg)
%PMARRAY Array Containing Alternating Plus and Minus K.
% PMARRAY(M,N,K,ALG) produces an M-by-N array of plus and minus K values
% using the algorithm identified by the integer value ALG. If ALG is not
% present, ALG=0 is chosen.
%
% For example: PMARRAY(3,5,8,0)
% produces the matrix
%                       [ 8  -8   8  -8   8
%                        -8   8  -8   8  -8
%                         8  -8   8  -8   8 ]
%
% Your function should implement at least 5 different algorithms. Therefore
% the variable ALG can take on any value between 1 and 5. If you wish to
% implement more than 5 algorithms, add them to your code.
%
% Create two or more algorithms that do not require For or While loops?

% No extraneous output to the Command Window.
% Rename the function pmarrayXX where XX is your initials.

% functions used:
% numel(x) returns the number of elements in the variable x
% fix(x) returns the integer part of the variable x
% rem(x,y) returns the remainder of x/y
% error('string') aborts operation and displays a character string message
% nargin returns the number of input arguments supplied
% isscalar returns true if the argument is a scalar
% isnumeric returns true if th argument is a numerical value or array


% do some error checking on the input arguments
if nargin<3
   error('At Least 3 Input Arguments are Required.')
   
elseif nargin==3
   alg=0; % default algorithm
   
end
if ~isscalar(m) || fix(m)~=m || m<1
   error('M Must be a Positive Scalar.')
end

if ~isscalar(n) || fix(n)~=n || n<1
   error('N Must be a Positive Scalar.')
end

if ~isscalar(k) || ~isnumeric(k)
   error('K Must be a Numerical Scalar.')
end
 
if ~isscalar(alg) || fix(alg)~=alg || alg<0
   error('ALG Must be a Nonnegative Integer.')
end

switch alg
   case 0
      % default algorithm 0 here as an example
      
      for i=1:m % loop over rows
         
         for j=1:n % loop over the columns
            oddrow = rem(i,2)==1; % true if in odd numbered row
            oddcol = rem(j,2)==1; % true if in odd numbered column
            
            if oddrow && ~oddcol
               out(i,j) = -k;
            elseif ~oddrow && oddcol
               out(i,j) = -k;
            else
               out(i,j) = k;
            end
         end
         
      end
      
   case 1
      % place your code for algorithm 1 here  
      %out=?
   case 2
      % place your code for algorithm 2 here
      %out=?
   case 3
      % place your code for algorithm 3 here
      %out=?
   case 4
      % place your code for algorithm 4 here
      %out=?
   case 5
      % place your code for algorithm 5 here
      %out=?
   otherwise
      error('Variable ALG Not Understood.')
end
