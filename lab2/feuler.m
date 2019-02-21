function [t, y] = feuler(u0, T, n)
    
    m = 0.6;
    L = 1.5;
    g = 9.81;
    u = 0.2;
    h = T / n;
    
    t_values = [ ];
    f_values = [ ];
   
    for i = 0:h:T
        % [z1 ; -u/m *z1(t) - g/L * sin(z0(t))]
        u0 = u0 + h * [u0(2), (-u/m) * u0(2) - (g/L) * sin(u0(1))];
        f_values = [f_values; u0];
        t_values = [t_values; i];
    end          
    
    t = t_values;
    y = f_values;
end

