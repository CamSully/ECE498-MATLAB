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

% Sullivan, Cameron
% 2019/4/14

% Be sure to include appropriate error checking on the input arguments
% Are they all there? Do they have appropriate dimensions and acceptable
% values?
% use the MATLAB function circshift to check your results
% no loops allowed
% dimensions do not change, i.e., size(Y) = size(A)



% User must provide exactly two arguments.
if nargin == 0 || nargin == 1 || nargin > 2
    error('Unacceptable number of input arguments provided. Two arguments are required...');
end

% Array error checking.
if isempty(A) || length(A) == 1
    error('Input matrix A must have at least two elements.');
end
if isnan(A) | ~isnumeric(A) | ~isreal(A) | A > flintmax
    error('Array "A" must only contain numeric, real data...')
end

% Shift value error checking.
if isempty(K) || length(K) > 2
    error('K must be 1 or 2 elements long.');
end
if isnan(K) | ~isnumeric(K) | ~isreal(K) | fix(K) ~= K | K > flintmax
    error('Shift value "K" must be a real, positive, numeric, integer...')
end



% Get number of rows & columns in A.
A_size = size(A);
num_rows = A_size(1);
num_cols = A_size(2);



% 1D array circular shifting.
if (num_rows == 1)
    % Ensure that K only contains a single element for a row vector input.
    if length(K) > 1
        error('K must only contain a single scalar for row vector input.')
    end
%     If the user attempts to shift a length further than the length of the array, 
%     decrease the shift value to be less than the array.
%     This will cause an equivalent shifting operation.
    if (K < -length(A))
        K = K + length(A);
    end
    if (K > length(A))
        K = K - length(A);
    end

    % Allocate space for the returned output array.
    Y = zeros(1, length(A));

    % Get the indices of the 1D input array.
    indices = 1:length(A);
    % Add the shift number to each index.
    shifted_indices = indices + K;
    % If the new index is below 1, circularly shift it to the end of the array.
    shifted_indices(shifted_indices < 1) = shifted_indices(shifted_indices < 1) + length(A);
    % If the new index is above the max index, circularly shift it to the beginning of the array.
    shifted_indices(shifted_indices > length(A)) = shifted_indices(shifted_indices > length(A)) - length(A);
    % Create the shifted array by placing the original A values in the new indices.
    Y(shifted_indices) = A(indices);
    return
end



% 2D array circular shifting.
if (num_rows > 1)
    % Complete the same process as for 1D arrays, except that rows and columns are evaluated separately.
    row_indices = 1:num_rows;
    % Shift rows by the value at the first index of K.
    new_row_indices = row_indices + K(1);
    new_row_indices(new_row_indices < 1) = new_row_indices(new_row_indices < 1) + num_rows;
    new_row_indices(new_row_indices > num_rows) = new_row_indices(new_row_indices > num_rows) - num_rows;
    % Shift the rows of A into the new rows of Y.
    Y(new_row_indices,:) = A(row_indices,:);

    % If the user entered an array of two values for K, shift the columns by K(2).
    if (length(K) == 2)
        % Complete the same process as for rows, but shift columns instead.
        col_indices = 1:num_cols;
        % Shift columns by the value at the second index of K.
        new_col_indices = col_indices + K(2);
        new_col_indices(new_col_indices < 1) = new_col_indices(new_col_indices < 1) + num_cols;
        new_col_indices(new_col_indices > num_cols) = new_col_indices(new_col_indices > num_cols) - num_cols;
        % Shift the columns of the original Y output into the final Y output.
        Y(:,new_col_indices) = Y(:,col_indices);
    end
    return;
end