function yp=fkula(t,y)

al = pi/5;   % Spetsvinkeln
mu = 0.0;    % Friktionskoefficienten
g  = 9.81;   % Tyngaccelerationen

r   = y(1);
th  = y(2);
rp  = y(3);
thp = y(4);

v = sqrt(rp^2+(r*thp)^2 + (rp/tan(al))^2); % Hastigheten (zp=rp/tan(al))
Nm = r*thp^2*cos(al)+g*sin(al);            % Normalkraften/massan

yp=zeros(4,1);
yp(1) = rp; % r
yp(2) = thp; % theta
yp(3) = -Nm*(cos(al)+mu*rp/v) + r*thp^2;  % Accelerationen i r
yp(4) = -mu*Nm*thp/v -2*rp*thp/r;         % Accelerationen i theta






