


load("eiffel1.mat")
[N_eiffel1, n_e1] = size(A);
b = zeros(N_eiffel1, 1);
tic
A\b;
time_eiffel1 = toc;


load("eiffel2.mat")
[N_eiffel2, n_e2] = size(A);
b = zeros(N_eiffel2, 1);
tic
A\b;
time_eiffel2 = toc;

load("eiffel3.mat")
[N_eiffel3, n_e3] = size(A);
b = zeros(N_eiffel3, 1);
tic
A\b;
time_eiffel3 = toc;

load("eiffel4.mat")
[N_eiffel4, n_e4] = size(A);
b = zeros(N_eiffel4, 1);
tic
A\b;
time_eiffel4 = toc;


unknowns = [N_eiffel1 ; N_eiffel2 ; N_eiffel3 ; N_eiffel4];
times = [time_eiffel1 ; time_eiffel2 ; time_eiffel3 ; time_eiffel4];

grid on
loglog(times, unknowns)
