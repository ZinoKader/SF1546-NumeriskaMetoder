function q=plotkula(x,y,z,anim)

al  = pi/5;
H   = 1.8;

r0  = H*tan(al);

r = 0:r0/10:r0;
th = 0:pi/40:2*pi;
[R,TH]=meshgrid(r,th);

X = R.*cos(TH);
Y = R.*sin(TH);
Z = sqrt(X.^2+Y.^2)/tan(al);

surf(X,Y,Z)
view(-80,20)
colormap(gray)
shading interp
alpha(0.6)
axis off
hold on

if (nargin == 3)
    plot3(x,y,z);
else
    N=length(x);
    dt = anim/4;
    n=1:N;
    nn = 1:dt:N;
    xx = interp1(n,x,nn,'pchip');
    yy = interp1(n,y,nn,'pchip');
    zz = interp1(n,z,nn,'pchip');
    comet3(xx,yy,zz);
end

hold off

