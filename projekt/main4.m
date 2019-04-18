

f = @(a) pipe_variable_a(a) - 100;
a = 100;
b = 150;

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


