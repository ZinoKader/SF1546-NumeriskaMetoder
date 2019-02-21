H = 1.8;
alpha = pi/5;
clc
close all

R = H * tan(alpha);
v0 = 0.9;
u0 = [R, 0, 0, v0/R];

[t_ode45, result_ode45] = ode45(@fkula, [0 5], u0);
[t_rk4, result_rk4] = rk4kula(u0, 5, 0.05);

r_vals_ode45 = result_ode45(:,1);
r_vals_rk4 = result_rk4(:,1);
theta_vals_ode45 = result_ode45(:,2);
theta_vals_rk4 = result_rk4(:,2);

x_vals_rk4 = [ ];
y_vals_rk4 = [ ];
z_vals_rk4 = [ ];

x_vals_ode45 = [ ];
y_vals_ode45 = [ ];
z_vals_ode45 = [ ];

for i = 1:1:size(r_vals_rk4)
    x_vals_rk4 = [x_vals_rk4, r_vals_rk4(i) * cos(theta_vals_rk4(i))];
    y_vals_rk4 = [y_vals_rk4, r_vals_rk4(i) * sin(theta_vals_rk4(i))];
    z_vals_rk4 = [z_vals_rk4, r_vals_rk4(i) / tan(alpha)];
end

for i = 1:1:size(r_vals_ode45)
    x_vals_ode45 = [x_vals_ode45, r_vals_ode45(i) * cos(theta_vals_ode45(i))];
    y_vals_ode45 = [y_vals_ode45, r_vals_ode45(i) * sin(theta_vals_ode45(i))];
    z_vals_ode45 = [z_vals_ode45, r_vals_ode45(i) / tan(alpha)];
end

figure("name", "rk4 xyz-plot")
plot(t_rk4, [x_vals_rk4', y_vals_rk4', z_vals_rk4']);

figure("name", "xy-proj av ode45 och rk4")
plot(x_vals_ode45', y_vals_ode45')
hold on
plot(x_vals_rk4', y_vals_rk4')
hold off

figure("name", "RK4")
plotkula(x_vals_rk4', y_vals_rk4', z_vals_rk4')
figure("name", "ODE45")
plotkula(x_vals_ode45', y_vals_ode45', z_vals_ode45')

%legend("x", "y", "z");

