
clc
%figure()

% test av funktion
[t, y] = feuler([0.5, 0], 5, 5/0.01);
plot(t,y(:,1))

[t, y] = rk4([0.5, 0], 5, 5/0.01);
plot(t,y(:,1))



kvoter = [ ];


[t, y] = feuler([0.5, 0], 5, 5/0.01); 
[t2, y2] = feuler([0.5, 0], 5, 5/0.02);
[t4, y4] = feuler([0.5, 0], 5, 5/0.04);


% välj var fjärde för y

y = y(1:4:end,:);

% välj varannan för y2

y2 = y2(1:2:end,:);

% välj alla för y4 (symboliskt)

y4 = y4;

for i = t4
    %kvot = abs((y - y2) / (y2 - y4));
    %kvoter = [kvoter; kvot];
    
    kvot = abs( (y - y2) ./ (y2 - y4) );
    
end

kvoter_first = abs(log2(kvot(1:10,1)));

kvottabell = [t4(1:10, 1), kvoter_first];
array2table(kvottabell, 'VariableNames', {'h', 'kvot'})
