
clc
%figure()
figure(1)
% test av funktioner
[t, y] = feuler([0.5, 0], 5, 5/0.01);
plot(t,y(:,1),'k-')
%hold on
figure(2)
[t, y] = rk4([0.5, 0], 5, 5/0.01);
plot(t,y(:,1),'r-')


kvoter_feuler = [ ];
kvoter_rk4 = [ ];


[t_feuler, y_feuler] = feuler([0.5, 0], 5, 5/0.001); 
[t2_feuler, y2_feuler] = feuler([0.5, 0], 5, 5/0.002);
[t4_feuler, y4_feuler] = feuler([0.5, 0], 5, 5/0.004);

[t_rk4, y_rk4] = rk4([0.5, 0], 5, 5/0.001); 
[t2_rk4, y2_rk4] = rk4([0.5, 0], 5, 5/0.002);
[t4_rk4, y4_rk4] = rk4([0.5, 0], 5, 5/0.004);

% välj var fjärde för y

y_feuler = y_feuler(1:4:end,:);
y_rk4 = y_rk4(1:4:end,:);

% välj varannan för y2

y2_feuler = y2_feuler(1:2:end,:);
y2_rk4 = y2_rk4(1:2:end,:);

% välj alla för y4 (symboliskt)

y4_feuler = y4_feuler;
y4_rk4 = y4_rk4;

for i = t4_feuler
    kvot_feuler = abs((y_feuler - y2_feuler) ./ (y2_feuler - y4_feuler));
    kvoter_feuler = [kvoter_feuler; kvot_feuler];
    kvot_rk4 = abs((y_rk4 - y2_rk4) ./ (y2_rk4 - y4_rk4));
    kvoter_rk4 = [kvoter_rk4; kvot_rk4];
end

log_kvot_feuler = abs(log2(kvoter_feuler(1:10,1)));
log_kvot_rk4 = abs(log2(log2((kvoter_rk4(117:126,1)))));

kvottabell = [t4_feuler(1:10, 1), log_kvot_feuler, log_kvot_rk4];
array2table(kvottabell, 'VariableNames', {'h', 'log_kvot_feuler', 'log_kvot_rk4'})
