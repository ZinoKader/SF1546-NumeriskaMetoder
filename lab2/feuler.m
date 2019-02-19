function [t, y] = feuler(u0, T, n)
    
    m = 0.6;
    L = 1.5;
    g = 9.81;
    u = 0.2;
    h = T / n;
    
    t_values = [ ];
    f_values = [ ];
    
    f_next = u0;
   
    for i = 0:h:T
        % [z1 ; -u/m *z1(t) - g/L * sin(z0(t))]
        f_next = f_next + h * [f_next(2), (-u/m) * f_next(2) - (g/L) * sin(f_next(1))];

        f_values = [f_values; f_next];
        t_values = [t_values; i];
    end    
        
    
    t = t_values;
    y = f_values;
end

