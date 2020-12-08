function y = newton(x,xx,yy)

    % set a to y data
    a = yy;
    
    % compute a by doing operations on itself
    for b = 1:length(yy)
        for i = (1+b):length(yy)
            a(i) =  (a(i)-a(b))/(xx(i)-xx(b));
        end
    end
    
    % start the solution
    y = a(length(yy));
    
    % loop that does the calculations
    for i = length(yy)-1:-1:1
       y = y*(x-xx(i))+a(i); 
    end
end