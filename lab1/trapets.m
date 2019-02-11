
function approximation = trapets(n)
    L = 2.8;
    h = L / n;
    y = @(x) pi * (8 / ((2+x^2)*(6-3*cos(pi*x))))^2;
    sum = 0;
    for i = 0:h:L
        if i == 0 || i == L % om första eller sista
            sum = sum + y(i); 
        else
           sum = sum + 2*y(i); 
        end    
    end
    approximation = (h/2) * sum;    
end