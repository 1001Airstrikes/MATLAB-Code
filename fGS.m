function x = fGS(x,Al,Ad,Au,b)

    % Make AL
    AL = Al + Ad;
    
    % Make AL inverse
    ALi = inv(AL)
    
    % Make bnew
    bnew = ALi*b
    
    % Make the decisive matrix
    D = ALi*Au
    
    % Find the spectral radius
    rho = max(abs(eig(D)))
    
    % Start iteration count at zero
    i = 0;

    % Do 100 iterations
    while i < 100
        
        % Find new values
        x = bnew-D*x;
        
        % Increase iteration count by one
        i = i+1;
    end
end