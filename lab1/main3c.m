
clc
close all
figure()

X0 = [3; 4; 7; 3.4];
X1 = [-1.4; 1.6; -1; -2];
X2 = [3; -5; -5; -5];

ra = 0.6;
rb = 0.9;
rc = 1.5;
a = [-1; 2];
b = [3; 0];
c = [0.5; -2.5];
tau = 10^-10;

XROT_ab = punkter(X0, ra, rb, a, b, tau)
XROT_ac = punkter(X1, ra, rc, a, c, tau)
XROT_bc = punkter(X2, rb, rc, b, c, tau)

angle = linspace(0, 2*pi, 360);

hold on
% a till b
plot( (ra*cos(angle) + a(1)), (ra*sin(angle) + a(2)) )
plot(a(1), a(2), "ko")
plot( (rb*cos(angle) + b(1)), (rb*sin(angle) + b(2)) )
plot(b(1), b(2), "ko")
plot( (rc*cos(angle) + c(1)), (rc*sin(angle) + c(2)) )
plot(c(1), c(2), "ko")

hold on
plot(XROT_ab(1), XROT_ab(2), "k*")
plot(XROT_ab(3), XROT_ab(4), "k*")
plot([XROT_ab(1) XROT_ab(3)], [XROT_ab(2) XROT_ab(4)])

hold on
plot(XROT_ac(1), XROT_ac(2), "k*")
plot(XROT_ac(3), XROT_ac(4), "k*")
plot([XROT_ac(1) XROT_ac(3)], [XROT_ac(2) XROT_ac(4)])

hold on
plot(XROT_bc(1), XROT_bc(2), "k*")
plot(XROT_bc(3), XROT_bc(4), "k*")
plot([XROT_bc(1) XROT_bc(3)], [XROT_bc(2) XROT_bc(4)])

axis("equal")



xlim([-5 5])
ylim([-5 5])
