
clc
close all
figure()

load("eiffel1.mat")
trussplot(xnod, ynod, bars)


xvaldnod = -0.094879925587688;
yvaldnod = 4.000000000000000;
j = 258; % första noden!
n = 261;
b = zeros(2*n, 1);
b(j*2-1) = 0.08; % sätt till typ 0.08 för att se en verklighetstrogen förskjutning
x = A\b;

hold on
plot(xvaldnod, yvaldnod, "r*")

xbel = xnod + x(1:2:end);
ybel = ynod + x(2:2:end);

hold on
trussplot(xbel, ybel, bars, "r")





