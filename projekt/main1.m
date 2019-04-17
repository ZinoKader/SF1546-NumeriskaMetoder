

N = 25;

T_outer_values = [];
N_values = [];

for i = 1:1:11
    T_values = pipe(N);
    T_outer_values = [T_outer_values, T_values(end)];
    N_values = [N_values, N];
    N = N * 2;
end    

T_outer_values';
N_values';

difference = abs(T_outer_values(end) - T_outer_values(end-1))