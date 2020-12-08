function x = sGS(x,Al,Ad,Au,b)
    % Make AL and AU
    AL = Al + Ad;
    AU = Au + Ad;
    
    % Make AL and AU inverse
    ALi = inv(AL)
    AUi = inv(AU)
    
    % Make bl and bu
    bl = ALi*b
    bu = AUi*b
    
    % Make the decisive matrix
    Df = ALi*Au
    Db = AUi*Al
    D = Df*Db
    
    % Find the spectral radius
    rho = max(abs(eig(D)))
    
    % Start iteration count at zero
    i = 0;

    % Do 60 iterations
    while i < 60
        
        % Find new values
        x = bl-Df*x;
        x = bu-Db*x;
        
        % Increase iteration count by one
        i = i+1;
    end
end