% Clear previous data
clear; clc;

% Make functions
syms f x g y h z
f(y,z) = (140-3*y)/-2;
g(x,z) = (40+x-3*z)/-2;
h(x,y) = (10+y)/-2;

% Do jacobi method
J = jacobi(f,g,h)

% Make matrices
Au = [0 3 0; 0 0 3; 0 0 0];
Ad = [-2 0 0; 0 -2 0; 0 0 -2];
Al = [0 0 0; -1 0 0; 0 -1 0];
x = [0; 0; 0];
b = [140; 40; 10];

% Do forward and symetric gauss-seidel
F = fGS(x, Au, Ad, Al, b)
S = sGS(x, Au, Ad, Al, b)