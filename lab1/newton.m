

function zeropoint = newton(x0, tau)
    N = 0;
    while true
       f = x0^2 - 9*x0 - 12*sin(3*x0+1) + 20;
       fprim = 2*x0 - 9 - 36*cos(3*x0+1);
       xnew = x0 - f/fprim;
       fel = abs(xnew-x0);
       disp(["Fel: ", num2str(fel, 3), "xnew: ", num2str(xnew, 10)])
       if fel < tau
           break
       end
       x0 = xnew;
       N = N + 1;
    end
   format long 
   N; % ta bort semikolon för att se antal iterationer
   zeropoint = xnew;
end    
    