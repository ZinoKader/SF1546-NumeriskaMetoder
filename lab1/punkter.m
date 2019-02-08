

function zeropoint = punkter(X0, ra, rb, a, b, tau)
    N = 0;
    while true
        
       xa = a(1);
       ya = a(2);
       
       xb = b(1);
       yb = b(2);
       
       x1 = X0(1);
       y1 = X0(2);
       x2 = X0(3);
       y2 = X0(4);
         
       f_1 = (x1-xa)^2 + (y1-ya)^2 - ra^2;
       f_2 = (x2-xb)^2 + (y2-yb)^2 - rb^2;
       f_3 = x1^2 - xa*x1 - x2*x1 + x2*xa + y1^2 - y1*ya - y2*y1 + y2*ya;
       f_4 = x1*x2 - x1*xb - x2^2 + x2*xb + y1*y2 - y1*yb - y2^2 + y2*yb;

       F = [f_1; f_2; f_3; f_4];
       
       JF = [2*(x1-xa) 2*(y1-ya) 0 0; 0 0 2*(x2-xb) 2*(y2-yb); 2*x1-xa-x2 2*y1-ya-y2 -x1+xa -y1+ya; x2-xb y2-yb x1-2*x2+xb y1-2*y2+yb];
       
       xnew = X0 - JF\F;
       
       fel = abs(xnew-X0);
       
       if fel < tau
           break
       end
       X0 = xnew;
       N = N + 1;
    end
   format long 
   N; % ta bort semikolon för att se antal iterationer
   zeropoint = xnew;
end    
    