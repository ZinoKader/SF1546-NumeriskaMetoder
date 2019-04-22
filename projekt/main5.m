

critical_a = 112.7105;

%{ 
manuell ändring av k till k = k * 1.05 i pipe_variable_a ger att
critical_a blir 118.3461

manuell ändring av k till k = k * 0.95 i pipe_variable_a ger att
critical_a blir 107.0750

manuell ändring av Ti till Ti = Ti * 1.05 i pipe_variable_a ger att
critical_a blir 120.6003

manuell ändring av Ti till Ti = Ti * 0.95 i pipe_variable_a ger att
critical_a blir 104.8208

Då har alla indata störts enskilt

Vi ser att 120.6003 skiljer sig mest ifrån referensvärdet av
critical_a på 112.7105
%}

max_disturbed_a_Ti = 120.6003;
max_disturbed_a_k = 118.3461;

max_deviation = abs(critical_a - max_disturbed_a_Ti) + abs(critical_a - max_disturbed_a_k);
percentage_error = 100 * max_deviation / critical_a;

disp("Kritiska värmeöverföringstalet är " + num2str(critical_a) + " ± " + num2str(max_deviation)) 
disp("Alternativt i procent " + num2str(percentage_error) + " %") 
