
n = 800;
q = 5;

f = @(a) pipe_variable_a(n, a) - 100;
a = 100;
b = 150;

c = 1;
tol = @(q) 10^(-q);


while abs(f(c)) > tol(q)
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


disp("n: " + num2str(n)) 
disp("q: " + num2str(q)) 
disp("Beräknad alpha: " + num2str(c)) 