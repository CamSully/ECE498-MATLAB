% ECE 498 - Cameron Sullivan - HW9 Circular Shift Test Code

clc;
clear;

% mycircshift([1 2 3 4 5], 2)
% mycircshift([1 2 3 4 5], -4)

twoD_array = [1 2 3; 4 5 6; 7 8 9];
mycircshift(twoD_array, 1)
% mycircshift(twoD_array, [1 -1])
% mycircshift(twoD_array, [0 1])