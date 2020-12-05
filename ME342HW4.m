% Clear previous data
clear; clc;

%% Part 1 and 2
% Make symbolic variable and function for ease of use
syms x f(x)
f(x) = (cosh(x)*cos(x))-1;

% Starting data. a is low value, b is high value, s is what we want the
% change to be under, x is our starting guess
a = 4;
b = 5;
s = 1*10^-4;
x = 5;

% Find the roots using Bisection then Newton Raphson
rootb = bisec(f,a,b,s)
rootnr = NewtRaph(f,x,s)

% Answer question from Part 2
disp('Newton Raphson method is much faster, about 6 times faster than bisection. Also shorter to code.')

%% Part 3
% Data table
V = [10 20 30 40 50 60 70 80];
F = [25 70 380 550 610 1220 830 1450];

% Create symbolic variables and functions for ease of use
syms f(x,y,v) x y v
f(x,y,v) = x-x*exp(-y*v);

% Find the partial derivatives of f with respect to x and with respect to y
dfx(x,y,v) = diff(f,x);
dfy(x,y,v) = diff(f,y);

% Initial data. a is our stating a value guess, b is our starting b value
% guess, A and B are matrices used in least squares (A is A, B is y), d
% will hold our delta values
a = 1500;
b = 0.1;
A = zeros(8,2);
B = zeros(8,1);
d = [1;1];

% While loop that runs until the desired delta is met. This loop is the
% newton raphson part
while abs(d) >= s
    
    % For loop that runs until A and B are filled up with the correct data.
    % i is the row. dfx and dfy are the partial deriviates evaluated at
    % this a, b, and V. This partials are from newton raphson, the loop is
    % from least squares
    for i = 1:length(V)
        A(i,1) = dfx(a,b,V(i));
        A(i,2) = dfy(a,b,V(i));
        B(i) = F(i)-f(a,b,V(i));
    end

    % Least Squares part. Find delta value.
    At = A.';
    AtA = At*A;
    AtB = At*B;
    d = linsolve(AtA,AtB);
    
    % Newton Raphson part. Iterate a and b.
    a = a + d(1);
    b = b + d(2);
end

% Display the final a and b
a
b

% Equation with our final a and b values filled in
f(x) = a*(1-exp(-b*x));

% Plot the experimental data and the least squares newton raphson
% regression best fit.
plot(V,F,'o')
hold on
fplot(f)
xlabel('Velocity V (m/s)')
ylabel('Drag Force F (N)')
