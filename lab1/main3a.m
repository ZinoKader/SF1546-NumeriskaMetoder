
clc
close all
figure()

X0 = [-1.5; 2; 2; 1.5];
XTEST1 = [0; 0; 0; 0];
XTEST2 = [1; 2; 3; 4];

ra = 0.6;
rb = 1.5;
a = [-1.5; 0.5];
b = [2; 0];
tau = 10^-10;

XROT = punkter(X0, ra, rb, a,b, tau)

angle = linspace(0, 2*pi, 360);

hold on
plot( (ra*cos(angle) + a(1)), (ra*sin(angle) + a(2)) )
plot(a(1), a(2), "ko")
plot( (rb*cos(angle) + b(1)), (rb*sin(angle) + b(2)) )
plot(b(1), b(2), "ko")
plot(XROT(1), XROT(2), "k*")
plot(XROT(3), XROT(4), "k*")
plot([XROT(1) XROT(3)], [XROT(2) XROT(4)])
axis("equal")

xlim([-5 5])
ylim([-5 5])
