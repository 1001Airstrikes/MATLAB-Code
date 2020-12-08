% Clear previous stuff
clear; clc;

% Base data
x = [10 20 30 40 50 60 70 80];
y = [25 70 380 550 610 1220 830 1450];

% Natural logs to deal with part 3
w = log(x);
z = log(y);

% Find a, b, and sometimes c
p1 = leastsquares(x,y,2);
p2 = leastsquares(x,y,3);
p3 = leastsquares(w,z,2);

% Exponential to deal with part 3
p3(1) = exp(p3(1));

% Make all three functions
syms V
F1 = p1(1) + p1(2)*V;
F2 = p2(1) + p2(2)*V + p2(3)*V^2;
F3 = p3(1)*V^p3(2);

% Make graph and plot base data
plot(x,y,'o')
xlabel('Velocity (m/s)')
ylabel('Drag Force (N)')
hold on

% Plot the functions
fplot(F1,'k')
fplot(F2,'r')
fplot(F3,'b')

legend('Base Data', 'a+bx', 'a+bx+cx^2', 'ax^b')
