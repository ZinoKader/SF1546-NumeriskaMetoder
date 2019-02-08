
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
text(a(1) + 0.15, a(2), "A")
plot( (rb*cos(angle) + b(1)), (rb*sin(angle) + b(2)) )
plot(b(1), b(2), "ko")
text(b(1) + 0.15, b(2), "B")
plot( (rc*cos(angle) + c(1)), (rc*sin(angle) + c(2)) )
plot(c(1), c(2), "ko")
text(c(1) + 0.15, c(2), "C")

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


% längder

root_distance = @(rot1x, rot1y, rot2x, rot2y) sqrt( (rot2y - rot1y)^2 + (rot2x - rot1x)^2 );
angle_roots = @(radius, distance_roots) acos((2*(radius^2) - distance_roots^2)/(2*(radius^2)));

[rota1x, rota1y] = deal(XROT_ab(1), XROT_ab(2));
[rota2x, rota2y] = deal(XROT_ac(1), XROT_ac(2));

[rotb1x, rotb1y] = deal(XROT_ab(3), XROT_ab(4));
[rotb2x, rotb2y] = deal(XROT_bc(1), XROT_bc(2));

[rotc1x, rotc1y] = deal(XROT_bc(3), XROT_bc(4));
[rotc2x, rotc2y] = deal(XROT_ac(3), XROT_ac(4));

distance_roots_a = root_distance(rota1x, rota1y, rota2x, rota2y);
angle_roots_a = angle_roots(ra, distance_roots_a);
circular_distance_a = (angle_roots_a / (2*pi)) * 2*pi*ra;

distance_roots_b = root_distance(rotb1x, rotb1y, rotb2x, rotb2y);
angle_roots_b = angle_roots(rb, distance_roots_b);
circular_distance_b = (angle_roots_b / (2*pi)) * 2*pi*rb;

distance_roots_c = root_distance(rotc1x, rotc1y, rotc2x, rotc2y);
angle_roots_c = angle_roots(rc, distance_roots_c);
circular_distance_c = (angle_roots_c / (2*pi)) * 2*pi*rc;

distance_ab = root_distance(XROT_ab(1), XROT_ab(2), XROT_ab(3), XROT_ab(4));
distance_ac = root_distance(XROT_ac(1), XROT_ac(2), XROT_ac(3), XROT_ac(4));
distance_bc = root_distance(XROT_bc(1), XROT_bc(2), XROT_bc(3), XROT_bc(4));

all_distances = [circular_distance_a, circular_distance_b, circular_distance_c, distance_ab, distance_ac, distance_bc];
total_distance_sum = sum(all_distances)


xlim([-3 4.5])
ylim([-5 3.5])
