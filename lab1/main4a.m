
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
n = 80;
n_ref = 1000;
h = L/n;
h_values = h:h:L;

V_ref = simpson(n_ref);

E_h_trapets = zeros(0,n);
for i = 1:1:n
   V = trapets(i);
   E_h_trapets(i) = abs(V_ref - V);
end    

x = h_values;

loglog(h_values, E_h_trapets)
grid on
