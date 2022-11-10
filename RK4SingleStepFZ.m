function F = RK4SingleStepFZ(R, Z0, h, F0)
% Fourth order Runge-Kutta method for single step

Z1 = Z0 + h;
Zm = (Z0 + Z1) / 2;

K1 = FZ(R, Z0, F0);
K2 = FZ(R, Zm, F0 + h * K1 / 2);
K3 = FZ(R, Zm, F0 + h * K2 / 2);
K4 = FZ(R, Z1, F0 + h * K3);

F = F0 + h / 6 * (K1 + 2 * K2 + 2 * K3 + K4);

end

function FZ = FZ(R, Z, F)

FZ = -2 / sqrt(R^2 + Z^2) - F;

end