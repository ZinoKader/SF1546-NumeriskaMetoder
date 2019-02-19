function [t, y] = rk4(u0, T, n)
    
    m = 0.6;
    L = 1.5;
    g = 9.81;
    u = 0.2;
    h = T / n;
    
    t_values = [ ];
    f_values = [ ];
   
    for i = 0:h:T
        
        k11 = [(-u/m) * u0(2) - (g/L) * sin(u0(1))];
        k12 = [u0(2)];
        
        k21 = [(-u/m) * u0(2) - (g/L) * sin(u0(1)) + (h/2) * k11];
        k22 = [u0(2) + (h/2)];
        
        k31 = [(-u/m) * u0(2) - (g/L) * sin(u0(1)) + (h/2) * k21];
        k32 = [u0(2) + (h/2)];
        
        k41 = [(-u/m) * u0(2) - (g/L) * sin(u0(1)) + h * k31];
        k42 = [u0(2) + (h/2)];
        
        u0 = u0 + (h/6) * ([k11 k12] + 2*[k21 k22] + 2*[k31 k32] + [k41 k42]);
        
        f_values = [f_values; u0];
        t_values = [t_values; i];
    end    
        
    
    t = t_values;
    y = f_values;
end

