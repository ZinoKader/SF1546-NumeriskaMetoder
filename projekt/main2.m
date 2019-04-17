

N = 12800;
[T_values, r_values] = pipe(N);


plot(r_values, T_values);
legend("Temperatur i röret (1 <= r <= 2)");
title("Temperatursfördelning för N = 12800");
xlabel("Avstånd fr. inre radie")
ylabel("Temperatur")
