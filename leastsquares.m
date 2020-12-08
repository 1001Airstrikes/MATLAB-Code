function p = leastsquares(x,y,c)

    % Start A as an array full of ones
    A = ones(length(x),c);

    % Double for loop that assigns the correct value to each peice of A
    for i = 1:length(x)
        for j = 2:c
            A(i,j) = x(i)^(j-1);
        end
    end
    
    % Matrix math
    At = A.';
    AtA = At*A;
    Aty = At*(y.');
    
    % Solve (At*A)[a b] = At*y
    p = linsolve(AtA,Aty);

end