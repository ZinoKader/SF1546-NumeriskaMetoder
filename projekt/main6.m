



N = 12800;
insulation_thickness = 0.3;
[T_values, r_values] = pipe_variable_k(N, insulation_thickness);


plot(r_values, T_values);
legend("Temperatur i röret (1 <= r <= 2.3)");
title("Temperatursfördelning för N = 12800");
xlabel("Avstånd fr. inre radie")
ylabel("Temperatur")
