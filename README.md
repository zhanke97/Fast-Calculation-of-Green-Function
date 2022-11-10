# Fast Calculation of Green Function
An  improved fast calculation method for pulsating source Green function in deep water based on ODE.

The computational accuracy and efficiency of the original method and the improved method are compared in script Test.m.

In actual calculation, function GF.m can be directly used.

#### Introduction

Pulsating source Green function in deep water:
$$
G=\dfrac{1}{r}+\dfrac{1}{r_1}+G^*\\
\\
G^*=2kP.V.\int_0^{\infty}\dfrac{1}{m-k}e^{m(z+\zeta)}J_0(mR)dm+{\rm i}2\pi ke^{m(z+\zeta)}J_0(kR)\\
J_0(mR)=\dfrac{1}{2\pi}\int_{-\pi}^{\pi}e^{{\rm i}mRcos\theta}d\theta
$$
Newman, 1984：
$$
G=\dfrac{1}{r}+\dfrac{1}{r_1}+kF(R,Z)+{\rm i}2\pi ke^{-Z}J_0(R)\\
F(R,Z)=-2e^{-Z}\int_0^Z\dfrac{e^{t}}{\sqrt{R^2+t^2}}dt-\pi e^{-Z}\left[Y_0(R)+H_0(R) \right]\\
F_R(R,Z)=2R\int_0^Z\dfrac{e^{t-Z}}{(R^2+t^2)^{3/2}}dt+\pi e^{-Z}\left[Y_1(R)+H_1(R)-\dfrac{2}{\pi} \right]\\
F_Z(R,Z)=-\dfrac{2}{\sqrt{R^2+Z^2}}-F(R,Z)
$$
Using the value at the boundary Z = 0 as the initial condition, the fourth-order Runge-Kutta method is applied to solve the ODE of F ( R, Z ). This method is dozens of times faster than using numerical integration to calculate F(R,Z),  with high accuracy.
