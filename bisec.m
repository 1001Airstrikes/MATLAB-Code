function xroot = bisec(f,a,b,s)

    % Find first xroot, which is in the middle between a and b
    xroot = (b-a)/2+a;
    
    % Intialize dx to 1 and i to 0 to keep track of the number of
    % iterations
    dx = 1;
    i = 0;
    
    % while loop that is the meat of the bisection method. It runs until
    % the desired accuracy is reached
    while abs(dx) >= s
        
        % See if positive or negative
        p = f(a)*f(xroot);
        
        % If +, make xroot the new a. Otherwise, make it the new b
        if p>0
            a = xroot;
        else
            b = xroot;
        end
        
        % Save the old xroot
        dx = xroot;
        
        % Find the new xroot (the new middle)
        xroot = (b-a)/2+a;
        
        % Find the change in x using the saved old xroot value from before
        dx = xroot-dx;
        
        % Increment iteration count
        i = i+1;
    end
    
    % Uncomment to display i if desired
    i
end