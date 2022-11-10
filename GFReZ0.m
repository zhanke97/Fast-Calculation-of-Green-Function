function F = GFReZ0(R)
% Calculate the real part of Green function when Z = 0

F = - pi * (bessely(0,R) + StruveH0(R));

end

