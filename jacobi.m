function out = jacobi(f,g,h)

    % Start iterations and variables at 0
    i = 0;
    x = 0;
    y = 0;
    z = 0;

    % Do 100 iterations
    while i < 100

        % Find new values
        x2 = f(y,z);
        y2 = g(x,z);
        z2 = h(x,y);
        
        % Apply new values
        x = x2;
        y = y2;
        z = z2;

        % Increase iteration count
        i = i+1;

    end
    % Output values in an 3x1 matrix
    out = [double(x); double(y); double(z)];
end