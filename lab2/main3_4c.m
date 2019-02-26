clc
clear
close all

n_vals = [10 20 40 80]';

[x_1, T_1] = stav(n_vals(1), 3000, 200);
[x_2, T_2] = stav(n_vals(2), 3000, 200);
[x_3, T_3] = stav(n_vals(3), 3000, 200);
[x_4, T_4] = stav(n_vals(4), 3000, 200);

figure()
hold on
plot(x_1, T_1)
plot(x_2, T_2)
plot(x_3, T_3)
plot(x_4, T_4)
legend("n = 10", "n = 20", "n = 40", "n = 80")
hold off

max_vals = [max(T_1), max(T_2), max(T_3), max(T_4)]';
min_vals = [min(T_1), min(T_2), min(T_3), min(T_4)]';
mean_vals = [mean(T_1), mean(T_2), mean(T_3), mean(T_4)]';

table_array = [n_vals, min_vals, max_vals, mean_vals];

table_trapets = array2table(table_array, 'VariableNames', {'n','min_T','max_t','medel_T'})


% vi ser att medel_T verkar förändras reguljärt - med noggranhetsordning 1
% då vi har först en differans på 27 mellan de två första värdena och sedan
% en differans på 7 mellan de två mellersta värdena osv...
% alltså ändras vår medel_t med en konstant kvot på ungefär 3,5
% det har att göra med att vi beräknade medelvärdet genom addition och
% division mellan de olika T-värdena, skulle vi istället tagit en integral
% med t.ex. trapetsmetoden skulle vi fått noggranhetsordning 2 


[x_reference, T_reference] = stav(n_vals(4), 3000, 200);
[x_upper, T_upper] = stav(n_vals(4), 3200, 210);
[x_lower, T_lower] = stav(n_vals(4), 2800, 190);

upper_error = abs(max(T_upper) - max(T_reference));
lower_error = abs(max(T_lower) - max(T_reference));

mean_error = mean([upper_error lower_error]);
disp("Maximala temperaturen är " + num2str(max(T_reference)) + " ± " + num2str(mean_error)) 



