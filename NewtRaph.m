function x = NewtRaph(f,x,s)

    % Find the derivative of the given function
    df = diff(f);
    
    % Intialize dx to 1 and i to 0 to keep track of the number of
    % iterations
    dx = 1;
    i = 0;
    
    % While loop that is the Newton Raphson method. Runs until
    % the desired accuracy is reached
    while abs(dx) >= s
        
        % Do some weird math I don't really understand to find how much x
        % should change
        dx = double(-f(x)/df(x))
        
        % Change x by the discovered amount
        x = x + dx
        
        % Increment iteration count
        i = i+1;
    end
    
    % If desired uncomment below to display i
    i
end