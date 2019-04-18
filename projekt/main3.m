

T_first = pipe(800);
T_middle = pipe(1600);
T_last = pipe(3200);

nog = log2( abs(T_first(end) - T_middle(end)) / abs(T_middle(end) - T_last(end)) )