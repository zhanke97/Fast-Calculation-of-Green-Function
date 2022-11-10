function F = GFRReZ0(R)
% Calculate the real part of the partial derivative of Green function 
% when Z = 0

F = -2 + pi * (bessely(1,R) + StruveH1(R));

end