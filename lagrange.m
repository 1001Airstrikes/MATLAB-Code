function y = lagrange(x,xx,yy)

    % intitialize y
    y = 0;
    
    % for loop that runs through every l(a)
    for a = 1:length(xx)
        
        % set l to y(a) and i to one
        l = yy(a);
        i = 1;
        
        % while loop that computes l(a)
        while i <= length(xx)
        
            % skips over an i when the time is right
            if i == a
                i = i+1;
            end
            
            % recursive l computation, incrememnt i
            l = l*((x - xx(i))/(xx(a) - xx(i)));
            i = i+1;
            
            % if on last i of last l, skip
            if a==i && a==length(xx)
                i = i+1;
            end
        
        end
        
        % add l to solution
        y = y + l;
    end
end