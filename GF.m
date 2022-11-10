function [GRe, GRRe, GIm, GRIm] = GF(R, Z)
% Input: coordinates; R - horizontal, Z - vertical
% Output: value of pulsating source Green function

GRe = GFRe(R, Z);   % Real part of Green function

GRRe = GFRRe(R, Z); % Real part of the partial derivative of Green function

GIm = GFIm(R, Z);   % Imaginary part of Green function

GRIm = GFRIm(R, Z); % Imaginary part of the partial derivative of Green function

end

function GRe = GFRe(R, Z)
% Calculating the real part of Green function F(R,Z) by using the
% fourth-order Runge-Kutta method according to the value of the
% boundary F(R,0)

% h   - step length
% n   - step number
% GRe - F(R,Z)

h = 0.5;              % adjustable number less than 1
n = floor(Z / h);

if(n < 1)
    n = 1;
    h = Z;
end

z = 0;
GRe = GFReZ0(R);

for i = 1: n
    G = RK4SingleStepFZ(R, z, h, GRe);
    z = z + h;
    GRe = G;
end

GRe = RK4SingleStepFZ(R, z, Z - n * h, G);

end

function GRRe = GFRRe(R, Z)
% Calculating the real part of the partial derivative of Green
% function FR(R,Z) by using the fourth-order Runge-Kutta method
% according to the value of the boundary FR(R,0)

% h    - step length
% n    - step number
% GRRe - FR(R,Z)

h = 0.5;              % adjustable number less than 1
n = floor(Z / h);

if(n < 1)
    n = 1;
    h = Z;
end

z = 0;
GRRe = GFRReZ0(R);

for i = 1: n
    G = RK4SingleStepFRZ(R, z, h, GRRe);
    z = z + h;
    GRRe = G;
end

GRRe = RK4SingleStepFRZ(R, z, Z - n * h, G);
end

function GIm = GFIm(R, Z)
% Calculating the imaginary part of Green function
GIm = 2 * pi * exp(-Z) * besselj(0, R);
end

function GRIm = GFRIm(R, Z)
% Calculating the imaginary part of the partial derivative of
% Green function
GRIm = -2 * pi * exp(-Z) * besselj(1, R);
end