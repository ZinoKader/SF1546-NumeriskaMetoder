H = 1.8;
alpha = pi/5;
clc
close all

R = H * tan(alpha);
v0 = 0.9;
u0 = [R, 0, 0, v0/R];


%fkula(0, u0)
[t, result] = rk4kula(u0, 5, 0.05);

r_vals = result(:,1);
theta_vals = result(:,2);

x_vals = [ ];
y_vals = [ ];
z_vals = [ ];

for i = 1:1:size(r_vals)
    x_vals = [x_vals, r_vals(i) * cos(theta_vals(i))];
    y_vals = [y_vals, r_vals(i) * sin(theta_vals(i))];
    z_vals = [z_vals, r_vals(i) / tan(alpha)];
end

plot(t, [x_vals', y_vals', z_vals']);
figure(2)
%plot(x_vals', y_vals')

legend("x", "y", "z");

