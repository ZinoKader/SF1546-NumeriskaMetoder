
clc
close all
figure()

%{
L = 2.8;
n_1 = 40;
n_2 = 80;
h = L / n_1;
x_range = 0:h:L;

y = @(x) 8 ./ ((2+x.^2).*(6-3.*cos(pi.*x)));
plot(x_range, y(x_range))
axis("equal")
%}

L = 2.8;
n_ref = 1000000;
V_ref = simpson(n_ref);

Eh_trapets = @(h_) abs(V_ref - trapets(h_));
Eh_simpson = @(h_) abs(V_ref - simpson(h_));

n = 30;
iterations = 1;
E_h_values_trapets = zeros(20, 0);
E_h_values_simpson = zeros(20, 0);
h_values = zeros(20, 0);
while iterations <= 20
    n_generated = n * iterations;
    h_values(iterations) = L / n_generated;
    E_h_values_trapets(iterations) = Eh_trapets(n_generated);
    E_h_values_simpson(iterations) = Eh_simpson(n_generated);
    iterations = iterations + 1;
end    

hold on
grid on
plot(log(h_values),log(E_h_values_trapets), "r-", log(h_values), log(h_values.^2), "--", log(h_values), log(E_h_values_simpson), "b-", log(h_values), log(h_values.^4), ":")
legend('p2', 'Error trapets', 'p4', 'Error simpson')
