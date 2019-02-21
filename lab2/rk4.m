function [t, y] = rk4(u0, T, n)
    
    m = 0.6;
    L = 1.5;
    g = 9.81;
    u = 0.2;
    h = T / n;
    
    t_values = [ ];
    f_values = [ ];
   
    for i = 0:h:T
        
        k1 = [u0(2), (-u/m) * u0(2) - (g/L) * sin(u0(1))];
        
        k2 = [u0(2) + (h/2), (-u/m) * u0(2) - (g/L) * sin(u0(1)) + (h/2) * k1(2)];
        
        k3 = [u0(2) + (h/2), (-u/m) * u0(2) - (g/L) * sin(u0(1)) + (h/2) * k2(2)];
        
        k4 = [u0(2) + h, (-u/m) * u0(2) - (g/L) * sin(u0(1)) + h * k3(2)];
        
        u0 = u0 + (h/6) * (k1 + 2*k2 + 2*k3 + k4);
        
        f_values = [f_values; u0];
        t_values = [t_values; i];
    end    
        
    t = t_values;
    y = f_values;
end

