% ECE 498 - Cameron Sullivan - HW1 factors_test.m
% Code that tests the functionality of factorsCS.m

disp('Checkcode output:')
checkcode factorsCS.m

disp('Testing factors code');
disp('60')
factorsCS(60)

disp('25')
factorsCS(25)

disp('7')
factorsCS(7)

disp('96')
factorsCS(96)

disp('36')
factorsCS(36)

try
    disp('Empty function call')
    factorsCS()
catch error
    disp(error.message)
end

disp('NaN')
factorsCS(nan)

try
    disp('e')
    factorsCS('e')
catch error
    disp(error.message)
end

try
    disp('-2')
    factorsCS('-2')
catch error
    disp(error.message)
end

try
    disp('3.92939')
    factorsCS(3.92939)
catch
    disp(error.message)
end

try
    disp('4j')
    factorsCS(4j)
catch
    disp(error.message)
end