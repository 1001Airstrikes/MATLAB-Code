% Clear workspace
clear; clc;

% Declare symbolic functions
syms f(x) df(x) ddf(x);

% Make said functions
f(x) = -0.1*x^4 - 0.15*x^3 - 0.5*x^2 - 0.25*x + 1.2;
df(x) = diff(f(x));
ddf(x) = diff(df(x));

% Plug in 0.5
z = double(ddf(0.5));

% 2nd order central diff approx for 1 < h < 1^-12
h = 1;
for i = 1:12
    y(i) = double((f(0.5+h) - 2*f(0.5) + f(0.5-h))/(h^2));
    a(i) = abs(double(z-y(i)));
    h = h/10;
end

% Display results
disp(z);
disp(y);
disp(a);
disp('Optimal value: 1.0^-5');