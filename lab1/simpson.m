
function approximation = simpson(n)
    L = 2.8;
    h = L / n;
    y = @(x) pi * (8 / ((2+x^2)*(6-3*cos(pi*x))))^2;
    sum = 0;
    iterations = 0;
    for i = 0:h/2:L
        if i == 0 || i == L % om första eller sista
            sum = sum + y(i);
        elseif mod(iterations, 2) == 0 % even
            sum = sum + 2*y(i);
        else % odd
            sum = sum + 4*y(i); % odd
        end    
        iterations = iterations + 1;
    end
    approximation = (h/6) * sum; 
end