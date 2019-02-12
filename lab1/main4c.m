

kolumner = 10;

format long
V_kvot_t = zeros(1,kolumner);
V_h_t = zeros(1,kolumner) ;
V_h2_t = zeros(1,kolumner);
V_h4_t = zeros(1,kolumner);

V_kvot_s = zeros(1,kolumner);
V_h_s = zeros(1,kolumner) ;
V_h2_s = zeros(1,kolumner);
V_h4_s = zeros(1,kolumner);

h = zeros(1, kolumner);

k = 1;
n = 304;
while k <= 10
   n_generated = n * k;
   h(k) = 2.8 / n_generated;
   V_h_t(k) = trapets(n_generated);
   V_h2_t(k) = trapets((n_generated/2));
   V_h4_t(k) = trapets((n_generated/4));
   V_kvot_t(k) = abs((V_h_t(k) - V_h2_t(k))/(V_h2_t(k) - V_h4_t(k))); 
   
   V_h_s(k) = simpson(n_generated);
   V_h2_s(k) = simpson((n_generated/2));
   V_h4_s(k) = simpson((n_generated/4));
   V_kvot_s(k) = abs((V_h_s(k) - V_h2_s(k))/(V_h2_s(k) - V_h4_s(k))); 
   
   k = k + 1;
end

array_trapets = [h' V_h_t' V_h2_t' V_h4_t' V_kvot_t', abs(log2(V_kvot_t'))];
array_simpson = [h' V_h_s' V_h2_s' V_h4_s' V_kvot_s', abs(log2(V_kvot_s'))];

table_trapets = array2table(array_trapets, 'VariableNames', {'Steg_h','V_h','V_h2','V_h4','V_kvot', 'log2_V_kvot'});
table_simpson = array2table(array_simpson, 'VariableNames', {'Steg_h','V_h','V_h2','V_h4','V_kvot', 'log2_V_kvot'});

disp("----------------------------------------")
disp("TRAPETS TABLE")
disp(table_trapets)
disp("----------------------------------------")
disp("SIMPSON TABLE")
disp(table_simpson)
disp("----------------------------------------")


