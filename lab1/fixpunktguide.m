% skapa fixpunktsiteration av funktion

% ekvationen, vi formulerar om detta till g(x) = x


f = @(x) (x^2)/20 - (11*x)/20 - (3/5)*sin(3*x + 1) + 1; 
tolerans = 1e-10; % tio korrekta decimalers tolerans
err = tol + 1;

while err > tol
    x1 = f(x0);
    err = abs(x1-x0);
    x0 = x1;
end    