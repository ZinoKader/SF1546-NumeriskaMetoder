
function approximation = trapets(n)
    L = 2.8;
    h = L / n;
    y = @(x) pi * (8 ./ ((2+x.^2).*(6-3.*cos(pi.*x))))^2;
    a = 0;
    b = L;
    sum = 0;
    i_previous = 0;
    for i = a:h:b
        area = (i - i_previous) * ((y(i_previous) + y(i)) / 2 );
        i_previous = i;
        sum = sum + area;
    end
    approximation = sum;    
end