clear; clc;

%% Part A: Finite Difference Method

% Set number of nodes and distance between each node
n = 21;
h = 1/(n-1);

%d2ydx2 = -(1-x)/(1+0.5*x)^4
%d2ydx2 = f(x+h)-2*f(x)+y(x-h)/h^2
%-(1-h)/(1+0.5*h)^4 = y(1)-2*y(0)+y(-1)/h^2
% h = 0.05
% y(1)-2*y(0)+y(-1)=-0.00215

% Coeficients
a = 1;
b = -2;
c = 1;
d = -0.00215;

% Start the A matrix
A = zeros(n-1);

% Set the first and last rows by the intial condition
A(1,1) = b;
A(1,2) = c;
A(n-1,n-2) = a;
A(n-1,n-1) = b;

% Put in the coefficients where they are supposed to go
for i = 2:(n-2)
   A(i,i-1) = a;
   A(i,i) = b;
   A(i,i+1) = c;
end

% Start the b matrix
B = zeros(n-1,1);

% Set the top and bottom to the intial conditions
B(1) = 0;
B(n-1) = 0;

% Fill in b with the constant
for i=2:n-2
   B(i) = d; 
end

% Solve for y
y = linsolve(A,B);

% Add boundary conditions to y
y = [0; y; 0];

% Plot the data
figure
plot(0:h:(1+h),y)

%% Part B: Improved Euler Method

% Set time and inital y
t = 16;
y = [1; 0];

% Keep applying until we are out of time
for i = 1:t
    
    % This is our equation after doing the ydot array thing
    newy = [y(2,i); -sin(y(1,i))];
    
    % Get ystar
    ystar = y(:,i)+newy;
    
    % Get the next entry in y
    y(:,i+1) = y(:,i)+0.5*(newy+[ystar(2); -sin(ystar(1))]);
end

% Plot the data
figure
plot(0:t,y(1,:))

% Say the period
fprintf('Looking at graph, period for first swing is 7 seconds, and the second swing is probably 8 or 9 seconds\n')