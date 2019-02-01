

function zeropoint = fixpunkt(x0, tau)
    N = 0;
    while true
       xnplusett = (1/20 * (x0^2)) + (11/20 * x0) - (3/5 * sin(3*x0 + 1)) + 1; % + x på båda sidorna av ekvationen
       fel = abs(xnplusett-x0);
       %disp(["Fel: ", num2str(fel, 3), "xnplusett: ", num2str(xnplusett, 10)])
       if fel < tau
           break
       end
       x0 = xnplusett;
       N = N + 1;
    end
   format long 
   N; % ta bort semikolon för att se antal iterationer
   zeropoint = xnplusett;
end    
    