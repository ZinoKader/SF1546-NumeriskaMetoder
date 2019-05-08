

n = 25;


h_values = [];
u_values = [];
log2_values = [];

for i = 1:1:6
    T_first = pipe(n);
    T_middle = pipe(n*2);
    T_last = pipe(n*4);
    h = 1 / n;
    nog = log2( abs(T_first(end) - T_middle(end)) / abs(T_middle(end) - T_last(end)) );
    
    u_values = [u_values, T_first(end)];
    h_values = [h_values, h];
    log2_values = [log2_values, nog];
    
    n = n * 2;
end    

final_matrix = [h_values', u_values', log2_values'];

table_nog = array2table(final_matrix, 'VariableNames', {'h', 'uh', 'log2( ( u_h - u_(h/2) ) / ( u_(h/2) - u_(h/4) )'})

