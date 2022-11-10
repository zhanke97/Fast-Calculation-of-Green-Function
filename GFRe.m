function GRe = GFRe(R, Z)
% Calculate the real part of Green function

h = 0.5;
n = floor(Z / h);

if(n < 1)
    n = 1;
    h = Z;
end

z = 0;
GRe = GFReZ0(R);

for i = 1:n
    G = RK4SingleStepFZ(R, z, h, GRe);
    z = z + h;
    GRe = G;
end

GRe = RK4SingleStepFZ(R, z, Z - n * h, G);

end