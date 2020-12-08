function y = fact(x)
    if x <= 0
        x = 1;
    end
    y = x;
    x = x-1;
    while x > 0
        y = y*x;
        x = x-1;
    end
end