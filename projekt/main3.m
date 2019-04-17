
n = @(h) (1/h) - 1;

h_1 = 1/(6400+1);
h_2 = h_1 / 2;
h_4 = h_2 / 2;

T_first = pipe(n(h_1));
T_middle = pipe(n(h_2));
T_last = pipe(n(h_4));

nog = log2( (T_first(end) - T_middle(end)) / (T_middle(end) - T_last(end)) )