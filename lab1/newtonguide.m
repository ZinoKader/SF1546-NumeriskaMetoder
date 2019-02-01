

% Ekvationen: e^x = 10*cos(x) -> e^x - 10*cos(x) = 0 (skrivet på sättet
% g(x) = x)
% För att använda Newtons metod behöver vi derivatan
% Derivatan: g'(x) = e^x  + 10*sin(x)
% tolerans 0.5*1e-8
% den positiva ligger någonstans mellan 1 och pi/2 -> 1.25

% Newtons metod: x_(i+1) = x_i - f(x)/f'(x) = g(x_i)

f = @(x) exp(x) - 10*cos(x); % ekvation
f_prim = @(x) exp(x) + 10*sin(x); % derivata
x0 = 1.25; % startgissning
tolerans = 0.5*1e-8; % tolerans
N = 0;

while err > tol && N < 100
    x1 = x0 - f(x0)/f_prim(x0);
    err = abs(x1-x0);
    x0 = x1;
    N = N + 1;
end  

% felet minskar med hälften för varje iteration!