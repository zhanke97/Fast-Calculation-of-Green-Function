% This script tests the computational efficiency and accuracy.

% The improved method and the original method ( numerical integration ) are 
% used to calculate the real part of pulsating source Green function 
% ( F(R,Z) ) by equally spaced sampling in a rectangular region.Compare the 
% difference of the results.

% Function GF.m can be used directly in practical applications.

% The calculation of Struve function uses the open source code by T.P.Theodoulidis.

% Author : K.Zhan
% Date   : 10th Nov, 2022

% LR - horizontal length
% LZ - vertical length
% h  - sampling interval
% FI - F(R,Z) calculated by improved method
% FO - F(R,Z) calculated by original method

clear;clc;

% Parameter setting
LR = 20;
LZ = 8;
h = 0.1;

% Generate computational domain
R = [h: h: LR];
Z = [h: h: LZ];

% Improved method
t = tic;
for i= 1: length(R)
    for j= 1: length(Z)
        %[FI(i, j),~ ,~ ,~] = GF(R(i), Z(j));
        FI(i,j) = GFRe(R(i), Z(j)); % Only calculate F(R,Z)
    end
end
t = toc(t);

disp(['Time(improved method):',num2str(t),'s'])

% Original method( numerical integration )
t = tic;
for i= 1: length(R)
    for j= 1: length(Z)
        FO(i, j) = GF0(R(i), Z(j));
    end
end
t = toc(t);

disp(['Time(original method):',num2str(t),'s'])

% Calculation accuracy analysis
ErrorAnalysis(abs(FI - FO))
