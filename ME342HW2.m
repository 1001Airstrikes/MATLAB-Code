% clear previous data
clc; clear;

% input data
xx = 0:0.5:2;
yy = [-0.7854 0.6529 1.739 2.2071 1.9425];

% find y using lagrange
x = pi/4;
l1 = lagrange(x,xx,yy)
x = pi/2;
l2 = lagrange(x,xx,yy)

% find y using newton
x = pi/4;
n1 = newton(x,xx,yy)
x = pi/2;
n2 = newton(x,xx,yy)
