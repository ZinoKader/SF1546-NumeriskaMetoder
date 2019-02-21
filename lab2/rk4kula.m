function [t, y] = rk4(u0, T, h) 
    
    t_values = [ ];
    f_values = [ ];
    
    u0 = u0';
   
    for i = 0:h:T 
        
        k1 = fkula(0, u0);
        
        k2 = fkula(0 + (h/2), u0 + (h/2) * k1);
       
        k3 = fkula(0 + (h/2), u0 + (h/2) * k2);
        
        k4 = fkula(0 + h, u0 + h * k3);
        
        u0 = u0 + (h/6) * (k1 + 2*k2 + 2*k3 + k4);
        
        f_values = [f_values; u0'];
        t_values = [t_values; i];
    end    
        
    t = t_values;
    y = f_values;
end

