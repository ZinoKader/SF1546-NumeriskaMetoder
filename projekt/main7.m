
n = 1600;

f = @(t) pipe_variable_k_last_temp(n, t) - 100;
a = 0;
b = 1;

c = 1;
tol = 1e-5;


while abs(f(c)) > tol
    a_val = f(a);
    b_val = f(b);
    c = (a + b) / 2;
    c_val = f(c);
    
    if sign(a_val) == sign(c_val)
        a = c;
    elseif sign(b_val) == sign(c_val)
        b = c;
    end 
end    


disp("Beräknad tjocklek: " + num2str(c)) 