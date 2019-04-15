% ECE 498 - Cameron Sullivan - HW9 Circular Shift Test Code

clc;
clear;

% Test error checking functionality.
% Test differing numbers of input arguments.
% mycircshift()
% mycircshift([1 2 3])
% mycircshift([1 2], 1, 2)

% Test A values.
% mycircshift([1 'a'], 1)
% mycircshift([nan nan], 1)
% mycircshift([2 + 3i 1], 1)
% mycircshift([999999999999999999999999 99999999999999999999999], 1)

% Test K values.
% mycircshift([1 2], [])
% mycircshift([1 2], [1 2])
% mycircshift([1 2], 'a')
% mycircshift([1 2], nan)
% mycircshift([1 2], 2 + 3i)
% mycircshift([1 2], 0.5)
% mycircshift([1 2], 3.79)
% mycircshift([1 2], 9999999999999999)



% Test 1D arrays
% mycircshift([1 2 3 4 5], 2)
% mycircshift([1 2 3 4 5], -4)

% Test 2D arrays
% twoD_array = [1 2 3; 4 5 6; 7 8 9];
% mycircshift(twoD_array, 1)
% mycircshift(twoD_array, [1 -1])
% mycircshift(twoD_array, [0 1])

% Test a non-square array.
% myArray = [2 5; 3 1; 4 8]
% mycircshift(myArray, [1 1])