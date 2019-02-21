
clc
close all

% test av funktioner 
%{
[t, y] = feuler([0.5, 0], 5, 5/0.01);
plot(t,y(:,1))
hold on
[t, y] = rk4([0.5, 0], 5, 5/0.01);
plot(t,y(:,1))
%}


kvoter_feuler = [ ];
kvoter_rk4 = [ ];


[t_feuler, y_feuler] = feuler([0.5, 0.], 5, 500); 
[t2_feuler, y2_feuler] = feuler([0.5, 0], 5, 1000);
[t4_feuler, y4_feuler] = feuler([0.5, 0], 5, 2000);

[t_rk4, y_rk4] = rk4([0.5, 0], 5, 500); 
[t2_rk4, y2_rk4] = rk4([0.5, 0], 5, 1000);
[t4_rk4, y4_rk4] = rk4([0.5, 0], 5, 2000);

% plot av framåt euler första kolumns-värden för olika steglängder
feuler_fig = figure("name", "framåt euler olika h"); 
hold on
plot(t_feuler, y_feuler(:,1))
plot(t2_feuler, y2_feuler(:,1))
plot(t4_feuler, y4_feuler(:,1))
hold off

% plot av rk4 första kolumns-värden för olika steglängder
rk4_fig = figure("name", "rk4 olika h");
hold on
plot(t_rk4, y_rk4(:,1))
plot(t2_rk4, y2_rk4(:,1))
plot(t4_rk4, y4_rk4(:,1))
hold off

% extrahera första kolumnen som inne håller phi-värdena
y_feuler_phi_vals = y_feuler(:,1);
y_rk4_phi_vals = y_rk4(:,1);
y2_feuler_phi_vals = y2_feuler(:,1);
y2_rk4_phi_vals = y2_rk4(:,1);
y4_feuler_phi_vals = y4_feuler(:,1);
y4_rk4_phi_vals = y4_rk4(:,1);

% räkna kvoter av sista värdena för olika steglängder

kvot_feuler = abs( ( (y_feuler_phi_vals(end) - y_feuler_phi_vals(end-1)) - (y2_feuler_phi_vals(end) - y2_feuler_phi_vals(end-1)) ) / ( (y2_feuler_phi_vals(end) - y2_feuler_phi_vals(end-1)) - (y4_feuler_phi_vals(end) - y4_feuler_phi_vals(end-1)) ) );
kvot_rk4 =  abs( ( abs(y_rk4_phi_vals(end) - y_rk4_phi_vals(end-1)) - abs(y2_rk4_phi_vals(end) - y2_rk4_phi_vals(end-1)) ) / ( abs(y2_rk4_phi_vals(end) - y2_rk4_phi_vals(end-1)) - abs(y4_rk4_phi_vals(end) - y4_rk4_phi_vals(end-1)) ) );

log_kvot_feuler = abs(log2(kvot_feuler));
log_kvot_rk4 = abs(log2(kvot_rk4));

kvottabell = [1, log_kvot_feuler, log_kvot_rk4];
array2table(kvottabell, 'VariableNames', {'h', 'log_kvot_feuler', 'log_kvot_rk4'})
