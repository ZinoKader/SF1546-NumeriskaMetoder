clc
clear

L = 3;
k = 2;
q0 = 3000;
q1 = 200;
t0 = 290;
t1 = 400;
n = 10;
h = L / (n + 1);

Q = @(x) q0*exp((-q1*(x-0.7*L)^2)) + 200;

b = [ ];
i = 1;
for x = 2:1:n-1
    b(i) = ((h^2)/k) * Q(x*h);
    i = i + 1;
end

first = ((h^2)/k) * Q(0) + t0;
last = ((h^2)/k) * Q((n+1)*h) + t1;

b = [first b last];

twos = ones(n, 1) * 2;
ones = ones(n-1, 1) * -1;
A = diag(twos, 0) + diag(ones, 1) + diag(ones,-1);
A = sparse(A);

T = A \ b';
T = [t0; T; t1]';

plot(0:h:L, T)





