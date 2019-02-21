H = 1.8;
alpha = pi/5;
clc
close all

m = 1;
g = 9.81;
R = H * tan(alpha);
v0 = 0.9;
u0 = [R, 0, 0, v0/R];

[t_ode45, result_ode45] = ode45(@fkula, [0 125], u0);
[t_rk4_long, result_rk4_long] = rk4kula(u0, 125, 0.05);
[t_rk4_short, result_rk4_short] = rk4kula(u0, 125, 0.01);

% r-värden (kolumn 1, radie)
r_vals_ode45 = result_ode45(:,1);
r_vals_rk4_long = result_rk4_long(:,1);
r_vals_rk4_short = result_rk4_short(:,1);

% r-prim-värden (kolumn 3, radiell acceleration)
rprim_vals_ode45 = result_ode45(:,3);
rprim_vals_rk4_long = result_rk4_long(:,3);
rprim_vals_rk4_short = result_rk4_short(:,3);

% theta-prim-värden (kolumn4, vinkelacceleration)
thetaprim_vals_ode45 = result_ode45(:,4);
thetaprim_vals_rk4_long = result_rk4_long(:,4);
thetaprim_vals_rk4_short = result_rk4_short(:,4);

x_vals_rk4_long = [ ];
y_vals_rk4_long = [ ];
z_vals_rk4_long = [ ];

x_vals_rk4_short = [ ];
y_vals_rk4_short = [ ];
z_vals_rk4_short = [ ];

x_vals_ode45 = [ ];
y_vals_ode45 = [ ];
z_vals_ode45 = [ ];

for i = 1:1:size(r_vals_rk4_long)
    z_vals_rk4_long = [z_vals_rk4_long, r_vals_rk4_long(i) / tan(alpha)];
end

for i = 1:1:size(r_vals_rk4_short)
    z_vals_rk4_short = [z_vals_rk4_short, r_vals_rk4_short(i) / tan(alpha)];
end


for i = 1:1:size(r_vals_ode45)
    z_vals_ode45 = [z_vals_ode45, r_vals_ode45(i) / tan(alpha)];
end


v = @(r, rprim, thetaprim) sqrt( (rprim^2) + ((r*thetaprim)^2) + ((rprim/(tan(alpha)))^2) ); % kulans hastighet
l = @(r, m, thetaprim) m * (r^2) * thetaprim; % rörelsemängdsmoment
e = @(m, v, z) ((m * (v^2))/2) + (m*g*z); % total energi (kintetisk + läges)


l_vals_rk4_short = zeros(size(r_vals_rk4_short, 1), 1);
l_vals_rk4_long = zeros(size(r_vals_rk4_long, 1), 1);
l_vals_ode45 = zeros(size(r_vals_ode45, 1), 1);

e_vals_rk4_short = zeros(size(r_vals_rk4_short, 1), 1);
e_vals_rk4_long = zeros(size(r_vals_rk4_long, 1), 1);
e_vals_ode45 = zeros(size(r_vals_ode45, 1), 1);


% loop för l_vals_rk4_short
for i = 1:1:size(r_vals_rk4_short)
    l_vals_rk4_short(i) = l(r_vals_rk4_short(i), m, thetaprim_vals_rk4_short(i));
end

% loop för l_vals_rk4_long
for i = 1:1:size(r_vals_rk4_long)
    l_vals_rk4_long(i) = l(r_vals_rk4_long(i), m, thetaprim_vals_rk4_long(i));
end

% loop för l_vals_ode45
for i = 1:1:size(r_vals_ode45)
    l_vals_ode45(i) = l(r_vals_ode45(i), m, thetaprim_vals_ode45(i));
end

% loop för e_vals_rk4_short
for i = 1:1:size(r_vals_rk4_short)
    v_temp = v(r_vals_rk4_short(i), rprim_vals_rk4_short(i), thetaprim_vals_rk4_short(i));
    e_vals_rk4_short(i) = e(m, v_temp, z_vals_rk4_short(i));
end

% loop för e_vals_rk4_long
for i = 1:1:size(r_vals_rk4_long)
    v_temp = v(r_vals_rk4_long(i), rprim_vals_rk4_long(i), thetaprim_vals_rk4_long(i));
    e_vals_rk4_long(i) = e(m, v_temp, z_vals_rk4_long(i));
end

% loop för e_vals_ode45
for i = 1:1:size(r_vals_ode45)
    v_temp = v(r_vals_ode45(i), rprim_vals_ode45(i), thetaprim_vals_ode45(i));
    e_vals_ode45(i) = e(m, v_temp, z_vals_ode45(i));
end


% plot av L - här ser vi att rk4 med kort steglängd är bäst, sedan rk4_long
% och sist ode45
figure("name", "RÖRELSEMÄNGDSMOMENT")
hold on
plot(t_rk4_short, l_vals_rk4_short)
plot(t_rk4_long, l_vals_rk4_long)
plot(t_ode45, l_vals_ode45)
legend("rk4 short", "rk4 long", "ode45")
hold off

% plot av E
figure("name", "ENERGI")
hold on
plot(t_rk4_short, e_vals_rk4_short)
plot(t_rk4_long, e_vals_rk4_long)
plot(t_ode45, e_vals_ode45)
legend("rk4 short", "rk4 long", "ode45")
hold off



