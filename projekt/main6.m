



N = 12800;
insulation_thickness = 0.3;
[T_values, r_values] = pipe_variable_k(N, insulation_thickness);


plot(r_values, T_values);
legend("Temperatur i röret (1 <= r <= 2.3)");
title("Temperatursfördelning för N = 12800");
xlabel("Avstånd fr. inre radie")
ylabel("Temperatur")

%{
N = 25;
T_outer_values = [];
N_values = [];

for i = 1:1:6
    T_values = pipe(N);
    T_outer_values = [T_outer_values, T_values(end)];
    N_values = [N_values, N];
    N = N * 2;
end    

T_outer_values';
N_values';

difference = abs(T_outer_values(end) - T_outer_values(end-1))

%}