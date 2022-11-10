function F = GF0(R,Z)
% The original method of calculating F(R,Z)

F = -2 * exp(-Z) * integral(@(t)exp(t) .* (R.^2 + t.^2).^(-0.5), 0, Z)...
    - pi * exp(-Z) * (bessely(0, R) + StruveH0(R));

end